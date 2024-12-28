import {useState} from 'react';
import BlogList from './BlogList';

const Home = () => {
    //Initial value is array of blogs in useState
    //Each id needs to be unique
    const [blogs, setBlogs] = useState([
        {title: 'My new website', body: 'hehehhe', author: 'Mario', id: 1},
        {title: 'My', body: 'hehe', author: 'Luigi', id: 2},
        {title: 'My', body: 'he', author: 'Mario', id: 3}
    ]);

    const handleDelete = (id) => {
        //Returns new array based on original, so no mutation 
        const newBlogs = blogs.filter(blog => blog.id !== id);
        setBlogs(newBlogs);
    }

    //Functions can be passed in as props
    return (  
        <div className="home">
            <BlogList blogs={blogs} title="All Blogs" handleDelete={handleDelete}/>
        </div>
    );
}
 
export default Home;