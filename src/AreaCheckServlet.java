import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sun.org.apache.xml.internal.utils.URI;

public class AreaCheckServlet extends HttpServlet {

	
	@Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.setStatus(HttpServletResponse.SC_OK);
        Double x = 0.0, y = 0.0, r = 0.0;
        boolean hit = false;
        x = Double.parseDouble(request.getParameter("x"));
        y = Double.parseDouble(request.getParameter("y"));
        r = Double.parseDouble(request.getParameter("r"));

        if ((x== -5 || x == -4 || x == -3 || x == -2 || x == -1 || x == 0 || x == 1 || x == 2 || x == 3) &&
                (y >= -3  && y <= 3) &&
                (r == 1 || r == 1.5 || r == 2 || r == 2.5 || r == 3)){
            hit = Area(x, y, r);

            request.setAttribute("Result", true);

        }
        else {
            request.setAttribute("Result", false);

        }
        request.setAttribute("hit", hit);
        response.sendRedirect("index.jsp"); //отправляем данные на страничку
    }

    private boolean Area(double x, double y, double r) 
    {
        int flag = 0;
        if(x>=0)
        {
            if(x<=r/2 && y>=0 && y<=r)
                flag++;
            if(y<0 && y>=(x-r/2))
                flag++;
        }
        else 
        {
            if (y < 0)                
                if (r * r >= (x * x + y * y))
                    flag++;
        }
        
        if (flag>0)
        {
            return true;
        }        
        else
        {
            return false;
        }
    }

}
