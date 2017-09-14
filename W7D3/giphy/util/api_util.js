const fetchSearchGiphys = searchTerm => {
  const url = `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=dc6zaTOxFJmzC&limit=2`;
  return $.ajax({
    method: 'GET',
    url: `${url}`
  });
};

export default fetchSearchGiphys;
