import {Link} from 'react-router-dom';

const Navbar = () => {
    return (  
        <nav className="navbar">
            <h1>MetisCare Hub</h1>
            <div className="links">
                <Link to="/">Home</Link>
                <Link to="/rooms">Rooms</Link>
                <Link to="/about">About</Link>
                <Link to="/doctors">Doctors</Link>
                <Link to="/contact">Contact</Link>
            </div>
        </nav>

    );
}
 
export default Navbar;