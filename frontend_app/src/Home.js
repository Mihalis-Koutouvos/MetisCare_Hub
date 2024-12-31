import {useState, useEffect} from 'react';
import BlogList from './BlogList';

const Home = () => {
    //Initial value is array of blogs in useState
    //Each id needs to be unique
    const [blogs, setBlogs] = useState(null);

    
    useEffect(() => {
        //Once we have the data back, .then runs
        fetch('http://localhost:3000/blogs')
            .then(res => {
              return res.json();
            })
            .then(data => {
                setBlogs(data);
            })
    }, []);

    
    return (  
        //When need to use JavaScript, use {}
        <div className="home">
            {blogs && <BlogList blogs={blogs} title="All Blogs"/>}
        </div>
    );
}
 
export default Home;