package org.cbpmc.message.exception;

public class MessageException extends RuntimeException
{
	public MessageException()
	{
	}
	public MessageException(String msg)
	{
		super(msg);
	}
}
