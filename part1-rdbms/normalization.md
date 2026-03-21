## Anomaly Analysis

### Insert Anomaly
If a new product or customer wants to be added but no order has been placed yet, we cannot insert their data without creating a fake order entry.
Example: A new customer "CUST051" cannot be added unless an order exists.

### Update Anomaly
If a customer's city or details are stored multiple times in different rows, updating one row but not others will create inconsistency.
Example: If customer "CUST048" changes city, multiple rows must be updated, risking mismatch.

### Delete Anomaly
If the last order of a customer is deleted, all information about that customer is also lost.
Example: Deleting order "ORD2001" removes customer "CUST028" data completely.

---

## Normalization Justification

Keeping all data in one table may seem simpler, but it introduces redundancy, inconsistency, and data integrity issues. In the given dataset, customer information is repeated across multiple rows for every order they place. This leads to update anomalies — if a customer changes their details, multiple rows must be updated, increasing the risk of inconsistent data.

Similarly, insert anomalies occur when we cannot store information about a new entity (like a customer or product) without associating it with an order. This restricts flexibility in database operations. Delete anomalies are even more critical — removing a single order can result in losing important customer or product data permanently.

By normalizing the database into Third Normal Form (3NF), we separate entities into logical tables such as Customers, Orders, and Products. Each table stores only relevant attributes, reducing redundancy and improving data integrity. Relationships are maintained using foreign keys, ensuring consistency.

Therefore, normalization is not over-engineering but a necessary step to build scalable, maintainable, and reliable database systems.
