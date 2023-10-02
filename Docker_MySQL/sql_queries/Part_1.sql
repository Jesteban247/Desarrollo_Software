SELECT
    CONCAT(s.first_name, ' ', s.last_name) AS Vendedor,
    st.store_id AS Tienda,
    SUM(CASE WHEN MONTH(r.rental_date) = 5 THEN 1 ELSE 0 END) AS Alquileres_Mayo,
    SUM(CASE WHEN MONTH(r.rental_date) = 6 THEN 1 ELSE 0 END) AS Alquileres_Junio,
    SUM(CASE WHEN MONTH(r.rental_date) = 6 THEN 1 ELSE 0 END) - SUM(CASE WHEN MONTH(r.rental_date) = 5 THEN 1 ELSE 0 END) AS Diferencia,
    (SUM(CASE WHEN MONTH(r.rental_date) = 6 THEN 1 ELSE 0 END) - SUM(CASE WHEN MONTH(r.rental_date) = 5 THEN 1 ELSE 0 END)) / SUM(CASE WHEN MONTH(r.rental_date) = 5 THEN 1 ELSE 0 END) * 100 AS Porcentaje_Crecimiento
FROM
    rental r
INNER JOIN
    staff s ON r.staff_id = s.staff_id
INNER JOIN
    store st ON s.store_id = st.store_id
WHERE
    MONTH(r.rental_date) IN (5, 6)
GROUP BY
    Vendedor, Tienda;
