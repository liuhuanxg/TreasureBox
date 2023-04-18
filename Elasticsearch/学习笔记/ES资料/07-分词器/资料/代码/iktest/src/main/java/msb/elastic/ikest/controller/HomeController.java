package msb.elastic.ikest.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.*;

@RestController
@RequestMapping(value = "/api")
public class HomeController {
    @RequestMapping(value = "hotWord")
    public void msbHotword(HttpServletResponse response, Integer wordlib) throws IOException {
        File file = new File(wordlib == 1 ? "/Users/wulei/msb_extend.dic" : "/Users/wulei/msb_stopword.dic");
        FileInputStream fis = new FileInputStream(file);
        byte[] buffer = new byte[(int) file.length()];
        response.setContentType("text/plain;charset=utf-8");
        response.setHeader("Last-Modified", String.valueOf(buffer.length));
        response.setHeader("ETag", String.valueOf(buffer.length));
        int offset = 0;
        while (fis.read(buffer, offset, buffer.length - offset) != -1) {

        }
        OutputStream out = response.getOutputStream();
        out.write(buffer);
        out.flush();
        fis.close();
    }
}
