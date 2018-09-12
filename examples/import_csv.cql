//upsert all nodes
//file: refers to the import directory which is changed via volume
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/recipe.csv" AS row
MERGE (:Ingredient {name: row.Ingredient, amount: row.StandardAmount})
MERGE (:Staple {family: row.Staple})
RETURN row;

//now import relationships, now that you're a hotshot and can do nodes
