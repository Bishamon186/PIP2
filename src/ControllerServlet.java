import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControllerServlet extends HttpServlet {
	
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {
        request.setAttribute("Error", "");        

        Double x = 0.0, y = 0.0, r = 0.0;
        boolean checkX = true;
        boolean checkY = true;
        boolean checkR = true;


        checkX = Try("x",request);
        checkY = Try("y",request);
        checkR = Try("r",request);

        if (checkR && checkY && checkX)
        {
          request.setAttribute("Correct", true);
            response.sendRedirect("AreaCheckServlet"); //если все хорошо - в след.сервелат

        }
        else
        {
            request.setAttribute("Result", 0);
            request.setAttribute("Error", request.getAttribute("Error") + "Ошибка при вводе данных<br>");
            request.setAttribute("Correct", false);
            response.sendRedirect("index.jsp");//если есть ошибка - шлем обратно на страницу
        }

    }

    private boolean Try(String num, HttpServletRequest request)
    {
        double y;
        try
        {
            y = Double.parseDouble(request.getParameter(num));
        }
        catch (NumberFormatException | NullPointerException e)
        {
            return  false;
        }
        return true;
    }


}
