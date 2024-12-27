import {useState} from 'react';

const Home = () => {

    //let name = 'Mario';
    //We cannot simply just change the text from a variable outside a function in a function. What
    //we have to do is make the variable reactive by using useState, which takes in whatever we 
    //are passing in and a function associated with your necessary operation. We are essentially
    //re-rendering. The process we are doing with the array is called array destructuring. If 
    //you need something to change at some point, use a State Hook.
    const [name, setName] = useState('Mario');
    const [age, setAge] = useState(25);

    const handleClick = () => {
        setName('Luigi');
        setAge(30);
    }


    return (  
        <div className="home">
            <h2>Home Page</h2>
            <p>{name} is {age} years old</p>
            <button onClick={handleClick}>Click</button>
        </div>
    );
    //Note about invoking: We don't do handleClick() because the app invokes the call for us, but 
    //we want the users to be able to do that, so we just leave a reference.
}
 
export default Home;