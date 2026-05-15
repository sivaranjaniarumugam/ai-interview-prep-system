package com.interviewprep.backend.service;

import com.interviewprep.backend.model.Question;
import com.interviewprep.backend.repo.QuestionRepo;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class QuestionService {

    private final QuestionRepo questionRepo;

    public QuestionService(QuestionRepo questionRepo) {
        this.questionRepo = questionRepo;
    }

    public List<Question> getQuestionsByCourse(Long courseId) {
        return questionRepo.findByCourseId(courseId);
    }
}