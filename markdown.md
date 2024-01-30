## Testdaten Pizzeria
### 1. Bestimme alle Pizzen, die Salami als Zutat haben und einen Mindest-Preis von 7.00€haben 

```sql
SELECT dingens.*
FROM dishes dingens
JOIN menu_ingredient menuings ON dingens.id = menuings.dishes_id
JOIN ingredient ingis ON menuings.ingredient_id = ingis.id
WHERE ingis.name = 'Salami' AND dingens.price >= 7.00;

```

| id | first\_name | last\_name | street | house\_nr | plz | city | created\_at |
(4, 'Hawaiian', NULL, '11.99'),
(19, 'Bacon Ranch', NULL, '12.49');
