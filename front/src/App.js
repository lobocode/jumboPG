import React, { useState } from 'react';
import Form from './components/Form';
import { generateConf } from './components/API';

function App() {
  const [conf, setConf] = useState("");

  const handleSubmit = (formData) => {
    generateConf(formData)
      .then(data => setConf(data))
      .catch(error => console.error(error));
  };

  return (
    <div>
      <Form onSubmit={handleSubmit} />
      <div>{conf}</div>
    </div>
  );
}

export default App;
