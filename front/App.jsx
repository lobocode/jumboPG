import React from 'react';
import Dropdown from './Dropdown';
import Input from './Input';

function App() {
  return (
    <div>
      <Dropdown label="DB Version" options={["Option 1", "Option 2", "Option 3"]} />
      <Dropdown label="OS type" options={["Option 1", "Option 2", "Option 3"]} />
      <Dropdown label="DB Type" options={["Option 1", "Option 2", "Option 3"]} />
      <Input label="Total Memory Ram" type="number" />
      <Input label="Number of CPUs" type="number" />
      <Input label="Number of connections" type="number" />
      <Dropdown label="Data Storage" options={["Option 1", "Option 2", "Option 3"]} />
      <button>Generate</button>
    </div>
  );
}

export default App;