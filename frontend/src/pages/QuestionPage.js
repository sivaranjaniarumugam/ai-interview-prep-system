import React, { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import axios from 'axios';

const QuestionPage = () => {
  const { courseId } = useParams();
  const navigate = useNavigate();
  const [questions, setQuestions] = useState([]);
  const [current, setCurrent] = useState(0);
  const [selected, setSelected] = useState(null);
  const [score, setScore] = useState(0);

  useEffect(() => {
    axios.get(`http://localhost:8080/api/questions/${courseId}`)
      .then(res => setQuestions(res.data))
      .catch(err => {
        setQuestions([
          { id: 1, question: 'What is Java?', options: ['Language', 'OS', 'Database', 'Tool'], answer: 'Language' },
          { id: 2, question: 'What is SQL?', options: ['Query Language', 'OS', 'Framework', 'Library'], answer: 'Query Language' }
        ]);
      });
  }, [courseId]);

  const handleNext = () => {
    if (selected === questions[current].answer) {
      setScore(score + 1);
    }
    if (current + 1 < questions.length) {
      setCurrent(current + 1);
      setSelected(null);
    } else {
      navigate('/result', { state: { score, total: questions.length } });
    }
  };

  if (questions.length === 0) return <div>Loading...</div>;

  return (
    <div style={{ padding: '30px', fontFamily: 'Arial' }}>
      <h2>Question {current + 1} of {questions.length}</h2>
      <h3>{questions[current].question}</h3>
      <div style={{ display: 'flex', flexDirection: 'column', gap: '10px', marginTop: '20px' }}>
        {questions[current].options.map((option, index) => (
          <button
            key={index}
            onClick={() => setSelected(option)}
            style={{
              padding: '12px 20px',
              fontSize: '16px',
              backgroundColor: selected === option ? '#2196F3' : '#e0e0e0',
              color: selected === option ? 'white' : 'black',
              border: 'none',
              borderRadius: '8px',
              cursor: 'pointer',
              width: '300px'
            }}
          >
            {option}
          </button>
        ))}
      </div>
      <button
        onClick={handleNext}
        disabled={!selected}
        style={{
          marginTop: '20px',
          padding: '12px 30px',
          fontSize: '16px',
          backgroundColor: '#FF9800',
          color: 'white',
          border: 'none',
          borderRadius: '8px',
          cursor: 'pointer'
        }}
      >
        Next
      </button>
    </div>
  );
};

export default QuestionPage;