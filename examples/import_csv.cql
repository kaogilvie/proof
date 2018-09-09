//upsert all nodes
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:examples/recipe.csv" AS row
MERGE (:Ingredient {name: row.Ingredient, amount: row.StandardAmount}),
MERGE (:Staple {family: row.Staple})
RETURN row;
