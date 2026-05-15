package com.interviewprep.backend.controller;

import com.interviewprep.backend.model.Question;
import com.interviewprep.backend.service.QuestionService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/questions")
@CrossOrigin(origins = "*")
public class QuestionController {

    private final QuestionService questionService;

    public QuestionController(QuestionService questionService) {
        this.questionService = questionService;
    }

    @GetMapping("/{courseId}")
    public ResponseEntity<List<Question>> getQuestions(@PathVariable Long courseId) {
        List<Question> questions = questionService.getQuestionsByCourse(courseId);
        return ResponseEntity.ok(questions);
    }
}