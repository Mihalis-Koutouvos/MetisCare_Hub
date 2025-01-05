import {BrowserRouter as Router, Route, Switch} from 'react-router-dom';
import Navbar from './Navbar';
import Home from './Home';
import Rooms from './Rooms';
import About from './About';
import Doctors from './Doctors';
import Contact from './Contact';

function App() {
  return (
    <Router>
    <div className="App">
        <Navbar />
        <div className="content"> 
          <Switch>
            <Route exact path="/"> 
              <Home />
            </Route>

            <Route path="/rooms"> 
              <Rooms />
            </Route>

            <Route path="/about"> 
              <About />
            </Route>

            <Route path="/doctors"> 
              <Doctors />
            </Route>

            <Route path="/contact"> 
              <Contact />
            </Route>
          </Switch>
        </div>
      </div>
    </Router>
  );
}

//Exported so that we can use this component (function) in other files
export default App;
