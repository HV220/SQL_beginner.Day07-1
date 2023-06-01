SELECT
          t.name,
          SUM(t.total_count) AS total_count
FROM
          (
                    (
                              SELECT
                                        pz.name,
                                        COUNT(pizzeria_id) AS total_count
                              FROM
                                        person_visits AS pv
                                        JOIN pizzeria pz ON pv.pizzeria_id = pz.id
                              GROUP BY
                                        1
                              ORDER BY
                                        2 DESC
                    )
                    UNION ALL
                    (
                              SELECT
                                        pz.name,
                                        COUNT(pz.name) AS total_count
                              FROM
                                        person_order po
                                        JOIN menu m ON po.menu_id = m.id
                                        JOIN pizzeria pz ON m.pizzeria_id = pz.id
                              GROUP BY
                                        1
                              ORDER BY
                                        2 DESC
                    )
          ) t
GROUP BY
          t.name
ORDER BY
          2 DESC,
          1 ASC;