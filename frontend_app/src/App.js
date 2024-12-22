import {BrowserRouter as Router, Route, Switch} from 'react-router-dom';
import Navbar from './Navbar';
import Home from './Home';
import Rooms from './Rooms';
import About from './About';
import Doctors from './Doctors';
import Contact from './Contact';

//As of December 22, 2024: UI works!
function App() {
  return (
    <Router>
    <div className="App">
        <Navbar />
        <div className="content"> 
          <Home />
          <Rooms />
          <About /> 
          <Doctors />
          <Contact />
          <Switch>
            <Route path="/"> 
              <Home />
            </Route>
          </Switch>
        </div>
      </div>
    </Router>
  );
}

//Exported so that we can use this component (function) in other files
export default App;
