// OP1: insertMany()
db.products.insertMany([
  {
    product_id: "ELEC001",
    name: "Smartphone X",
    category: "Electronics",
    price: 25000
  },
  {
    product_id: "CLOT001",
    name: "Men T-Shirt",
    category: "Clothing",
    price: 799
  },
  {
    product_id: "GROC001",
    name: "Milk Pack",
    category: "Groceries",
    price: 60,
    expiry_date: new Date("2024-12-30")
  }
]);

// OP2: find Electronics > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

// OP3: Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});

// OP4: updateOne() add discount
db.products.updateOne(
  { product_id: "ELEC001" },
  { $set: { discount_percent: 10 } }
);

// OP5: createIndex()
db.products.createIndex({ category: 1 });
// Improves query performance for category-based searches
