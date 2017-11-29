
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
    <form action = "ControllerServlet" method="GET" id = "form" onsubmit="return CheckTextBox();">

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
            <input type ="checkbox" name ="Cbr" value = "1" onclick="Area()">
            <input type ="checkbox" name ="Cbr" value = "1,5" onclick="Area()">
            <input type ="checkbox" name ="Cbr" value = "2" onclick="Area()">
            <input type ="checkbox" name ="Cbr" value = "2,5" onclick="Area()">
            <input type ="checkbox" name ="Cbr" value = "3" onclick="Area()">
            </p>

            <p>
            <input type ="submit" value = "ОК">
            </p>

			<p>
            <div id ="status"></div>
            </p>       

        </form>
        <script type="text/javascript" src="index.js"> </script>
         <%
            if (request.getAttribute("Result")!=null)
            {
                if (((Boolean)request.getAttribute("Result")).booleanValue())
                {
                    Double x = Double.parseDouble(request.getParameter("x"));
                    Double y = Double.parseDouble(request.getParameter("y"));
                    Double r = Double.parseDouble(request.getParameter("r"));
                    out.write("Координаты: (" + x + "; " + y + "), радиус: " + r + "<br>");
                    else out.write("Точка попадает в область. <br>");
                    int size = session.getAttribute("size");
                    size++;
                    session.setAttribute("size",size);
               
                else
                {
                    else out.write("Точка не попадает в область. <br>");
                }
            }
            else
            {
                out.write(request.getAttribute("Error") "<br>");   
            }
         %>
        
        <script type="text/javascript">//Надо как-то точки ставить
            Point(parseFloat(<%= x%>), parseFloat(<%= y%>), parseFloat(<%= r%>));

            function Point(x1,y1,r1)//рисуем яркую красную точечку
             {
                var picture = document.getElementById("picture").getContext('2d');
                if (picture)
                {
                    w=480;
                    h=480;
                    x = w/2;
                    y = h/2;

                    picture.fillRect(x, y, (r*40)/2, r);//ЧеТкИй ПрЯмОуГоЛьНиК

                    picture.beginPath(); //Пафосный треугольник
                    picture.moveTo(x,y);
                    picture.lineTo(x,y-(r*40/2));
                    picture.lineTo(x+(r*40/2),y);
                    picture.lineTo(x,y);
                    picture.fill();
                    picture.closePath();

                    picture.beginPath(); //Круг по понятиям
                    picture.moveTo(150,150);
                    picture.arc(150,150, r*40/2, Math.PI, 3*Math.PI/2, true);
                    picture.fill();
                    picture.closePath();
                    
                    picture.beginPath();//точечка, я не понимаю как ее рисовать(
                    picture.moveTo(x1*40 + x, y - 40*y);
                    picture.arc(x1*40 + x, y - 40*y, 1, 0, 2* Math.PI, false);
                    picture.fillStyle = 'red';
                    picture.fill();
                    picture.closePath();
                    return picture;
                }
            }
        </script>
        
         <%
                    
                    Vector xResults = new Vector();
                    Vector yResults = new Vector();
                    Vector xResults = new Vector();
                    Vector hit = new Vector();
                    int size = session.getAttribute("Size");

                    xResults = session.getAttribute("x");
                    yResults = session.getAttribute("y");
                    rResults = session.getAttribute("r");
                    hit = session.getAttribute("hit");

                    xResult.add(x);
                    yResult.add(y);
                    rResult.add(r);
                    hit.add(request.getAttribute("Result"));

                    session.setAttribute("x", xResult);
                    session.setAttribute("y", yResult);
                    session.setAttribute("r", rResult);
                    session.setAttribute("hit",request.getAttribute("Result"));

                    out.write("<table>");
                    out.write("<tr>");
                    out.write("<th> x </th>");
                    out.write("<th> y </th>");
                    out.write("<th> r </th>");
                    out.write("<th> Попадает в область? </th>");
                    out.write("</tr>");

                    for (int i = 0; i < size; i++)
                    {
                        out.write("<tr>");
                        out.write("<td>");
                        out.print(xResults[i]));
                        out.write("</td>");
                        out.write("<td>");
                        out.print(yResults[i]));
                        out.write("</td>");
                        out.write("<td>");
                        out.print(rResults[i]);
                        out.write("</td>");
                        out.write("<td>");
                        if (hit[i])
                            out.print("Попадает");
                        else out.print("Не попадает");
                        out.write("</td>");
                        out.write("</tr>");
                    }
                    out.write("</table>");
            out.write("<a href = ../index.jsp>Убрать результаты</a>");
        }
                
        %>

 </body>
</html>