const express = require('express');
const app = express();
const path = require('path');

// Import Knex and knexfile
const knex = require('knex');
const knexfile = require('./database/knexfile.js');

// Initialize Knex with the development configuration
const db = knex(knexfile.development);

// Serve static files from the 'views' directory
app.use(express.static(path.join(__dirname, 'views')));

// For the home page, send the index.html 
app.get('/', (req, res) => {
  console.log("This is the blank page!");
  res.sendFile(path.join(__dirname, 'views', 'index.html'));
});

// For the shows page, send the shows.html
app.get('/shows', (req, res) => {
  console.log("This is the shows page!");
  res.sendFile(path.join(__dirname, 'views', 'shows.html'));
});

// Dynamic endpoint that accepts an argument
app.get('/show', (req, res) => {
  const argument = req.query.argument; // Retrieve the argument from the user

  // Check if the argument is provided
  if (!argument) {
    return res.status(400).json({ error: 'Please provide an argument.' });
  }

  const responseData = {
    message: `You provided the argument: ${argument}`,
  };

  res.json(responseData);
});

app.use(express.urlencoded({ extended: true })); // Parse form data

app.post('/addshow', async (req, res) => {
  try {
    const { name, rating } = req.body;

    // Use Knex to insert a new record into the "tv_shows" table
    const [newRecord] = await db('tv_shows')
      .insert({ name, rating })
      .returning(['id', 'name', 'rating']);

    res.status(201).json(newRecord);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

app.get('/search', async (req, res) => {
  try {
    const searchQuery = req.query['search-show']; // Retrieve the search query parameter from the request

    if (!searchQuery) {
      return res.status(400).json({ error: 'Please provide a search query.' });
    }

    // Use Knex to perform a SELECT query with a wildcard text search using the LIKE keyword
    const searchResults = await db('tv_shows')
      .where('name', 'ilike', `%${searchQuery}%`) // Use 'ilike' for case-insensitive search
      .select('id', 'name', 'rating');

    res.status(200).json(searchResults);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

app.post('/changerating', async (req, res) => {
  try {
    const { id, newRating } = req.body;

    console.log('newRating:', newRating); // Check the value of newRating

    // Use Knex to update the rating of the record with the provided ID
    await db('tv_shows')
      .where({ id })
      .update({ rating: newRating });

    // Respond with a JSON object indicating success
    res.json({ success: true });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

app.post('/removeshow', async (req, res) => {
  try {
    const { removeid } = req.body; // Use the correct field name "remove-id"

    // Use Knex to delete the record with the provided ID
    await db('tv_shows')
    .where({ id: removeid })
    .del();

    // Respond with a JSON object indicating success
    res.json({ success: true });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal server error' });
  }
});



const port = process.env.PORT || 5500;
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
