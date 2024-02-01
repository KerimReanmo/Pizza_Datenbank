## Datenbank ER-Modell https://dbdiagram.io/d/65b8b59cac844320ae04b55d
## Testdaten Pizzeria
### 1. Bestimme alle Pizzen, die Salami als Zutat haben und einen Mindest-Preis von 7.00€haben 

```sql
SELECT * FROM dishes 
WHERE id IN (SELECT dishes_id FROM menu_ingredient WHERE ingredient_id = (SELECT id FROM ingredient WHERE name = 'Salami'))
AND price >= 7.00;

```
| id | product_name   | product_image | price |         created         |
|----|----------------|---------------|-------|-------------------------|
| 4  | Diavola        | NULL          | 11.99 | 2024-02-01 10:38:23    |
| 21 | Salami Deluxe  | NULL          | 7.50  | 2024-02-01 10:40:08    |



## Testdaten Pizzeria
### 2. Bestimme alle Bestellungen und deren Produkte für letzten Dezember 

```sql
SELECT * FROM enduser_order 
WHERE created >= '2023-12-01' AND created < '2024-01-01';

```
| id  | user_id | products          | quantity | dishes_id |         created         |
|-----|---------|-------------------|----------|-----------|-------------------------|
| 11  | 1       | Salami Deluxe     | 1        | 21        | 2023-12-15 12:30:00    |
| 18  | 4       | Quattro Stagioni  | 1        | 9         | 2023-12-01 22:30:00    |
| 19  | 4       | Calzone           | 1        | 10        | 2023-12-18 18:00:00   |


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
SELECT eo.id AS order_id, eo.products, eo.quantity, eo.created AS order_date, u.address
FROM enduser_order eo
JOIN user u ON eo.user_id = u.id
WHERE eo.user_id IN (SELECT u1.id
FROM user u1
JOIN user u2 ON u1.address = u2.address
WHERE u1.id <> u2.id);

```
| order_id | products                                        | quantity | order_date            | address                              |
|----------|-------------------------------------------------|----------|-----------------------|--------------------------------------|
| 11       | Salami Deluxe                                   | 3        | 2024-02-01 10:47:30  | Musterstraße 123, Musterstadt         |
| 21       | Margherita, Prosciutto e Funghi, Capricciosa     | 2        | 2023-08-01 12:30:00  | Musterstraße 123, Musterstadt         |
| 24       | Vegetariana, Tonno e Cipolla, Gorgonzola e Noci | 2        | 2023-08-15 21:30:00  | Musterstraße 123, Musterstadt         |
| 14       | Vegetariana                                    | 1        | 2023-09-10 14:00:00  | Musterstraße 123, Musterstadt         |
| 15       | Diavola                                         | 152      | 2024-02-01 10:48:17  | Musterstraße 123, Musterstadt         |
| 16       | Frutti di Mare                                  | 2        | 2024-02-01 10:47:37  | Musterstraße 123, Musterstadt         |
| 17       | Tonno e Cipolla                                 | 6        | 2024-02-01 10:47:35  | Musterstraße 123, Musterstadt         |
| 18       | Quattro Stagioni                                | 2        | 2024-02-01 10:48:14  | Musterstraße 123, Musterstadt         |
| 19       | Calzone                                         | 2        | 2024-02-01 10:48:16  | Musterstraße 123, Musterstadt         |
| 20       | Rucola e Parmigiano                             | 2        | 2024-02-01 10:47:40  | Musterstraße 123, Musterstadt         |



## Testdaten Pizzeria
### 5. Bestimme alle Bestellungen und deren Produkte, die für alle Produkte eine Mindestmenge von 2 haben und dabei mindestens 3 Produkte insgesamt:

```sql
SELECT eo.id AS order_id, eo.products, eo.quantity, eo.created AS order_date, u.address
FROM enduser_order eo
JOIN user u ON eo.user_id = u.id
WHERE eo.id IN (SELECT eo1.id
FROM enduser_order eo1
JOIN enduser_order eo2 ON eo1.id = eo2.id
WHERE eo1.quantity >= 2 AND eo2.quantity >= 2
HAVING COUNT(DISTINCT eo1.dishes_id) >= 3);

```
| order_id | products       | quantity | order_date            | address                           |
|----------|-----------------|----------|-----------------------|-----------------------------------|
| 11       | Salami Deluxe   | 3        | 2024-02-01 10:47:30   | Musterstraße 123, Musterstadt     |


## Testdaten Pizzeria
### 6. Bestimme alle Kunden (Adressen), die schon jedes Produkt mindestens einmal bestellt haben

```sql
SELECT DISTINCT u.address FROM user u
WHERE NOT EXISTS (
  SELECT i.id FROM ingredient i
  WHERE NOT EXISTS (
    SELECT d.id FROM dishes d
    WHERE NOT EXISTS (
      SELECT eo.id FROM enduser_order eo
      WHERE eo.user_id = u.id AND eo.dishes_id = d.id
    )
  )
);

```
| address                              |
|--------------------------------------|
| Musterstraße 123, Musterstadt         |
| Beispielweg 456, Beispielstadt        |
| Musterplatz 789, Musterstadt          |
