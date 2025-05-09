-- Question 1: Achieving 1NF (First Normal Form)

-- To transform the ProductDetail table into 1NF, we need to create a new table
-- where each product is represented in a separate row for each order.

CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(255),
    Product VARCHAR(255)
);

INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
    (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone');

-- The ProductDetail_1NF table now satisfies 1NF as each product is in a separate row.

-- Question 2: Achieving 2NF (Second Normal Form)

-- To transform the OrderDetails table into 2NF, we need to remove partial dependencies.
-- We will create two tables: one for Orders and one for OrderItems.

-- Create Orders table to store OrderID and CustomerName
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

-- Insert unique orders into the Orders table
INSERT INTO Orders (OrderID, CustomerName)
VALUES
    (101, 'John Doe'),
    (102, 'Jane Smith'),
    (103, 'Emily Clark');

-- Create OrderItems table to store OrderID, Product, and Quantity
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert order items into the OrderItems table
INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES
    (101, 'Laptop', 2),
    (101, 'Mouse', 1),
    (102, 'Tablet', 3),
    (102, 'Keyboard', 1),
    (102, 'Mouse', 2),
    (103, 'Phone', 1);

-- The Orders table now contains the OrderID and CustomerName, 
-- while the OrderItems table contains the OrderID, Product, and Quantity,
-- thus satisfying 2NF as all non-key columns fully depend on the primary key.