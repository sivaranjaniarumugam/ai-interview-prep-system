package com.interviewprep.backend.repo;

import com.interviewprep.backend.model.Question;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface QuestionRepo extends JpaRepository<Question, Long> {
    List<Question> findByCourseId(Long courseId);
}