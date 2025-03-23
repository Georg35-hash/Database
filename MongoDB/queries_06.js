// TASK 1
db.tracks.find().sort({ Danceability: -1, Energy: -1 }).limit(1);
// TASK 2
db.tracks.find().sort({ Duration_ms: -1 }).limit(1);
// TASK 3
db.tracks.aggregate([
  { $group: { _id: "$Album", trackCount: { $sum: 1 } } },
  { $sort: { trackCount: -1 } },
  { $limit: 1 },
]);
// TASK 4
db.tracks.find().sort({ Stream: -1 }).limit(1);
// TASK 5
// Экспортируем топ-20 треков по прослушиваниям Spotify
const top20Spotify = db.tracks.find().sort({ Stream: -1 }).limit(20).toArray();
const top20Youtube = db.tracks.find().sort({ Views: -1 }).limit(20).toArray();

// Импортируем в коллекцию ich_edit
db.ich_edit.insertMany(
  top20Spotify.map((track) => ({ ...track, Category: "top20spotify" }))
);
db.ich_edit.insertMany(
  top20Youtube.map((track) => ({ ...track, Category: "top20youtube" }))
);
