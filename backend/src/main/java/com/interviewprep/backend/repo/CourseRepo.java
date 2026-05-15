package com.interviewprep.backend.repo;

import com.interviewprep.backend.model.Course;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CourseRepo extends JpaRepository<Course, Long> {
}