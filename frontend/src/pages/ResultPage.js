import React from 'react';
import { useLocation, useNavigate } from 'react-router-dom';

const ResultPage = () => {
  const location = useLocation();
  const navigate = useNavigate();
  const { score, total } = location.state || { score: 0, total: 0 };

  return (
    <div style={{ padding: '30px', fontFamily: 'Arial', textAlign: 'center' }}>
      <h1>Your Result</h1>
      <h2 style={{ color: '#4CAF50', fontSize: '48px' }}>
        {score} / {total}
      </h2>
      <p style={{ fontSize: '20px' }}>
        {score >= total / 2 ? '🎉 Well Done!' : '💪 Keep Practicing!'}
      </p>
      <button
        onClick={() => navigate('/courses')}
        style={{
          marginTop: '20px',
          padding: '12px 30px',
          fontSize: '16px',
          backgroundColor: '#4CAF50',
          color: 'white',
          border: 'none',
          borderRadius: '8px',
          cursor: 'pointer'
        }}
      >
        Try Again
      </button>
    </div>
  );
};

export default ResultPage;