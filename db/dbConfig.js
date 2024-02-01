require("dotenv").config();
const pgp = require("pg-promise")();

 const { DATABASE_URL } = process.env;

const cn = DATABASE_URL ? {
  connectionString: DATABASE_URL,
  max: 30
} : {
  host: process.env.PG_HOST,
  port: process.env.PG_PORT,
  database: process.env.PG_DATABASE,
  user: process.env.PG_USER,
  password: process.env.PG_PASSWORD,
};
const db = pgp(cn);
// db.connect()
//   .then((obj) => {
//     const serverVersion = obj.client.serverVersion;
//     console.log("postgres connection established");
//     obj.done();
//   })
//   .catch((error) => {
//     console.log("ERROR", error.message || error);
//   });
    console.log("postgres connection established");

module.exports = db;
