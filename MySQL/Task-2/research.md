# Research: Database Management Systems

## 1. What is the difference between a DBMS and an RDBMS?

While both are software used to create and manage databases, they differ significantly in how they structure and handle data.

* **DBMS (Database Management System):**
    * **Structure:** Stores data as files, often in a hierarchical or navigational form.
    * **Relationships:** Does not enforce relationships between data.
    * **Usage:** Suitable for small, simple applications or specific use cases (like XML databases).
    * **Security/ACID:** Often supports fewer security features and may not fully support ACID (Atomicity, Consistency, Isolation, Durability) properties.
    * **Examples:** File systems, XML, Windows Registry.

* **RDBMS (Relational Database Management System):**
    * **Structure:** Stores data in a tabular format (tables with rows and columns).
    * **Relationships:** Enforces relationships between tables using keys (Primary Keys and Foreign Keys).
    * **Usage:** The standard for most modern, large-scale enterprise applications.
    * **Security/ACID:** strictly follows ACID properties to ensure data integrity.
    * **Examples:** MySQL, PostgreSQL, Oracle, SQL Server.

| Feature | DBMS | RDBMS |
| :--- | :--- | :--- |
| **Data Storage** | Files / Hierarchical | Tables (Relations) |
| **Data Redundancy** | Common | Minimized (Normalization) |
| **Access Speed** | Slower for complex data | Faster (using Indexing/SQL) |
| **Users** | Single-user mostly | Multi-user support |

## 2. DDL vs. DML

Based on standard database concepts (Chapters 04 and 05), the difference lies in whether you are changing the *structure* of the database or the *contents* within it.

### **DDL (Data Definition Language)**
DDL is used to define the database schema. It commands the database structure—creating tables, defining data types, and setting constraints. It is like building the "skeleton" or the "house."

* **Key Commands:** `CREATE`, `ALTER`, `DROP`, `TRUNCATE`.
* **Example Command:**
    ```sql
    CREATE TABLE Students (
        StudentID int,
        LastName varchar(255),
        FirstName varchar(255),
        Address varchar(255)
    );
    ```

### **DML (Data Manipulation Language)**
DML is used to manage the data *inside* the existing schema. It involves retrieving, inserting, deleting, and modifying the actual records. It is like putting "furniture" into the house.

* **Key Commands:** `SELECT`, `INSERT`, `UPDATE`, `DELETE`.
* **Example Command:**
    ```sql
    INSERT INTO Students (StudentID, LastName, FirstName, Address)
    VALUES (101, 'Smith', 'John', '123 Main St');
    ```

## 3. Why is Normalization important for a large system like a university database?

Normalization is critical for a university database because it organizes data to reduce **redundancy** (repetition) and improve **data integrity**.

Imagine a university system where we store the Student's Name and Address inside the "Course Registration" table.
1.  **Reducing Redundancy:** If a student registers for 5 classes, we would have to write their address 5 times. Normalization splits this into two tables (`Students` and `Registrations`). We write the address once in the `Students` table, saving storage space.
2.  **Preventing Update Anomalies:** If that student moves to a new dorm, without normalization, we would have to update their address in every single course record. If we miss one, the data becomes inconsistent (the student lives in two places at once). With normalization, we update it in one place only.
3.  **Preventing Deletion Anomalies:** If a student drops all their classes, and their personal info is stored *only* in the class registration table, we might accidentally delete the student's entire record from the university system. Normalization keeps the student data safe in its own table regardless of their enrollment status.

In short, normalization ensures the university database remains accurate, efficient, and easy to maintain as thousands of students enroll in thousands of courses.