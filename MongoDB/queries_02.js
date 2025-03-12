//  TASK 1
db["imdb"].find({
  writers: { $size: 3 },
  directors: { $size: 2 },
});
//  TASK 2
db.bookings
  .find({ vin: "WME4530421Y135045" }, { init_address: 1, _id: 0 })
  .sort({ final_date: -1 });

//  TASK 3

db.bookings.countDocuments({ final_fuel: 0 });

//  TASK 4
db.bookings
  .find({}, { distance: 1, vin: 1, _id: 0 })
  .sort({ distance: -1 })
  .limit(1);

//  TASK 5
db.imdb.find({ cast: "Brad Pitt" }).sort({ "imdb.rating": -1 }).limit(1);
