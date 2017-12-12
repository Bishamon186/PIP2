	function meowCanvas()
	{ 
		var picture = document.getElementById("picture");   
		var draw = canvas.getContext('2d');
		var w = 480;
		var h =480;
		var x = 0;
		var y = 0;
		var i = 40;
		if (draw) 
		{
			picture.width=w;
			picture.height=h; 
			ctx.clearRect(x, y, w, h);
			draw.strokeRect(x,y,w,h);  //няш-мяш прямоугольник наш           

			ctx.beginPath();
			x = w; 
			ctx.moveTo(x/2,y);
			y = h ;
			ctx.lineTo(x/2,y);
			ctx.stroke(); //палочка для оси у

			x = 0;
			ctx.moveTo(x,y/2);
			x = w;
			ctx.lineTo(x,y/2);
			ctx.stroke();//палочка для оси х

			step = (x/12);
			numy = 5;//математика сложная, я тупая, пихаю цифры напрямую ЫЫЫЫ
			numx = -5;
			for (i; i < w; i+=step,numy-=1,numx+=1)
			{
				ctx.moveTo((x/2)-5,i); //разметочка по y
				ctx.lineTo((x/2)+5,i);
				ctx.stroke();

				ctx.strokeText(numy /*ЫЫЫЫ*/, (x/2)+10, i); //цифорки по у

				ctx.moveTo(i,(y/2)-5); //разметочка по x
				ctx.lineTo(i,(y/2)+5);
				ctx.stroke();

				ctx.strokeText(numx /*ЫЫЫЫ*/, i, (x/2)-10);//цифорки по х
			}

			canvas.addEventListener('click',function(evt)
			{
				var x = (evt.clientX - canvas.offsetLeft - (x/2))/i; //вычисляем координаты х и у
				var y = ((y/2) - evt.clientY + canvas.offsetTop )/i; //туточки я чет не поняла принцип раоты :(
				if (CheckRadius() == 1)
				{
					var r = RadiusValue();
					var param = "?x=" + x + "&y=" + y + "&r=" + r; //формируем ГЕТ запрос
					window.location.replace("ControllerServlet" + params);  //ПИУ
				}
				else
				{
					var str = document.querySelector('div');
					alert("Выберете радиус, плез");
					str.innerHTML = "Выберете радиус"; //если пользователь не ткнул в радиус
				}
			},false);

			return ctx; //сие великолепие пихаем ногой в канвас
 		}
		else
		{
			var str = document.querySelector('div');
			alert("Ваш брузер не поддерживает canvas.Обновите брузер, плез");
			str.innerHTML = "Ваш брузер не поддерживает canvas.Обновите брузер, плез"; // если пользователь работает на стремном брузере
  		}
	}	

	function CheckOnlyOneX(source) ; //проверяет только иксы!!
	{
   		var boxArray = document.getElementsByName('Cbx');
   		boxArray.forEach(function (p1, p2, p3) { p1.checked=0 ; });
   		source.checked=1;
	}

	function CheckOnlyOneR(source) ; //проверяет только радиУСЫ!!
	{
   		var boxArray = document.getElementsByName('Cbr');
   		boxArray.forEach(function (p1, p2, p3) { p1.checked=0 ; });
   		source.checked=1;
	}

	function CheckRadius()//проверка: выбран ли радиус
	{
		var check = 0;
        Rb = document.getElementsByName("Rb");
		for (var i = 0; i < Rb.length; i++)
			{
				if (Rb[i].checked)
				check++;
            }
        return check;
    }

	function RadiusValue()//вытаскиваем значение радиУСА
	{
		var radius = 0;
		rButton = document.getElementsByName("r");
		for (var i = 0; i < rButton.length; i++)
		if (rButton[i].checked)
		radius = rButton[i].value;
		return radius;
	}

	function Area() //перерисовываем область
	{
		var w = 480;
		var h =480;
		var x = w/2;
		var y = w/2;		

		var picture = drawDefault();
		if (picture)
		{
			if (getNumberOfChecked()==1)
			{
				var r = parseFloat(RadiusValue());

				picture.fillStyle = "rgba(0,255,255,0.5)";//цвет области

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
			}
			return picture;
		}
    }

	function CheckTextBox() 
	{
   		var y = document.getElementById('y').value.replace(/,/,'.');
		var str = document.querySelector('div');
		if (y.length==0)
		{
			alert("Поле У должно быть заполнено");
    	    str.innerHTML = "Поле У должно быть заполнено";   	    
       		return false;
    	}

   		if ( parseInt(y,10) != parseInt(y,10))
   		{
   			alert("Поле У должно быть числом");
       		str.innerHTML = "Поле У должно быть числом"
        	return false;
   		 }

   		if(y<-3 || y>3)
   		{
   			alert("У должно находиться в промежутке (-3;3)");
     	   str.innerHTML = "У должно находиться в промежутке (-3;3)"
     	   return false;
    	}
   		
		return true;
	}

	