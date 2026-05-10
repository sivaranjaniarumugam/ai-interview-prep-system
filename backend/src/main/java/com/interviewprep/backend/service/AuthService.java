package com.interviewprep.backend.service;

import com.interviewprep.backend.dto.AuthResponse;
import com.interviewprep.backend.dto.LoginRequest;
import com.interviewprep.backend.dto.RegisterRequest;
import com.interviewprep.backend.model.User;
import com.interviewprep.backend.repo.UserRepo;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class AuthService {

    private final UserRepo userRepo;
    private final BCryptPasswordEncoder passwordEncoder;

    public AuthService(UserRepo userRepo,
                       BCryptPasswordEncoder passwordEncoder) {
        this.userRepo        = userRepo;
        this.passwordEncoder = passwordEncoder;
    }

    public AuthResponse register(RegisterRequest request) {

        if (userRepo.existsByEmail(request.getEmail())) {
            return AuthResponse.fail("Email already registered!");
        }

        User user = new User();
        user.setName(request.getName());
        user.setEmail(request.getEmail());
        user.setPassword(passwordEncoder.encode(request.getPassword()));

        userRepo.save(user);

        return AuthResponse.ok("Registration successful!",
                               user.getEmail(),
                               user.getName());
    }

    public AuthResponse login(LoginRequest request) {

        User user = userRepo.findByEmail(request.getEmail()).orElse(null);

        if (user == null) {
            return AuthResponse.fail("No account found!");
        }

        boolean matches = passwordEncoder.matches(
                request.getPassword(),
                user.getPassword()
        );

        if (!matches) {
            return AuthResponse.fail("Wrong password!");
        }

        return AuthResponse.ok("Login successful!",
                               user.getEmail(),
                               user.getName());
    }
}
