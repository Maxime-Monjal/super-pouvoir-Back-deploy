const express = require('express');
const cors = require('cors');
require('dotenv').config();
const connection = require('./databases/database');

const { SERVER_PORT, CLIENT_URL } = process.env; // (attention!!!)

const app = express();

app.use(
  cors({
    origin: CLIENT_URL,
  })
);
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

/* filter sub-categories */

app.get('/categories/inutile/max-effet', (req, res) => {
  connection.query(
    `SELECT * FROM super_pouvoir sp JOIN categorie cat ON sp.categorie_idcategorie = cat.idcategorie WHERE cat.name = "inutile" AND time <= ?`,
    [req.query.duree],
      (error, result) => {
        if (error) {
          res.status(500).json({ errorMessage: error.message });
        } else {
          res.status(201).json({...result});
        }
      }
    );
  }
);

/* filter categories */

app.get('/categories/inutile', (req, res) => {
  connection.query(
    `SELECT * FROM super_pouvoir sp JOIN categorie cat ON sp.categorie_idcategorie = cat.idcategorie WHERE cat.name = "inutile"`,
      (error, result) => {
        if (error) {
          res.status(500).json({ errorMessage: error.message });
        } else {
          res.status(201).json({...result});
        }
      }
    );
  }
);

app.get('/categories/environnemental', (req, res) => {
  connection.query(
    `SELECT * FROM super_pouvoir sp JOIN categorie cat ON sp.categorie_idcategorie = cat.idcategorie WHERE cat.name = "environnemental"`,
      (error, result) => {
        if (error) {
          res.status(500).json({ errorMessage: error.message });
        } else {
          res.status(201).json({...result});
        }
      }
    );
  }
);

app.get('/categories/corporel', (req, res) => {
  connection.query(
    `SELECT * FROM super_pouvoir sp JOIN categorie cat ON sp.categorie_idcategorie = cat.idcategorie WHERE cat.name = "corporel"`,
      (error, result) => {
        if (error) {
          res.status(500).json({ errorMessage: error.message });
        } else {
          res.status(201).json({...result});
        }
      }
    );
  }
);

app.get('/categories/classique', (req, res) => {
  connection.query(
    `SELECT * FROM super_pouvoir sp JOIN categorie cat ON sp.categorie_idcategorie = cat.idcategorie WHERE cat.name = "classique"`,
      (error, result) => {
        if (error) {
          res.status(500).json({ errorMessage: error.message });
        } else {
          res.status(201).json({...result});
        }
      }
    );
  }
);

app.get('/categories/flippant', (req, res) => {
  connection.query(
    `SELECT * FROM super_pouvoir sp JOIN categorie cat ON sp.categorie_idcategorie = cat.idcategorie WHERE cat.name = "flippant"`,
      (error, result) => {
        if (error) {
          res.status(500).json({ errorMessage: error.message });
        } else {
          res.status(201).json({...result});
        }
      }
    );
  }
);

/* super_power list */
app.get('/:category', (req, res) => {
  connection.query(
    `SELECT * FROM super_pouvoir sp JOIN catégorie cat ON sp.catégorie_idcatégorie = cat.idcatégorie WHERE cat.name = ?`,
    [req.params.category],
    (error, result) => {
      if (error) {
        res.status(500).json({ errorMessage: error.message });
      } else {
        res.status(201).json(result);
      }
    }
  );
});

app.get('/', (request, response) => {
  connection.query('SELECT * FROM super_pouvoir', (error, result) => {
    if (error) {
      response.status(500).send(error);
    }
    if (result.lenght === 0) {
      response.sendStatus(404);
    } else {
      response.status(200).json(result);
    }
  });
});

app.get('/power/:id', (req, res) => {
  connection.query(
    `SELECT * FROM super_pouvoir WHERE idsuper_pouvoir = ?`,
    [req.params.id],
    (error, result) => {
      if (error) {
        res.status(500).send(error);
      } else if (result.length === 0) {
        res.sendStatus(404);
      } else {
        res.status(200).json(result[0]);
      }
    }
  );
});

app.get('/product/:slug', (req, res) => {
  connection.query(
    `SELECT * FROM super_pouvoir WHERE slug = ? `,
    [req.params.slug],
    (error, result) => {
      if (error) {
        res.status(500).send(error);
      } else if (result.length === 0) {
        res.sendStatus(404);
      } else {
        res.status(200).json(result[0]);
      }
    }
  );
});

// GET - Ordered data recovery (i.e. ascending, descending)
// EX : http://localhost:8080/prices/order/ASC ou http://localhost:8080/prices/order/asc

app.get('/prices/order/:value', (req, res) => {
  let order = 'ASC';
  if (req.params.value.toLowerCase() === 'desc') {
    order = 'DESC';
  }
  connection.query(
    `SELECT * FROM super_pouvoir ORDER BY prix ${order}`,
    (error, result) => {
      if (error) {
        res.status(500).send(error);
      } else {
        res.status(200).json(result);
      }
    }
  );
});

// Don't write anything below this line!
app.listen(SERVER_PORT, () => {
  console.log(`Server is running on port ${SERVER_PORT}.`);
});
