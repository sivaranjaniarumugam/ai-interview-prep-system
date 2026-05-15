import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

const CoursePage = () => {
  const [courses, setCourses] = useState([]);
  const navigate = useNavigate();

  useEffect(() => {
    axios.get('http://localhost:8080/api/courses')
      .then(res => setCourses(res.data))
      .catch(err => {
        setCourses([
          { id: 1, name: 'Java Full Stack' },
          { id: 2, name: 'Python' },
          { id: 3, name: 'Data Science' },
          { id: 4, name: 'SQL' }
        ]);
      });
  }, []);

  return (
    <div style={{ padding: '30px', fontFamily: 'Arial' }}>
      <h1>Select a Course</h1>
      <div style={{ display: 'flex', flexDirection: 'column', gap: '15px', marginTop: '20px' }}>
        {courses.map(course => (
          <button
            key={course.id}
            onClick={() => navigate(`/questions/${course.id}`)}
            style={{
              padding: '15px 30px',
              fontSize: '18px',
              backgroundColor: '#4CAF50',
              color: 'white',
              border: 'none',
              borderRadius: '8px',
              cursor: 'pointer',
              width: '300px'
            }}
          >
            {course.name}
          </button>
        ))}
      </div>
    </div>
  );
};

export default CoursePage;