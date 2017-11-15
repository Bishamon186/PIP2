package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControllerServlet extends Dispatcher {	
	
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {
        request.setAttribute("Error", "");        
        request.setAttribute("Result", false);
        Double x = 0.0, y = 0.0, r = 0.0;
        boolean check = true;
        
        try {
            y = Double.parseDouble(request.getParameter("y"));
        }
        catch (NumberFormatException | NullPointerException e){
        	check = false;
                request.setAttribute("Error", request.getAttribute("Error") + "Ошибка при вводе У<br>");
        }
        try {
            r = Double.parseDouble(request.getParameter("r"));
        }
        catch (NumberFormatException | NullPointerException e){
        	check = false;
                request.setAttribute("Error", request.getAttribute("Error") + "Ошибка при вводе R<br>");
        }
        try {
            y = Double.parseDouble(request.getParameter("y"));
        }
        catch (NumberFormatException | NullPointerException e){
            check = false
                request.setAttribute("Error", request.getAttribute("Error") + "Ошибка при вводе X<br>");
        }
        request.setAttribute("Result", check);
        if (!check) 
        {
        	super.redirectTo("index.jsp", request, response);//если есть ошибка - шлем обратно на страницу
        }

        else
        {
            super.redirectTo("AreaCheckServlet", request, response); //если все хорошо - в след.сервелат
        }
    }

    
}
