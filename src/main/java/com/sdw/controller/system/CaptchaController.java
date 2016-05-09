package com.sdw.controller.system;

import java.awt.image.BufferedImage;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;

@Controller
@RequestMapping("/captcha/")
public class CaptchaController {

    @Autowired
    private Producer producer;

    @RequestMapping(value = "validate", method = RequestMethod.GET)
    public void kaptcha(HttpServletRequest req,
            HttpServletResponse rsp) throws Exception {
        HttpSession session = req.getSession();
        String code = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
        System.out.println("验证码: " + code);

        rsp.setDateHeader("Expires", 0);
        rsp.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        rsp.addHeader("Cache-Control", "post-check=0, pre-check=0");
        rsp.setHeader("Pragma", "no-cache");
        rsp.setContentType("image/jpeg");

        String capText = producer.createText();
        session.setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);

        BufferedImage image = producer.createImage(capText);
        ServletOutputStream out = rsp.getOutputStream();
        ImageIO.write(image, "jpg", out);
        try {
            out.flush();
        } finally {
            out.close();
        }
    }
}
