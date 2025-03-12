// TASK 1
db.US_Adult_Income.aggregate([
  { $group: { _id: null, avgAge: { $avg: "$age" } } },
]);
// TASK 2
db["090924_Heorhii_orders"].insertMany([
  { id: 1, customer: "Olga", product: "Apple", amount: 15.55, city: "Berlin" },
  { id: 2, customer: "Anna", product: "Apple", amount: 10.05, city: "Madrid" },
  { id: 3, customer: "Alona", product: "Kiwi", amount: 9.6, city: "Berlin" },
  { id: 4, customer: "Anton", product: "Apple", amount: 20, city: "Roma" },
  { id: 5, customer: "Olga", product: "Banana", amount: 8, city: "Madrid" },
  { id: 6, customer: "Petr", product: "Orange", amount: 18.3, city: "Paris" },
]);
// TASK 3
db["090924_orders_Heorhii"].countDocuments();
// TASK 4
db["090924_orders_Heorhii"].countDocuments({ product: "Apple" });
// TASK 5
db["090924_orders_Heorhii"]
  .find({}, { id: 1, _id: 0 })
  .sort({ amount: -1 })
  .limit(3);
// TASK 6
db["090924_orders_Heorhii"].countDocuments({ city: "Berlin" });
// TASK 7
db["090924_orders_Heorhii"].countDocuments({
  product: "Apple",
  city: { $in: ["Berlin", "Madrid"] },
});
// TASK 8
db["090924_orders_Heorhii"].aggregate([
  { $group: { _id: "$customer", totalSpent: { $sum: "$amount" } } },
]);
// TASK 9
db["090924_orders_Heorhii"].aggregate([
  { $match: { customer: "Olga" } },
  { $group: { _id: "$city" } },
]);
