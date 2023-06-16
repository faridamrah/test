// File: server.js

const express = require('express');
const app = express();

// Middleware for logging requests
app.use((req, res, next) => {
  console.log(`Received a ${req.method} request for ${req.url}`);
  next();
});

// Serve static files from the "public" folder
app.use(express.static('public'));

// Route for the homepage
app.get('/', (req, res) => {
  res.send('Hello, Docker!');
});

// Route with dynamic parameter
app.get('/greet/:name', (req, res) => {
  const { name } = req.params;
  res.send(`Hello, ${name}!`);
});

// Route with query parameter
app.get('/square', (req, res) => {
  const { number } = req.query;
  const square = parseInt(number) ** 2;
  res.send(`The square of ${number} is ${square}.`);
});

// Start the server
app.listen(3000, () => {
  console.log('Server started on port 3000');
});
