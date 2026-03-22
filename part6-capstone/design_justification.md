## Storage Systems

For the hospital system, multiple storage systems are used to handle different types of workloads efficiently. PostgreSQL is used as the primary OLTP database to store structured patient data such as medical history, prescriptions, and billing information. It ensures ACID compliance and strong consistency, which is critical in healthcare systems.

MongoDB is used for storing real-time ICU monitoring data because it can handle high-velocity streaming data with flexible schema design. Kafka is used as a streaming platform to ingest real-time vitals data from ICU devices.

A Data Lake (such as Amazon S3) is used to store raw data from all sources, including logs, historical patient records, and unstructured data. This allows scalable and cost-effective storage.

A Data Warehouse is built on top of the data lake for analytical queries and reporting. It enables business intelligence use cases such as monthly reports on hospital operations.

A Vector Database is used to store embeddings of patient records and documents, enabling semantic search for natural language queries by doctors.

## OLTP vs OLAP Boundary

The OLTP system consists of PostgreSQL, where real-time transactional data such as patient admissions, treatments, and billing are recorded. This system is optimized for fast inserts, updates, and queries.

The OLAP system begins at the Data Lake and Data Warehouse layers. Data is periodically extracted from the OLTP system and loaded into the data warehouse through ETL pipelines. The data warehouse is optimized for analytical queries, aggregations, and reporting.

Thus, the boundary lies between PostgreSQL (transactional system) and the Data Lake/Data Warehouse (analytical system).

## Trade-offs

One major trade-off in this architecture is the increased complexity due to multiple systems. Managing PostgreSQL, MongoDB, Kafka, Data Lake, Data Warehouse, and Vector Database requires more infrastructure and operational effort.

However, this trade-off is justified because it allows each system to specialize in its function, improving performance and scalability. To mitigate this complexity, the system can use managed cloud services and orchestration tools. Monitoring and automation tools can also be used to ensure reliability and reduce manual intervention.
