package com.vti.exam.service;

import java.util.ArrayList;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.vti.exam.dto.ChangePublicProfileDTO;
import com.vti.exam.dto.UserDTO;
import com.vti.exam.dto.UserUpdateDTO;
import com.vti.exam.entity.User;

public interface IUserService extends UserDetailsService {

	void createUser(User user);

	User findUserByEmail(String email);

	User findUserByUserName(String username);

	void activeUser(String token);

	void sendConfirmUserRegistrationViaEmail(String email);

	boolean existsUserByEmail(String email);

	boolean existsUserByUserName(String userName);

	void resetPasswordViaEmail(String email);

	void resetPassword(String token, String newPassword);

	void sendResetPasswordViaEmail(String email);

	UserDetails loadUserByUsername(String username) throws UsernameNotFoundException;

	void changeUserAvatar(String username, ChangePublicProfileDTO dto);

	void changeUserProfile(String username, UserUpdateDTO dto);

	ArrayList<User> getAllUser();

}
