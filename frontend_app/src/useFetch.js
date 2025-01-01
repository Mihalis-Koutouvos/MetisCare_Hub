import {useState, useEffect} from 'react';

//Custom hooks need to start with use or else they will not work
const useFetch = (url) => {
    const [data, setData] = useState(null);
    const [isLoading, setIsLoading] = useState(true);
    const [error, setError] = useState(null);

    useEffect(() => {
        setTimeout(() => {
            fetch(url)
            .then(res => {
                if (!res.ok) {
                    throw Error('Could not fetch the data for that resource.');
                }

                return res.json();
            })
            .then(data => {
                setData(data);
                setIsLoading(false);
                setError(null);
            })
            .catch(err => {
                setError(err.message);
                setIsLoading(false);
            })
        }, 1000);
    }, [url]);

    return {data, isLoading, error}
}

//We export so that other files can use this file in the future
export default useFetch;