// TASK 1
db["theaters"].countDocuments({ "location.address.state": "CA" });
// TASK 2
db.listingsAndReviews
  .find({}, { name: 1, bedrooms: 1, _id: 0 })
  .sort({ bedrooms: -1 })
  .limit(1);
// TASK 3
db.listingsAndReviews.find(
  { number_of_reviews: { $gte: 50 } },
  { name: 1, review_scores_rating: 1, number_of_reviews: 1, _id: 0 }
);
