package com.mymall.service;

import com.mymall.dto.EmailDTO;

public interface EmailService {

	public void sendMail(EmailDTO dto, String message);
}
