const express = require("express");
const fs = require("fs");
const app = express();
const PORT = process.env.PORT || 4000;

const colors = JSON.parse(fs.readFileSync("colors.json", "utf8"));

app.get("/api/colors", (req, res) => {
  const query = (req.query.q || "").toLowerCase();
  const matches = colors.filter(c => c.name.toLowerCase().includes(query));
  res.json(matches.slice(0, 5));
});

app.listen(PORT, () => console.log(`Express API running on port ${PORT}`));
