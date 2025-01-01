import {useState, useEffect} from 'react';
import BlogList from './BlogList';
import useFetch from './useFetch';

const Home = () => {

    //Grab the data, but call it blogs in line 8
    const {data: blogs, isLoading, Error} = useFetch('htpp://localhost:8000/blogs');


    return (  
        <div className="home">
            {error && <div>{error}</div>}
            {isLoading && <div>Loading...</div>}
            {blogs && <BlogList blogs={blogs} title="All Blogs"/>}
        </div>
    );
}
 
export default Home;