import axios from "axios";
import React from "react";
import logo from './logo.svg';
import './App.css';

function App() {  
  React.useEffect(() => {
    axios.get(`http://posts.com/posts`).then((response) => {
      console.log("response>>>>>>>", response)
    });
  }, []);
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
          QA TechLab by Beni Dhomi
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
