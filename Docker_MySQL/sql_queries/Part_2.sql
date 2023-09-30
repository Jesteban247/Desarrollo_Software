SELECT
    f.title AS Pelicula,
    s.store_id AS Tienda,
    SUM(CASE WHEN MONTH(r.rental_date) = 5 THEN 1 ELSE 0 END) AS Prestamos_Mayo,
    SUM(CASE WHEN MONTH(r.rental_date) = 6 THEN 1 ELSE 0 END) AS Prestamos_Junio,
    SUM(CASE WHEN MONTH(r.rental_date) = 6 THEN 1 ELSE 0 END) - SUM(CASE WHEN MONTH(r.rental_date) = 5 THEN 1 ELSE 0 END) AS Diferencia,
    IF(SUM(CASE WHEN MONTH(r.rental_date) = 5 THEN 1 ELSE 0 END) > 0,
        (SUM(CASE WHEN MONTH(r.rental_date) = 6 THEN 1 ELSE 0 END) - SUM(CASE WHEN MONTH(r.rental_date) = 5 THEN 1 ELSE 0 END)) / SUM(CASE WHEN MONTH(r.rental_date) = 5 THEN 1 ELSE 0 END) * 100,
        0) AS Porcentaje_Crecimiento
FROM
    rental r
INNER JOIN
    inventory i ON r.inventory_id = i.inventory_id
INNER JOIN
    film f ON i.film_id = f.film_id
INNER JOIN
    customer c ON r.customer_id = c.customer_id
INNER JOIN
    store s ON c.store_id = s.store_id
WHERE
    MONTH(r.rental_date) IN (5, 6)
GROUP BY
    Pelicula, Tienda
LIMIT 10;
