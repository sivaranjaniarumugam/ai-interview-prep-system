package com.interviewprep.backend.dto;

public class AuthResponse {

    private boolean success;
    private String message;
    private String email;
    private String name;

    public AuthResponse(boolean success, String message, 
                        String email, String name) {
        this.success = success;
        this.message = message;
        this.email   = email;
        this.name    = name;
    }

    public static AuthResponse ok(String message, 
                                  String email, String name) {
        return new AuthResponse(true, message, email, name);
    }

    public static AuthResponse fail(String message) {
        return new AuthResponse(false, message, null, null);
    }

    public boolean isSuccess()  { return success; }
    public String getMessage()  { return message; }
    public String getEmail()    { return email; }
    public String getName()     { return name; }
}
