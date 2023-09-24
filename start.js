const express = require('express');
const app = express();
const path = require('path');
const { sayHello } = require('.');

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
    res.sendFile(path.join(__dirname, 'views', 'index.html'));
  });

// Dynamic endpoint that accepts an argument
  app.get('/show', (req, res) => {
    const argument = req.query.argument; // Retrieve the argument from the user

    sayHello(); // Call the function from the imported module (assignment 1)
  
    // Check if the argument is provided
    if (!argument) {
      return res.status(400).json({ error: 'Please provide an argument.' });
    }
  
    const responseData = {
      message: `You provided the argument: ${argument}`,
    };
  
    res.json(responseData);
  });
  

const port = process.env.PORT || 5500;
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
