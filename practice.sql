SELECT *
  FROM animals
    JOIN visits
      ON animal_id = animals.id
    JOIN vets
      ON vets.id = vet_id
    ORDER BY visit_date DESC
    LIMIT 1;
