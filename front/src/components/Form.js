import React from 'react';
import Dropdown from './Dropdown';
import Input from './input';

function Form({ onSubmit }) {
  const handleSubmit = (event) => {
    event.preventDefault();
    const formData = {
      dbVersion: event.target.elements['db-version'].value,
      osType: event.target.elements['os-type'].value,
      dbType: event.target.elements['db-type'].value,
      totalMemoryRam: event.target.elements['total-memory-ram'].value,
      numberOfCPUs: event.target.elements['number-of-cpus'].value,
      numberOfConnections: event.target.elements['number-of-connections'].value,
      dataStorage: event.target.elements['data-storage'].value,
    };
    onSubmit(formData);
  };

  return (
    <form onSubmit={handleSubmit}>
      <Dropdown id="db-version" label="DB Version" options={["15", "14", "13"]} />
      <Dropdown id="os-type" label="OS type" options={["Linux", "Windows", "OS X"]} />
      <Dropdown id="db-type" label="DB Type" options={["Web Application", "Desktop Application", "Data warehouse", "Mixed types"]} />
      <Input id="total-memory-ram" label="Total Memory Ram" type="number" placeholder="Memory size (RAM, required)" />
      <Input id="number-of-cpus" label="Number of CPUs" type="number" />
      <Input id="number-of-connections" label="Number of connections" type="number" />
      <Dropdown id="data-storage" label="Data Storage" options={["SSD", "Network (SAN)"]} />
      <button id="generate-button" type="submit">Generate</button>
    </form>
  );
}

export default Form;
