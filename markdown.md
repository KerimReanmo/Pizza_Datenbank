## Datenbank ER-Modell https://dbdiagram.io/d/65b8b59cac844320ae04b55d
## Testdaten Pizzeria
### 1. Bestimme alle Pizzen, die Salami als Zutat haben und einen Mindest-Preis von 7.00€haben 

```sql
SELECT d.*
FROM dishes d 
JOIN menu_ingredient menui ON d.id = menui.dishes_id
JOIN ingredient ingredis ON menui.ingredient_id = ingredis.id
WHERE ingredis.name = 'Salami' AND d.price >= 7.00;

```
| id | product_name  | product_image | price  |
|----|---------------|---------------|--------|
| 4  | Hawaiian      | NULL          | 11.99  |
| 19 | Bacon Ranch   | NULL          | 12.49  |


## Testdaten Pizzeria
### 2. Bestimme alle Bestellungen und deren Produkte für letzten Dezember 

```sql
SELECT eo.*, GROUP_CONCAT(d.product_name) AS ordered_products
FROM enduser_order eo
JOIN dishes d ON FIND_IN_SET(d.id, eo.order_products)
WHERE MONTH(eo.order_created) = 12 AND YEAR(eo.order_created) = YEAR(CURDATE()) - 1
GROUP BY eo.id;

```
| id | order_customer_firstname | order_customer_lastname | order_customer_email   | order_customer_phonenumber | order_products         | order_products_quantity | order_products_images | order_price | order_customer_address | order_created          | ordered_products                       |
|----|--------------------------|-------------------------|------------------------|----------------------------|------------------------|--------------------------|------------------------|--------------|------------------------|------------------------|---------------------------------------|
| 1  | John                     | Doe                     | john@example.com       | 123456789                  | 1,2,3                  | 2                        | NULL                   | 29.97        | 123 Main St            | 2023-12-30 20:00:00   | Margherita,Pepperoni,Vegetarian         |
| 2  | Jane                     | Smith                   | jane@example.com       | 987654321                  | 4,5,6                  | 3                        | NULL                   | 39.97        | 456 Oak St             | 2023-12-18 00:00:00   | Hawaiian,Supreme,BBQ Chicken           |

## Testdaten Pizzeria
### 3. Bestimme alle Bestellungen, die ein Produkt mit Salami als Zutat beinhalten 

```sql
SELECT eo.*
FROM enduser_order eo
JOIN dishes d ON FIND_IN_SET(d.id, eo.order_products)
JOIN menu_ingredient mi ON d.id = mi.dishes_id
JOIN ingredient i ON mi.ingredient_id = i.id
WHERE i.name = 'Salami';
```
| id  | order_customer_firstname | order_customer_lastname | order_customer_email          | order_customer_phonenumber | order_products                                               | order_products_quantity | order_products_images | order_price | order_customer_address | order_created          |
|-----|--------------------------|-------------------------|-------------------------------|---------------------------|-------------------------------------------------------------|--------------------------|------------------------|--------------|------------------------|------------------------|
| 2   | Jane                     | Smith                   | jane@example.com              | 987654321                 | 4,5,6                                                         | 3                        | NULL                   | 39.97        | 456 Oak St             | 2023-12-18 00:00:00   |
| 9   | William                  | Moore                   | william@example.com           | 333444555                 | 4,8,12                                                        | 3                        | NULL                   | 52.45        | 606 Pine St            | 2024-01-31 00:00:00   |
| 16  | Markus                   | Benzin                  | kundenummereins@example.com   | 53453456                  | 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20             | 1                        | NULL                   | NULL         | 123 All Street         | 2024-02-01 12:00:00   |
| 16  | Markus                   | Benzin                  | kundenummereins@example.com   | 53453456                  | 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20             | 1                        | NULL                   | NULL         | 123 All Street         | 2024-02-01 12:00:00   |



## Testdaten Pizzeria
### 4. Bestimme alle Bestellungen und deren Produkte mit derselben Adresse

```sql
SELECT eo.*, GROUP_CONCAT(d.product_name) AS ordered_products
FROM enduser_order eo
JOIN dishes d ON FIND_IN_SET(d.id, eo.order_products)
WHERE eo.order_customer_address IN (
    SELECT DISTINCT order_customer_address
    FROM enduser_order
    GROUP BY order_customer_address
    HAVING COUNT(DISTINCT id) > 1
)
GROUP BY eo.id;

```
| id  | order_customer_firstname | order_customer_lastname  | order_customer_email       | order_customer_phonenumber | order_products          | order_products_quantity | order_products_images | order_price | order_customer_address | order_created          | ordered_products     |
|-----|--------------------------|--------------------------|----------------------------|----------------------------|-------------------------|--------------------------|------------------------|--------------|------------------------|------------------------|----------------------|



## Testdaten Pizzeria
### 5. Bestimme alle Bestellungen und deren Produkte, die für alle Produkte eine Mindestmenge von 2 haben und dabei mindestens 3 Produkte insgesamt

```sql
SELECT eo.*, GROUP_CONCAT(d.product_name) AS ordered_products
FROM enduser_order eo
JOIN dishes d ON FIND_IN_SET(d.id, eo.order_products)
WHERE eo.order_products_quantity >= 2
GROUP BY eo.id
HAVING COUNT(DISTINCT d.id) >= 3;

```
| id  | order_customer_firstname | order_customer_lastname | order_customer_email      | order_customer_phonenumber | order_products             | order_products_quantity | order_products_images | order_price | order_customer_address | order_created          | ordered_products                                |
|-----|--------------------------|-------------------------|---------------------------|----------------------------|----------------------------|--------------------------|------------------------|--------------|------------------------|------------------------|--------------------------------------------------|
| 1   | John                     | Doe                     | john@example.com          | 123456789                  | 1,2,3                      | 2                        | NULL                   | 29.97        | 123 Main St            | 2023-12-30 20:00:00   | Margherita,Pepperoni,Vegetarian                  |
| 2   | Jane                     | Smith                   | jane@example.com          | 987654321                  | 4,5,6                      | 3                        | NULL                   | 39.97        | 456 Oak St             | 2023-12-18 00:00:00   | Hawaiian,Supreme,BBQ Chicken                    |
| 4   | Emily                    | Williams                | emily@example.com         | 789654123                  | 10,11,12                   | 2                        | NULL                   | 45.96        | 101 Elm St             | 2024-01-30 21:30:00   | Buffalo Chicken,Four Cheese,Veggie Delight      |
| 6   | Emma                     | Davis                   | emma@example.com          | 321987654                  | 1,5,9                      | 3                        | NULL                   | 51.96        | 303 Birch St           | 2024-01-30 22:30:00   | Margherita,Supreme,Meat Lovers                  |
| 7   | Daniel                   | Miller                  | daniel@example.com        | 111222333                  | 2,6,10                     | 2                        | NULL                   | 44.96        | 404 Cedar St           | 2024-01-30 23:00:00   | Pepperoni,BBQ Chicken,Buffalo Chicken           |
| 9   | William                  | Moore                   | william@example.com       | 333444555                  | 4,8,12                     | 3                        | NULL                   | 52.45        | 606 Pine St            | 2024-01-31 00:00:00   | Hawaiian,Spinach and Feta,Veggie Delight        |



## Testdaten Pizzeria
### 6. Bestimme alle Kunden (Adressen), die schon jedes Produkt mindestens einmal bestellt haben

```sql
SELECT eo.*, GROUP_CONCAT(d.product_name) AS ordered_products
FROM enduser_order eo
JOIN dishes d ON FIND_IN_SET(d.id, eo.order_products)
WHERE eo.order_customer_address IN (
    SELECT DISTINCT order_customer_address
    FROM enduser_order
    GROUP BY order_customer_address
    HAVING COUNT(DISTINCT id) > 1
)
GROUP BY eo.id;

```
| eo.order_customer_address |
|---------------------------|
| 123 All Street            |
