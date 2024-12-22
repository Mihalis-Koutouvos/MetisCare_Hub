//Did sfc then tab to get this -> Creates stateless, functional component
const Navbar = () => {
    return (  
        <nav className="navbar">
            <h1>MetisCare Hub</h1>
            <div className="links">
                <a href="/">Home</a>
                <a href="/rooms">Rooms</a>
            </div>
        </nav>

    );
}
 
export default Navbar;