package org.cbpmc.blog.exception;

public class BlogException extends RuntimeException
{
    public BlogException()
    {
    }
    public BlogException(String msg)
    {
        super(msg);
    }
}
