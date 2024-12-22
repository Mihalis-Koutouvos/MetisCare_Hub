const Home = () => {

    const handleClick = () => {
        console.log("Hello, Doctors!");
    }

    //How to pass in parameters
    const handleClickAgain = (name) => {
        console.log("Hello " + name);
    }

    return (  
        <div className="home">
            <h2>Home Page</h2>
            <button onClick={handleClick}>Click</button>
            <button onClickAgain={() => handleClickAgain('Mario')}>Click Me Again</button>
        </div>
    );
    //Note about invoking: We don't do handleClick() because the app invokes the call for us, but 
    //we want the users to be able to do that, so we just leave a reference.
}
 
export default Home;