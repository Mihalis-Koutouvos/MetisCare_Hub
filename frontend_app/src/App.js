import {BrowserRouter as Router, Route, Switch} from 'react-router-dom';
import Navbar from './Navbar';
import Home from './Home';
import Rooms from './Rooms';
import About from './About';
import Staff from './Staff';
import Contact from './Contact';
import BlogDetails from './BlogDetails';
import NotFoundErrorPage from './NotFoundErrorPage';

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

            <Route path="/staff"> 
              <Staff />
            </Route>

            <Route path="/contact"> 
              <Contact />
            </Route>

            <Route path="/blogs/:id"> 
              <BlogDetails />
            </Route>

            <Route path="*">
              <NotFoundErrorPage/>
            </Route>
          </Switch>
        </div>
      </div>
    </Router>
  );
}

//Exported so that we can use this component (function) in other files
export default App;
