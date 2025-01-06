import {Link} from 'react-router-dom';

const NotFoundErrorPage = () => {
    return ( 
        <div className="not-found">
            <h1>Sorry</h1>
            <p>This page cannot be found.</p>
            <Link to="/">We will direct you back to the home page...</Link>
        </div>
     );
}
 
export default NotFoundErrorPage;