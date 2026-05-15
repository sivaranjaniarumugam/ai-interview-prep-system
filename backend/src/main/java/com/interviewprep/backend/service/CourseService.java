package com.interviewprep.backend.service;

import com.interviewprep.backend.model.Course;
import com.interviewprep.backend.repo.CourseRepo;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class CourseService {

    private final CourseRepo courseRepo;

    public CourseService(CourseRepo courseRepo) {
        this.courseRepo = courseRepo;
    }

    public List<Course> getAllCourses() {
        return courseRepo.findAll();
    }
}