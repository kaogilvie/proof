//manually create all nodes if needed because windows doesn't let you mount stuff
MERGE (:Ingredient {name: "Stout Beer", amount: "1 cup"})-[:TYPE_OF]->(:Staple {family: 'Beer'});

//upsert all nodes
//file: refers to the import directory which is changed via volume
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/recipe.csv" AS row
MERGE (:Ingredient {name: row.Ingredient, amount: row.StandardAmount})
MERGE (:Staple {family: row.Staple})
MERGE (:Recipe {name: 'Irish Car Bomb Cupcakes'})
RETURN row;

//create recipe node with relationships
MERGE (:Recipe {name: "Car Bomb Cupcakes"})-[:VARIATION_OF]->(:Family {type: "Cupcake"});

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

//upsert all nodes
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:examples/recipe2.csv" AS row
MERGE (:Ingredient {name: row.Ingredient, amount: row.StandardAmount}),
MERGE (:Staple {family: row.Staple})
RETURN row;
