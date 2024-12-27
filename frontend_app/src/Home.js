import {useState} from 'react';
import BlogList from './BlogList';

const Home = () => {
    //Initial value is array of blogs in useState
    //Each id needs to be unique
    const [blogs, setBlogs] = useState([
        {title: 'My new website', body: 'hehehhe', author: 'Mario', id: 1},
        {title: 'My', body: 'hehe', author: 'Luigi', id: 2},
        {title: 'My', body: 'he', author: 'Wario', id: 3}
    ]);

    return (  
        //Propping here:
        //This is the parent prop; first blogs is being referenced by 
        //() in BlogList.js
        <div className="home">
            <BlogList blogs={blogs} title="All Blogs"/>
        </div>
    );
}
 
export default Home;