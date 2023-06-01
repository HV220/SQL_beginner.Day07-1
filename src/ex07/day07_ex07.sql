SELECT
          ROUND(AVG(pz.rating:: numeric), 4) AS global_rating
FROM
          pizzeria pz;