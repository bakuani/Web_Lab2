let rValue = NaN;
let activeButton = null;
function setR(value) {
    const button = document.getElementById('button' + value);

    if (activeButton === button) {
        button.style.backgroundColor = '#fde881';
        rValue = NaN;
        activeButton = null;
    } else {
        document.querySelectorAll('.r').forEach(btn => btn.style.backgroundColor = '#fde881');

        button.style.backgroundColor = '#ffb366';
        rValue = value;
        activeButton = button;
    }
}

document.getElementById('checkButton').addEventListener('click', function() {
    const checkboxes = document.querySelectorAll('input[name="coordinates"]:checked');
    const yValue = parseFloat(document.getElementById('y').value);
    const errorDiv = document.getElementById('error');

    let errorMessages = [];

    if (checkboxes.length != 1 ) {
        errorMessages.push('Ошибка: нужно выбрать только один вариант X!');
    }

    if (isNaN(yValue) || yValue < -3 || yValue > 5) {
        errorMessages.push('Ошибка: введите в Y число от -3 до 5!');
    }

    if (isNaN(rValue) || rValue < 1 || rValue > 5) {
            errorMessages.push('Ошибка:Выберите одно из предложенных значений R!');
    }

    if (errorMessages.length > 0) {
        errorDiv.innerHTML = errorMessages.join('<br>');
        errorDiv.style.display = 'block';
    } else {
        errorDiv.textContent = '';
    }

    if (errorMessages.length != 0){
        return;
    }

    const xValue = parseFloat(checkboxes[0].value);


    const requestData = {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            x: xValue,
            y: yValue,
            r: rValue
        })
    };

    fetch('/Web2/controllerServlet', requestData)
        .then(response => response.json())
        .then(data => {
            console.log(data);
            addDataRow(xValue, yValue, rValue, data['hit']);
        })
        .catch(error => {
            console.error('Ошибка при отправке данных:', error);
        });
});

function addDataRow(x, y, r, hit, time) {
    const tableBody = document.querySelector("#data-table tbody");
    const newRow = document.createElement("tr");

    newRow.innerHTML = `
        <td>${x}</td>
        <td>${y}</td>
        <td>${r}</td>
         <td>${hit ? 'Да' : 'Нет'}</td>
    `;

    tableBody.appendChild(newRow);


}

document.getElementById('coordinate-plane').addEventListener('click', function(event) {
    const errorDiv = document.getElementById('error');
            let errorMessages = [];

            if (isNaN(rValue)) {
                errorMessages.push("Ошибка: радиус не выбран!");
                errorDiv.innerHTML = errorMessages.join('<br>');
                errorDiv.style.display = 'block';
                return;
            } else {
                errorDiv.textContent = '';
            }


    const svg = event.currentTarget;
    const svgRect = svg.getBoundingClientRect();
    const svgWidth = svgRect.width;
    const svgHeight = svgRect.height;

    const centerX = svgWidth / 2;
    const centerY = svgHeight / 2;

    const x = event.clientX - svgRect.left - centerX;
    const y = centerY - (event.clientY - svgRect.top);


    const scaledX = Number(((x / (svgWidth / 2)) * rValue * 2).toFixed(2));
    const scaledY = Number(((y / (svgHeight / 2)) * rValue * 2).toFixed(2));

    const requestData = {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            x: scaledX,
            y: scaledY,
            r: rValue
        })
    };

    fetch('/Web2/controllerServlet', requestData)
        .then(response => response.json())
        .then(data => {
            console.log(data);
            addPointToSVG(x, y, rValue, data['hit']);
            addDataRow(scaledX, scaledY, rValue, data['hit']);
        })
        .catch(error => {
            console.error('Ошибка при отправке данных:', error);
        });
});

function addPointToSVG(x, y, r, hit) {
    const svg = document.getElementById("coordinate-plane");

    const xNormalized = x + 150;
    const yNormalized = 150 - y;

    const point = document.createElementNS("http://www.w3.org/2000/svg", "circle");
    point.setAttribute('cx', xNormalized);
    point.setAttribute('cy', yNormalized);
    point.setAttribute('r', 2.5);
    point.setAttribute('fill', hit ? 'green' : 'red');

    svg.appendChild(point);
}
