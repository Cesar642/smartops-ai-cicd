const express = require('express');
const app = express();
const PORT = process.env.PORT || 8080;

app.get('/api/greet', (req, res) => {
  res.send('Hello from SmartOps (Node.js)!');
});

app.listen(PORT, () => {
  console.log(`SmartOps app listening on port ${PORT}`);
});

