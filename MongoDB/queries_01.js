// TASK 1
db.customers.find({ ContactName: "Sven Ottlieb" }, { City: 1, _id: 0 });

// TASK 2
db.US_Adult_Income.find().sort({ age: -1 }).limit(1);

// TASK 3
var maxAge = db.US_Adult_Income.find().sort({ age: -1 }).limit(1).next().age;
db.US_Adult_Income.countDocuments({ age: maxAge });

// TASK 4
var result = db.US_Adult_Income.find(
  { education: "IT-career-hub" },
  { _id: 1 }
).toArray();

if (result.length > 0) {
  result.forEach((doc) => print(doc._id));
} else {
  print("Documents with education: 'IT-career-hub' are not found.");
}

// TASK 5
db.US_Adult_Income.countDocuments({ age: { $gte: 20, $lte: 30 } });
