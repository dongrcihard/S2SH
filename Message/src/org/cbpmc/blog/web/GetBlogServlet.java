package org.cbpmc.blog.web;

import org.cbpmc.blog.service.BlogService;
import org.json.JSONObject;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
/**
 * Description:
 * <br/>网站：<a href="http://www.crazyit.org">疯狂Java联盟</a>
 * <br/>Copyright (C), 2001-2014, Yeeku.H.Lee
 * <br/>This program is protected by copyright laws.
 * <br/>Program Name:
 * <br/>Date:
 * @author Yeeku.H.Lee kongyeeku@163.com
 * @version 1.0
 */
@WebServlet(urlPatterns="/getBlog")
public class GetBlogServlet extends HttpServlet
{
    public void service(HttpServletRequest request ,
                        HttpServletResponse response)
            throws IOException , ServletException
    {
        request.setCharacterEncoding("utf-8");
        // 获取请求参数
        String blogId = request.getParameter("blogId");
        Map<String , Object> result = new HashMap<>();
        // 获取Spring容器
        ApplicationContext ctx = WebApplicationContextUtils
                .getWebApplicationContext(getServletContext());
        BlogService bs = (BlogService)ctx.getBean("blogService");
        // 调用业务逻辑组件的方法，获取数据，并设置成data属性
        result.put("blog" , bs.getBlog(Integer.parseInt(blogId)));
        // 准备输出服务器响应
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        // 将Map包装成JSONObject后输出
        out.print(new JSONObject(result));
    }
}