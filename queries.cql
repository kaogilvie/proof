match (r:Recipe)
where r.name CONTAINS('Chocolate Whiskey')
MERGE (b:Family {name: 'Butter'})<-[:TYPE_OF]-(u:Ingredient {name: 'Unsalted Butter', amount: '2 sticks'})<-[:CALLS_FOR]-(r)-[:CALLS_FOR]->(d:Ingredient {name: 'Dutch-process Cocoa Powder', amount: '.75 cups'})-[:TYPE_OF]->(c:Family {name: 'Cocoa Powder'})
return *;

match (r:Recipe)
where r.name contains('Whiskey')
merge (r)-[:CALLS_FOR]->(:Ingredient {name: 'All-Purpose Flour', amount: '2 cups'})<-[:TYPE_OF]-(:Staple {family: 'Flour'})
merge (r)-[:CALLS_FOR]->(:Ingredient {name: 'Granulated Sugar', amount: '2 cups'})<-[:TYPE_OF]-(:Staple {family: 'Sugar'})
return *
