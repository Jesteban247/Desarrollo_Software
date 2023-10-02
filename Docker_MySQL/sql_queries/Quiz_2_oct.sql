SELECT
    CONCAT(ad.address, ', ', ci.city) AS Tienda,
    COUNT(DISTINCT r.rental_id) AS Numero_Prestamos,
    AVG(p.amount) AS Pago_Promedio,
    AVG(CASE WHEN MONTH(p.payment_date) = 5 THEN p.amount ELSE 0 END) AS Mayo2005,
    AVG(CASE WHEN MONTH(p.payment_date) = 6 THEN p.amount ELSE 0 END) AS Junio2005,
    AVG(CASE WHEN MONTH(p.payment_date) = 6 THEN p.amount ELSE 0 END) - AVG(CASE WHEN MONTH(p.payment_date) = 5 THEN p.amount ELSE 0 END) AS Diferencia,
    (AVG(CASE WHEN MONTH(p.payment_date) = 6 THEN p.amount ELSE 0 END) - AVG(CASE WHEN MONTH(p.payment_date) = 5 THEN p.amount ELSE 0 END)) / AVG(CASE WHEN MONTH(p.payment_date) = 5 THEN p.amount ELSE 0 END) * 100 AS Porcentaje_Crecimiento,
    AVG(CASE WHEN MONTH(p.payment_date) = 7 THEN p.amount ELSE 0 END) AS Julio2005,
    AVG(CASE WHEN MONTH(p.payment_date) = 7 THEN p.amount ELSE 0 END) - AVG(CASE WHEN MONTH(p.payment_date) = 6 THEN p.amount ELSE 0 END) AS Diferencia2,
    (AVG(CASE WHEN MONTH(p.payment_date) = 7 THEN p.amount ELSE 0 END) - AVG(CASE WHEN MONTH(p.payment_date) = 6 THEN p.amount ELSE 0 END)) / AVG(CASE WHEN MONTH(p.payment_date) = 6 THEN p.amount ELSE 0 END) * 100 AS Porcentaje_Crecimiento2

FROM
    payment p
INNER JOIN
    rental r ON p.rental_id = r.rental_id
INNER JOIN
    inventory i ON r.inventory_id = i.inventory_id
INNER JOIN
    store st ON i.store_id = st.store_id
INNER JOIN
    address ad ON st.address_id = ad.address_id
INNER JOIN
    city ci ON ad.city_id = ci.city_id
WHERE
    MONTH(p.payment_date) IN (5, 6, 7)
GROUP BY
    Tienda
ORDER BY
    Tienda;


