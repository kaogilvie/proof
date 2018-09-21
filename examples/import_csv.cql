//upsert all nodes
//file: refers to the import directory which is changed via volume
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/recipe.csv" AS row
MERGE (:Ingredient {name: row.Ingredient, amount: row.StandardAmount})
MERGE (:Staple {family: row.Staple})
MERGE (:Recipe {name: 'Irish Car Bomb Cupcakes'})
RETURN row;

//now import relationships, now that you're a hotshot and can do nodes
//AND link together everything you just imported in the CSV as one recipe
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/recipe.csv" AS row
MATCH (ing:Ingredient {name: row.Ingredient, amount: row.StandardAmount})
MATCH (stap:Staple {family: row.Staple})
MATCH (recipe:Recipe {name: 'Irish Car Bomb Cupcakes'})
MERGE (ing)-[:TYPE_OF]->(stap)
MERGE (ing)<-[:CALLS_FOR]-(recipe)
RETURN row;
//importing CSVs will retain the relationships in-line
