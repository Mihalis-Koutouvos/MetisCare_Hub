import {useState, useEffect} from 'react';

const useFetch = (url) => {
    const [data, setData] = useState(null);
    const [isLoading, setIsLoading] = useState(true);
    const [error, setError] = useState(null);

    useEffect(() => {
        //Use this to stop the fetch error when switching two fast between pages
        const abortCont = new AbortController();


        setTimeout(() => {
            fetch(url, {signal: abortCont.signal})
            .then(res => {
                if (!res.ok) {
                    throw Error('Could not fetch the data for that resource.');
                }
                return res.json();
            })
            .then(data => {
                setIsLoading(false);
                setData(data);
                setError(null);
            })
            .catch(err => {
                if (err.name === 'AbortError') {
                    console.log('Fetch aborted');
                } else {
                    setIsLoading(false);
                    setError(err.message);
                }
            })
        }, 1000);

        return () => abortCont.abort();
        //This aborts whatever fetch is caught with the controller
    }, [url]);

    return {data, isLoading, error};
}

export default useFetch;