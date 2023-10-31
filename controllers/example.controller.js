// DEPENDENCIES
const express = require("express");
const router = express.Router();
let exampleModel = require("../models/example.model");

// Make sure your model is working
console.log(exampleModel);

// GET
router.get("/:id", (req, res) => {
  // Controller logic to get a single item
  const { id } = req.params;
  res.status(200).send(exampleModel[`${id}`]);
});

router.get("/", (req, res) => {
  // Controller logic to get all items
  res.status(200).send(exampleModel);
});

// POST
router.post("/", (req, res) => {
  // Controller logic to create a new item
});

// EDIT
router.put("/:id", (req, res) => {
  // Controller logic to edit an item
});

// DELETE
router.delete("/:id", (req, res) => {
  // Controller logic to delete an item
});

// EXPORT
module.exports = router;
