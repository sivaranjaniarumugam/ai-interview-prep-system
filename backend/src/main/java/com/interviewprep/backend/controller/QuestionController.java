package com.interviewprep.backend.controller;

import com.interviewprep.backend.entity.Question;
import com.interviewprep.backend.service.QuestionService;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/questions")
public class QuestionController {

    private final QuestionService questionService;

    public QuestionController(QuestionService questionService) {
        this.questionService = questionService;
    }

    @GetMapping("/{courseId}")
    public List<Question> getQuestions(@PathVariable Long courseId) {
        return questionService.getQuestionsByCourse(courseId);
    }
}