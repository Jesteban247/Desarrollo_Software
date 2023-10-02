SELECT
    CONCAT(ad.address, ', ', ci.city) AS Tienda,
    AVG(CASE WHEN MONTH(p.payment_date) = 5 THEN p.amount ELSE null END) AS Mayo2005,
    AVG(CASE WHEN MONTH(p.payment_date) = 6 THEN p.amount ELSE null END) AS Junio2005,
    AVG(CASE WHEN MONTH(p.payment_date) = 7 THEN p.amount ELSE null END) AS Julio2005,
    (AVG(CASE WHEN MONTH(p.payment_date) = 6 THEN p.amount ELSE null END) - AVG(CASE WHEN MONTH(p.payment_date) = 5 THEN p.amount ELSE null END)) / AVG(CASE WHEN MONTH(p.payment_date) = 5 THEN p.amount ELSE null END) * 100 AS Diferencia,
    (AVG(CASE WHEN MONTH(p.payment_date) = 7 THEN p.amount ELSE null END) - AVG(CASE WHEN MONTH(p.payment_date) = 6 THEN p.amount ELSE null END)) / AVG(CASE WHEN MONTH(p.payment_date) = 6 THEN p.amount ELSE null END) * 100 AS Diferencia2
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
    YEAR(p.payment_date) = 2005
AND MONTH(p.payment_date) IN (5, 6, 7)
GROUP BY
    Tienda
ORDER BY
    Tienda;