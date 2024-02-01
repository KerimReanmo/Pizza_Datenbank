## Daten der Pizzeria
### Dishes
```
sql
SELECT * FROM dishes
```
| id  | product_name         | product_image | price | created              |
| --- | -------------------- | ------------- | ----- | -------------------- |
| 1   | Margherita           | NULL          | 8.99  | 2024-02-01 10:38:23 |
| 2   | Quattro Formaggi     | NULL          | 10.99 | 2024-02-01 10:38:23 |
| 3   | Prosciutto e Funghi  | NULL          | 9.99  | 2024-02-01 10:38:23 |
| 4   | Diavola              | NULL          | 11.99 | 2024-02-01 10:38:23 |
| 5   | Capricciosa          | NULL          | 10.49 | 2024-02-01 10:38:23 |
| 6   | Frutti di Mare       | NULL          | 12.99 | 2024-02-01 10:38:23 |
| 7   | Vegetariana          | NULL          | 9.49  | 2024-02-01 10:38:23 |
| 8   | Tonno e Cipolla      | NULL          | 11.49 | 2024-02-01 10:38:23 |
| 9   | Quattro Stagioni     | NULL          | 11.99 | 2024-02-01 10:38:23 |
| 10  | Calzone              | NULL          | 10.99 | 2024-02-01 10:38:23 |
| 11  | Rucola e Parmigiano  | NULL          | 12.49 | 2024-02-01 10:38:23 |
| 12  | Caprese              | NULL          | 8.99  | 2024-02-01 10:38:23 |
| 13  | Gorgonzola e Noci    | NULL          | 11.49 | 2024-02-01 10:38:23 |
| 14  | Funghi e Salsiccia   | NULL          | 10.99 | 2024-02-01 10:38:23 |
| 15  | Bianca               | NULL          | 9.99  | 2024-02-01 10:38:23 |
| 16  | Spinaci e Ricotta    | NULL          | 10.49 | 2024-02-01 10:38:23 |
| 17  | Pesto e Pollo        | NULL          | 11.99 | 2024-02-01 10:38:23 |
| 18  | Margherita Extra     | NULL          | 12.49 | 2024-02-01 10:38:23 |
| 19  | Marinara             | NULL          | 8.49  | 2024-02-01 10:38:23 |
| 20  | Carbonara            | NULL          | 11.49 | 2024-02-01 10:38:23 |
| 21  | Salami Deluxe        | NULL          | 7.50  | 2024-02-01 10:40:08 |

### enduser_basket
```
sql
SELECT * FROM enduser_basket
```
| id | products                                   | products_quantity | products_images | created              |
| -- | ------------------------------------------ | ------------------ | --------------- | -------------------- |
| 1  | Margherita, Quattro Formaggi               | 2                | NULL            | 2024-02-01 10:38:23 |
| 2  | Prosciutto e Funghi, Capricciosa           | 0                | NULL            | 2024-02-01 10:47:22 |
| 3  | Diavola, Frutti di Mare                    | 2                | NULL            | 2024-02-01 10:38:23 |
| 4  | Vegetariana, Tonno e Cipolla               | 2                | NULL            | 2024-02-01 10:38:23 |
| 5  | Quattro Stagioni, Calzone                  | 2                | NULL            | 2024-02-01 10:38:23 |
| 6  | Rucola e Parmigiano, Caprese               | 2                | NULL            | 2024-02-01 10:38:23 |
| 7  | Gorgonzola e Noci, Funghi e Salsiccia      | 2                | NULL            | 2024-02-01 10:38:23 |
| 8  | Bianca, Spinaci e Ricotta                  | 2                | NULL            | 2024-02-01 10:38:23 |
| 9  | Pesto e Pollo, Margherita Extra            | 2                | NULL            | 2024-02-01 10:38:23 |
| 10 | Marinara, Carbonara                        | 2                | NULL            | 2024-02-01 10:38:23 |

### enduser_order
```
sql
SELECT * FROM enduser_order
```
| id  | user_id | products                                       | quantity | dishes_id | created              |
| --- | ------- | ---------------------------------------------- | -------- | --------- | -------------------- |
| 11  | 1       | Salami Deluxe                                  | 3        | 21        | 2024-02-01 10:47:30 |
| 12  | 2       | Quattro Formaggi, Funghi e Salsiccia           | 2        | 2         | 2023-02-05 18:45:00 |
| 13  | 3       | Margherita, Prosciutto e Funghi, Capricciosa   | 2        | 1         | 2024-02-01 10:48:19 |
| 14  | 4       | Vegetariana                                    | 1        | 7         | 2023-09-10 14:00:00 |
| 15  | 4       | Diavola                                        | 152      | 4         | 2024-02-01 10:48:17 |
| 16  | 4       | Frutti di Mare                                 | 2        | 6         | 2024-02-01 10:47:37 |
| 17  | 4       | Tonno e Cipolla                                | 6        | 8         | 2024-02-01 10:47:35 |
| 18  | 4       | Quattro Stagioni                               | 2        | 9         | 2024-02-01 10:48:14 |
| 19  | 4       | Calzone                                        | 2        | 10        | 2024-02-01 10:48:16 |
| 20  | 4       | Rucola e Parmigiano                            | 2        | 11        | 2024-02-01 10:47:40 |
| 21  | 1       | Margherita, Prosciutto e Funghi, Capricciosa   | 2        | 1         | 2023-08-01 12:30:00 |
| 22  | 2       | Margherita, Quattro Formaggi, Diavola          | 2        | 2         | 2023-08-05 18:45:00 |
| 23  | 3       | Quattro Stagioni, Calzone, Rucola e Parmigiano | 2        | 9         | 2023-08-10 20:15:00 |
| 24  | 1       | Vegetariana, Tonno e Cipolla, Gorgonzola e Noci | 2        | 7         | 2023-08-15 21:30:00 |

### menu_ingredient
```
sql
SELECT * FROM menu_ingredient
```
| dishes_id | ingredient_id |
| --------- | -------------- |
| 1         | 1              |
| 1         | 2              |
| 2         | 2              |
| 2         | 14             |
| 2         | 16             |
| 3         | 1              |
| 3         | 4              |
| 3         | 11             |
| 4         | 1              |
| 4         | 5              |
| 4         | 11             |
| 5         | 1              |
| 5         | 4              |
| 5         | 7              |
| 5         | 17             |
| 6         | 1              |
| 6         | 9              |
| 6         | 18             |
| 7         | 1              |
| 7         | 3              |
| 7         | 6              |
| 7         | 7              |
| 7         | 17             |
| 8         | 7              |
| 8         | 9              |


### user
```
sql
SELECT * FROM user
```
| id  | firstname | lastname   | email                          | phonenumber | address                                | created              |
| --- | --------- | ---------- | ------------------------------ | ----------- | -------------------------------------- | -------------------- |
| 1   | Max       | Mustermann  | max.mustermann@example.com     | 1234567890  | Musterstraße 123, Musterstadt         | 2024-02-01 10:39:05 |
| 2   | Maria     | Musterfrau  | maria.musterfrau@example.com   | 0987654321  | Beispielweg 456, Beispielstadt        | 2024-02-01 10:39:05 |
| 3   | Hans      | Beispiel    | hans.beispiel@example.com      | 1122334455  | Musterplatz 789, Musterstadt          | 2024-02-01 10:39:05 |
| 4   | Klaus     | Kunde       | klaus.kunde@example.com        | 5555555555  | Musterstraße 123, Musterstadt         | 2024-02-01 10:40:08 |


