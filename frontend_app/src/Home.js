import {useState} from 'react';

const Home = () => {
    //Initial value is array of blogs in useState
    //Each id needs to be unique
    const [blogs, setBlogs] = useState([
        {title: 'My new website', body: 'hehehhe', author: 'Mario', id: 1},
        {title: 'My', body: 'hehe', author: 'Luigi', id: 2},
        {title: 'My', body: 'he', author: 'Wario', id: 3}
    ]);

    return (  
        //Iterating over each row (item: blog) in map function
        //Need a key attribute in case changes are made to the array 
        <div className="home">
            
            {blogs.map((blog) => (
                <div className="blog-preview" key={blog.id}>
                    <h2>{blog.title}</h2>
                    <p>Written by {blog.author}</p>
                </div>

            ))}
        </div>
    );
}
 
export default Home;