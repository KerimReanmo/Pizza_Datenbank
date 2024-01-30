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
### 1. Bestimme alle Pizzen, die Salami als Zutat haben und einen Mindest-Preis von 7.00€haben 

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
