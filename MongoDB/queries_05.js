// TASK 1
db.listingsAndReviews.aggregate([
  { $match: { "address.market": "Hawaii" } },
  { $group: { _id: null, avgPrice: { $avg: "$price" } } },
]);
// TASK 2
db.sample_mflix.movies.aggregate([
  { $match: { "imdb.rating": { $gt: 8 }, year: { $gte: 2015, $lte: 2023 } } },
  {
    $group: {
      _id: null,
      count: { $sum: 1 },
      maxRating: { $max: "$imdb.rating" },
    },
  },
]);
// TASK 3
db.sample_mflix.movies
  .find(
    { "imdb.rating": { $gt: 8 }, year: { $gte: 2015, $lte: 2023 } },
    { title: 1, year: 1, "imdb.rating": 1 }
  )
  .sort({ "imdb.rating": -1 })
  .limit(1);
