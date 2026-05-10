package com.interviewprep.backend.controller;

import com.interviewprep.backend.dto.AuthResponse;
import com.interviewprep.backend.dto.LoginRequest;
import com.interviewprep.backend.dto.RegisterRequest;
import com.interviewprep.backend.service.AuthService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*")
public class AuthController {

    private final AuthService authService;

    public AuthController(AuthService authService) {
        this.authService = authService;
    }

    // POST /api/register
    @PostMapping("/register")
    public ResponseEntity<AuthResponse> register(
                         @RequestBody RegisterRequest request) {

        AuthResponse response = authService.register(request);

        if (response.isSuccess()) {
            return ResponseEntity.ok(response);           // 200
        }
        return ResponseEntity.badRequest().body(response); // 400
    }

    // POST /api/login
    @PostMapping("/login")
    public ResponseEntity<AuthResponse> login(
                         @RequestBody LoginRequest request) {

        AuthResponse response = authService.login(request);

        if (response.isSuccess()) {
            return ResponseEntity.ok(response);            // 200
        }
        return ResponseEntity.status(401).body(response);  // 401
    }
}
