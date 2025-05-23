import {useState} from 'react';
import {useHistory} from 'react-router-dom';

const Rooms = () => {
    const [title, setTitle] = useState('');
    const [body, setBody] = useState('');
    const [author, setAuthor] = useState('Mario');
    const [isLoading, setIsLoading] = useState(false);
    const history = useHistory();

    const handleSubmit = (e) => {
        //Prevents page refreshing
        e.preventDefault();
        const blog = {title, body, author};

        setIsLoading(true);

        //Using fetch API
        fetch('http://localhost:8000/blogs', {
            method: 'POST',
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify(blog)
        }).then(() => {
            console.log('New Room Added');
            setIsLoading(false);
            //history.go(-1);

            //redirecting to the home page
            history.push('/');
        })
    }

    return (  
        <div className="rooms">
            <h2>Rooms</h2>
            <form onSubmit={handleSubmit}>
                <label>Blog Title:</label>
                <input
                    type="text"
                    required
                    value={title}
                    onChange={(e) => setTitle(e.target.value)}
                />

                <label>Blog Body:</label>
                <textarea
                    required
                    value={body}
                    onChange={(e) => setBody(e.target.value)}
                ></textarea>

                <label>Blog Author:</label>
                <select
                    value={author}
                    onChange={(e) => setAuthor(e.target.value)}
                >
                    <option value="Mario">Mario</option>
                    <option value="Yoshi">Yoshi</option>
                </select>
                {!isLoading && <button>Add Room</button>}
                {isLoading && <button disabled>Adding Room...</button>}
            </form>
        </div>
    );
}
 
export default Rooms;