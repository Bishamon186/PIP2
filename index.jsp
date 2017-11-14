
<!DOCTYPE html>
<html>
    <head>
        <title>Лабораторная работа №2</title>
        <h1 align ="center">Лабораторная работа №2</h1>
        <h3 align ="right">Вариант 760</h1>
        <h3 align = "right">Выполнили: Куликова А, Сорокин Р</h3>
        <h3 align = "right">Проверил: Николаев В.В.</h3>
    </head>
    <body onload = "meowCanvas();">
    <canvas id="picture" >
    	<p>Ваш брузер не поддерживает canvas.Обновите брузер ,плез</p>
    </canvas>
    <form action = "ControllerServlet" method="GET" id = "form" onsubmit="return Check(this);">

    		<p>
            Выберете x: 
            <br>
            <input type ="checkbox" name ="Cbx" value = "-5" onclick="CheckOnlyOneX()">
            <input type ="checkbox" name ="Cbx" value = "-4" onclick="CheckOnlyOneX()">
            <input type ="checkbox" name ="Cbx" value = "-3" onclick="CheckOnlyOneX()">
            <input type ="checkbox" name ="Cbx" value = "-2" onclick="CheckOnlyOneX()">
            <input type ="checkbox" name ="Cbx" value = "-1" onclick="CheckOnlyOneX()">
            <input type ="checkbox" name ="Cbx" value = "0" onclick="CheckOnlyOneX()">
            <input type ="checkbox" name ="Cbx" value = "1" onclick="CheckOnlyOneX()">
            <input type ="checkbox" name ="Cbx" value = "2" onclick="CheckOnlyOneX()">
            <input type ="checkbox" name ="Cbx" value = "3" onclick="CheckOnlyOneX()">
            </p>

            <p>
            Введите y:   
            <br>   
            <input type="text" id = "y">
            </p>

            <p>
            Выберете r: 
            <br>
            <input type ="checkbox" name ="Cbr" value = "1" onclick="Area(this)">
            <input type ="checkbox" name ="Cbr" value = "1,5" onclick="Area(this)">
            <input type ="checkbox" name ="Cbr" value = "2" onclick="Area(this)">
            <input type ="checkbox" name ="Cbr" value = "2,5" onclick="Area(this)">
            <input type ="checkbox" name ="Cbr" value = "3" onclick="Area(this)">
            </p>

            <p>
            <input type ="submit" value = "ОК">
            </p>

			<p>
            <div id ="status"></div>
            </p>            

        </form>



        <script type="text/javascript" src="index.js"> </script>
 </body>
</html>