<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Point" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Лаба 2</title>
    <style>
        .container {
    margin-left: 8%;
    margin-right: 8%;
    display: grid;
    grid-template-columns: 25% 25% 25% 25%;
    grid-template-rows: auto auto auto 10% auto auto;
    grid-template-areas:
        "header header header header"
        "x y sidebar sidebar"
        "x r sidebar sidebar"
        "error error . ."
        "button button . ."
        "footer footer footer footer";
    height: 100vh;
}

        .item {
            padding: 1%;
        }

        .item_1 {
            margin-left: 20%;
            margin-right: 20%;
            text-align: center;
            padding: 1em 30px;
            font-size: 80%;
            color: #000000;
            background-color: #C1FF9E;
            grid-area: header;
            width: auto;
            margin-bottom: 3%;
            border-radius: 30px;

        }

        .item_2 {
            grid-area: x;
            width: auto;
            color: #000000;
            background-color: #C1FF9E;
            border-top-left-radius: 15px;
            padding: 5%;
        }
        .X {
            --size: 35px;
        }

          .X input[type="checkbox"] {
            -webkit-appearance: none;
            width: var(--size);
            height: calc(var(--size) / 2);
            background-color: #fff;
            border: 3px solid #222;
            border-radius: 30px 100px 100px 100px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
            outline: none;
            cursor: pointer;
            position: relative;
            transition: all 0.5s;
          }

          .X input[type="checkbox"]::before {
            content: "";
            position: absolute;
            width: calc(var(--size) / 2);
            height: calc(var(--size) / 2);
            left: 0;
            top: 50%;
            transform: translateY(-50%) scale(0.7);
            border: 3px solid #222;
            border-radius: 30px 100px 100px 100px;
            background-color: #fde881;
            box-sizing: border-box;
            transition: all 0.5s;
          }

          .X input[type="checkbox"]:checked {
            background-color: #fde881;
            border-radius: 100px 100px 30px 100px;
          }

          .X input[type="checkbox"]:checked::before {
            left: 50%;
            background-color: #fff;
            border-radius: 100px 100px 30px 100px;
          }


        .item_3 {
            grid-area: y;
            color: #000000;
            background-color: #C1FF9E;
            border-top-right-radius: 15px;
            padding: 5%;

            }


        .item_3 input[type="text"] {
            width: 100%;
            padding: 8px;
            font-size: 12px;
            box-sizing: border-box;
            min-width: 0;
            max-width: 100%;

        }

        .item_4 {
            grid-area: r;
            color: #000000;
            background-color:#C1FF9E;
            padding: 5%;
        }
        .r {
            background-color: #fde881;
        }
        path:hover {
            fill: rgba(0, 255, 0, 0.5);
            cursor: pointer;
        }

        polygon:hover {
            fill: rgba(0, 255, 0, 0.5);
            cursor: pointer;
        }

        rect:hover {
            fill: rgba(0, 255, 0, 0.5);
            cursor: pointer;
        }

        .item_5 {
            grid-area: sidebar;
            margin: auto;
        }

        .item_6 {
            grid-area: footer;
        }


        .item_7{
            grid-area: button;
            padding-bottom: 5%;
            text-align: center;
            border-bottom-left-radius: 15px;
            border-bottom-right-radius: 15px;
            color: #000000;
            background-color: #C1FF9E;
        }

        .Button {
           background-color: #fde881;
          border: 2px solid black;
          border-radius: 30px;
          box-shadow: black 4px 4px 0 0;
          color: #422800;
          cursor: pointer;
          display: inline-block;
          font-weight: 600;
          font-size: 18px;
          padding: 0 18px;
          line-height: 50px;
          text-align: center;
          text-decoration: none;
          user-select: none;
          -webkit-user-select: none;
          touch-action: manipulation;
        }

        .Button:hover {
          background-color: #fff;
        }

        .Button:active {
          box-shadow: #422800 2px 2px 0 0;
          transform: translate(2px, 2px);
        }

        .r {
                background-color: #fde881;
                cursor: pointer;
            }

        .r:hover {
            background-color: #ffd699;
        }


        .item_8 {
            grid-area: error;
            text-align: center;
            color: #B00000;
            background-color: #C1FF9E;
            height: 100%;
            overflow-wrap: break-word;
            padding: 5px;
            box-sizing: border-box;
}
    </style>


</head>
<body>
<div class="container">
    <div class="item item_1">
        <h1>Джохадзе Анна Бекаевна</h1>
        <h2>Группа: P3210</h2>
        <h3>Варинат: 4789991</h3>
    </div>
    <div class="item item_2">
        <div class="X">
            X:
            <div>
                <input type="checkbox" id="-4" name="coordinates" value="-4"/>
                <label for="-4">-4</label>
            </div>
            <div>
                <input type="checkbox" id="-3" name="coordinates" value="-3"/>
                <label for="-3">-3</label>
            </div>
            <div>
                <input type="checkbox" id="-2" name="coordinates" value="-2"/>
                <label for="-2">-2</label>
            </div>
            <div>
                <input type="checkbox" id="-1" name="coordinates" value="-1"/>
                <label for="-1">-1</label>
            </div>
            <div>
                <input type="checkbox" id="0" name="coordinates" value="0"/>
                <label for="0">0</label>
            </div>
            <div>
                <input type="checkbox" id="1" name="coordinates" value="1"/>
                <label for="1">1</label>
            </div>
            <div>
                <input type="checkbox" id="2" name="coordinates" value="2"/>
                <label for="2">2</label>
            </div>
            <div>
                <input type="checkbox" id="3" name="coordinates" value="3"/>
                <label for="3">3</label>
            </div>
            <div>
                <input type="checkbox" id="4" name="coordinates" value="4"/>
                <label for="4">4</label>
            </div>
        </div>
    </div>
    <div class="item item_3">
        <div class="Y">
            Y:
            <div>
                <input type="text" id="y" name="y" placeholder="от -3 до 5">
            </div>
        </div>
    </div>
    <div class="item item_4">
        <div class="R">
            R:
            <button id="button1" class="r" onclick="setR(1)">1</button>
            <button id="button2" class="r" onclick="setR(2)">2</button>
            <button id="button3" class="r" onclick="setR(3)">3</button>
            <button id="button4" class="r" onclick="setR(4)">4</button>
            <button id="button5" class="r" onclick="setR(5)">5</button>
        </div>
    </div>
    <div class="item item_5">
        <svg id="coordinate-plane" width="300" height="300" style="border:1px solid #000">

            <line x1="150" y1="0" x2="150" y2="300" stroke="black"/>
            <line x1="0" y1="150" x2="300" y2="150" stroke="black"/>

            <line x1="150" y1="0" x2="145" y2="12.5" stroke="black"/>
            <line x1="150" y1="0" x2="155" y2="12.5" stroke="black"/>

            <line x1="300" y1="150" x2="290" y2="145" stroke="black"/>
            <line x1="300" y1="150" x2="290" y2="155" stroke="black"/>

            <path d="M 150,150 L 150,75 A 75,75 0 0,1 225,150 Z" fill="rgba(0, 0, 255, 0.5)"/>

            <polygon points="150,150 75,150 150,225" fill="rgba(0, 0, 255, 0.5)"/>

            <rect x="75" y="112.5" width="75" height="37.5" fill="rgba(0, 0, 255, 0.5)"/>

            <line x1="225" y1="142.5" x2="225" y2="157.5" stroke="black"/>
            <text x="225" y="137" font-size="10" text-anchor="middle">R</text>

            <line x1="187.5" y1="142.5" x2="187.5" y2="157.5" stroke="black"/>
            <text x="187.5" y="137" font-size="10" text-anchor="middle">R/2</text>

            <line x1="75" y1="142.5" x2="75" y2="157.5" stroke="black"/>
            <text x="75" y="137" font-size="10" text-anchor="middle">-R</text>

            <line x1="112.5" y1="142.5" x2="112.5" y2="157.5" stroke="black"/>
            <text x="112.5" y="137" font-size="10" text-anchor="middle">-R/2</text>

            <!-- Ось Y -->
            <line x1="142.5" y1="75" x2="157.5" y2="75" stroke="black"/>
            <text x="135" y="77.5" font-size="10" text-anchor="middle">R</text>

            <line x1="142.5" y1="112.5" x2="157.5" y2="112.5" stroke="black"/>
            <text x="135" y="115" font-size="10" text-anchor="middle">R/2</text>

            <line x1="142.5" y1="225" x2="157.5" y2="225" stroke="black"/>
            <text x="135" y="227.5" font-size="10" text-anchor="middle">-R</text>

            <line x1="142.5" y1="187.5" x2="157.5" y2="187.5" stroke="black"/>
            <text x="135" y="190" font-size="10" text-anchor="middle">-R/2</text>

            <text x="285" y="140" font-size="12">x</text>
            <text x="157" y="10" font-size="12">y</text>

           <%
                           List<Point> points = (List<Point>) request.getServletContext().getAttribute("results");
                           if (points != null) {
                               for (Point point : points) {
                                   double r = point.getR();

                                   double x = point.getX();
                                   double y = point.getY();

                                   int svgX = (int) ((point.getX() / (r * 2)) * 150 + 150);
                                   int svgY = (int) (150 - (point.getY() / (r * 2)) * 150);
                       %>
                                   <circle cx="<%= svgX %>" cy="<%= svgY %>" r="2.5" fill="<%= point.isHit() ? "green" : "red" %>" />
                       <%
                               }
                           }
                       %>

        </svg>
    </div>
    <div class="item item_6">
        <jsp:include page="result.jsp"/>
    </div>
    <div class="item item_7">
            <div>
                <button id="checkButton" type="button" class="Button">Проверить</button>
            </div>
        </div>
        <div id="error" class="item item_8">
        </div>
</div>
<script src="script.js"></script>
</body>
</html>
