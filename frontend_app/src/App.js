import './App.css';
import {BrowserRouter as Router, Route, Switch} from 'react-router-dom';
import Home from './Home';
import Rooms from './Rooms';
import About from './About';
import Doctors from './Doctors';
import Contact from './Contact';
import Navbar from './Navbar';

function App() {
  return (
    <Router>
    <div className="App">
        <Navbar />
        <div className="content"> 
          <Switch>
            <Route path="/"> //Home page
              <Home />
            </Route>
          </Switch>
        </div>
      </div>
    </Router>
  );
}

export default App;
