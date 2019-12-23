package controller;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.util.Random;

public class VerifyServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("UTF-8");

        String[] codes = {
                "2","3","4","5","6","7","8","9","A",
                "B","C","D","E","F","G","H","J","K","L","M",
                "N","P","Q","R","S","T","U","V","W","X","Y","Z",
                "a","b","c","d","e","f","g","h","i","j","k","m",
                "n","p","q","r","s","t","u","v","w","x","y","z"
            };
        String code = "";
        Random random = new Random();
        for(int i=0;i<4;i++) {
            String str = codes[random.nextInt(codes.length)];
            code += str;
        }

        PrintWriter out = response.getWriter();
        out.print(code);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
