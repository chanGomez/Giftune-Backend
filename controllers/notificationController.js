const express = require("express");
const router = express.Router();

const {
  getNotification,
  addNotification,
  getAllNotifications,
  deleteNotification,
} = require("../queries/notification");

//This grabs the whole notification table
router.get("/", async (req, res) => {
  try {
    const allNotif = await getAllNotifications();
    res.status(200).json(allNotif);
  } catch (error) {
    res.status(404).json({ error: error });
  }
});
// This grabs all notifications relating to a specific user
router.get("/:id", async (req, res) => {
  const { id } = req.params;
  try {
    const foundNoti = await getNotification(id);
    if (foundNoti.length === 0) {
      res.status(404).json({ message: "No Notifications" });
    } else {
      res.status(200).json(foundNoti);
    }
  } catch (error) {
    res.status(500).json({ error: error });
  }
});
// Creates a new Notification
router.post("/new-notification", async (req, res) => {
  console.log(req.body);
  try {
    const addedNoti = await addNotification(req.body);
    res.status(200).json(addedNoti);
  } catch (error) {
    res.status(500).json({ error: error });
  }
});

//This deletes a notification
router.delete("/:id", async (req, res) => {
  const { id } = req.params;
  try {
    const deletedNotification = await deleteNotification(id);
    if (deletedNotification.length === 0) {
      res.status(404).json({ message: "Notification not found" });
    } else {
      res.status(200).json(deletedNotification);
    }
  } catch (error) {
    res.status(500).json({ error: error });
  }
});

module.exports = router;
