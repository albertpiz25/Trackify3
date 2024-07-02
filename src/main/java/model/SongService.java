package model;

import com.mongodb.client.*;
import com.mongodb.client.model.Sorts;
import org.bson.Document;
import org.bson.types.ObjectId;

import java.util.ArrayList;
import java.util.List;

public class SongService {
    private final MongoCollection<Document> songCollection;

    public SongService() {
        // Connessione al database MongoDB locale (assicurati che MongoDB sia in esecuzione)
        MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
        MongoDatabase database = mongoClient.getDatabase("Trackify"); // Inserisci il nome del tuo database
        songCollection = database.getCollection("Song");
    }

    // Ottiene tutte le canzoni nel database
    public List<Song> getAllSongs() {
        List<Song> songs = new ArrayList<>();
        FindIterable<Document> documents = songCollection.find();
        for (Document doc : documents) {
            songs.add(documentToSong(doc));
        }
        return songs;
    }

    // Ottiene una singola canzone dato l'ID
    public Song getSongById(String id) {
        Document query = new Document("_id", new ObjectId(id));
        Document result = songCollection.find(query).first();
        if (result != null) {
            return documentToSong(result);
        }
        return null;
    }

    // Inserisce una nuova canzone nel database
    public void insertSong(Song song) {
        Document doc = songToDocument(song);
        songCollection.insertOne(doc);
    }

    // Aggiorna una canzone esistente nel database
    public void updateSong(Song song) {
        ObjectId id = song.getId();
        Document query = new Document("_id", id);
        Document doc = songToDocument(song);
        songCollection.replaceOne(query, doc);
    }

    // Elimina una canzone dato l'ID
    public void deleteSong(String id) {
        Document query = new Document("_id", new ObjectId(id));
        songCollection.deleteOne(query);
    }

    // Metodo privato per convertire un Document in un oggetto Song
    private Song documentToSong(Document doc) {
        Song song = new Song();
        song.setId(doc.getObjectId("_id"));
        song.setAcousticness(getDoubleValue(doc, "acousticness", 0.0));
        song.setArtistName(getStringValue(doc, "artist_name"));
        song.setDanceability(getDoubleValue(doc, "danceability", 0.0));
        song.setEnergy(getDoubleValue(doc, "energy", 0.0));
        song.setInstrumentalness(getDoubleValue(doc, "instrumentalness", 0.0));
        song.setLiveness(getDoubleValue(doc, "liveness", 0.0));
        song.setSpeechiness(getDoubleValue(doc, "speechiness", 0.0));
        song.setStreams(getLongValue(doc, "streams", 0L));
        song.setTrackName(getStringValue(doc, "track_name"));
        song.setValence(getDoubleValue(doc, "valence", 0.0));
        return song;
    }

    // Metodo privato per convertire un oggetto Song in un Document
    private Document songToDocument(Song song) {
        Document doc = new Document();
        if (song.getId() != null) {
            doc.append("_id", song.getId());
        }
        doc.append("acousticness", song.getAcousticness());
        doc.append("artist_name", song.getArtistName());
        doc.append("danceability", song.getDanceability());
        doc.append("energy", song.getEnergy());
        doc.append("instrumentalness", song.getInstrumentalness());
        doc.append("liveness", song.getLiveness());
        doc.append("speechiness", song.getSpeechiness());
        doc.append("streams", song.getStreams());
        doc.append("track_name", song.getTrackName());
        doc.append("valence", song.getValence());
        return doc;
    }

    // Metodi di utilità per ottenere valori con tipo specifico da Document
    private Double getDoubleValue(Document doc, String key, double defaultValue) {
        Object value = doc.get(key);
        if (value instanceof Number) {
            return ((Number) value).doubleValue();
        }
        return defaultValue;
    }

    private Long getLongValue(Document doc, String key, long defaultValue) {
        Object value = doc.get(key);
        if (value instanceof Number) {
            return ((Number) value).longValue();
        }
        return defaultValue;
    }

    private String getStringValue(Document doc, String key) {
        Object value = doc.get(key);
        if (value != null) {
            return value.toString();
        }
        return "";
    }

    // Metodi di ordinamento
    public List<Song> getSongsSortedBy(String attribute) {
        List<Song> songs = new ArrayList<>();
        FindIterable<Document> documents = songCollection.find().sort(Sorts.ascending(attribute));
        for (Document doc : documents) {
            songs.add(documentToSong(doc));
        }
        return songs;
    }

    // Ordina per ogni attributo specifico
    public List<Song> getSongsSortedByAcousticness() {
        return getSongsSortedBy("acousticness");
    }

    public List<Song> getSongsSortedByDanceability() {
        return getSongsSortedBy("danceability");
    }

    public List<Song> getSongsSortedByEnergy() {
        return getSongsSortedBy("energy");
    }

    public List<Song> getSongsSortedByInstrumentalness() {
        return getSongsSortedBy("instrumentalness");
    }

    public List<Song> getSongsSortedByLiveness() {
        return getSongsSortedBy("liveness");
    }

    public List<Song> getSongsSortedBySpeechiness() {
        return getSongsSortedBy("speechiness");
    }

    public List<Song> getSongsSortedByStreams() {
        return getSongsSortedBy("streams");
    }

    public List<Song> getSongsSortedByTrackName() {
        return getSongsSortedBy("track_name");
    }

    public List<Song> getSongsSortedByValence() {
        return getSongsSortedBy("valence");
    }

    // Ricerca per singolo valore
    public List<Song> searchByArtistName(String value) {
        List<Song> songs = new ArrayList<>();
        Document query = new Document("artist_name", new Document("$regex", value).append("$options", "i"));
        FindIterable<Document> documents = songCollection.find(query);
        for (Document doc : documents) {
            songs.add(documentToSong(doc));
        }
        return songs;
    }

    public List<Song> searchByTrackName(String value) {
        List<Song> songs = new ArrayList<>();
        Document query = new Document("track_name", new Document("$regex", value).append("$options", "i"));
        FindIterable<Document> documents = songCollection.find(query);
        for (Document doc : documents) {
            songs.add(documentToSong(doc));
        }
        return songs;
    }

    // Per streams
    public List<Song> searchByStreams(long minValue, Long maxValue) {
        List<Song> songs = new ArrayList<>();
        Document query = new Document("streams", new Document("$gte", minValue));
        if (maxValue != null) {
            query.get("streams", Document.class).append("$lte", maxValue);
        }
        FindIterable<Document> documents = songCollection.find(query).sort(Sorts.ascending("streams"));
        for (Document doc : documents) {
            songs.add(documentToSong(doc));
        }
        return songs;
    }

    public List<Song> searchByStreams(long minValue) {
        return searchByStreams(minValue, null);
    }

    // Per acousticness
    public List<Song> searchByAcousticness(double minValue, Double maxValue) {
        List<Song> songs = new ArrayList<>();
        Document query = new Document("acousticness", new Document("$gte", minValue));
        if (maxValue != null) {
            query.get("acousticness", Document.class).append("$lte", maxValue);
        }
        FindIterable<Document> documents = songCollection.find(query).sort(Sorts.ascending("acousticness"));
        for (Document doc : documents) {
            songs.add(documentToSong(doc));
        }
        return songs;
    }

    public List<Song> searchByAcousticness(double minValue) {
        return searchByAcousticness(minValue, null);
    }

    // Per danceability
    public List<Song> searchByDanceability(double minValue, Double maxValue) {
        List<Song> songs = new ArrayList<>();
        Document query = new Document("danceability", new Document("$gte", minValue));
        if (maxValue != null) {
            query.get("danceability", Document.class).append("$lte", maxValue);
        }
        FindIterable<Document> documents = songCollection.find(query).sort(Sorts.ascending("danceability"));
        for (Document doc : documents) {
            songs.add(documentToSong(doc));
        }
        return songs;
    }

    public List<Song> searchByDanceability(double minValue) {
        return searchByDanceability(minValue, null);
    }

    // Per energy
    public List<Song> searchByEnergy(double minValue, Double maxValue) {
        List<Song> songs = new ArrayList<>();
        Document query = new Document("energy", new Document("$gte", minValue));
        if (maxValue != null) {
            query.get("energy", Document.class).append("$lte", maxValue);
        }
        FindIterable<Document> documents = songCollection.find(query).sort(Sorts.ascending("energy"));
        for (Document doc : documents) {
            songs.add(documentToSong(doc));
        }
        return songs;
    }

    public List<Song> searchByEnergy(double minValue) {
        return searchByEnergy(minValue, null);
    }

    // Per instrumentalness
    public List<Song> searchByInstrumentalness(double minValue, Double maxValue) {
        List<Song> songs = new ArrayList<>();
        Document query = new Document("instrumentalness", new Document("$gte", minValue));
        if (maxValue != null) {
            query.get("instrumentalness", Document.class).append("$lte", maxValue);
        }
        FindIterable<Document> documents = songCollection.find(query).sort(Sorts.ascending("instrumentalness"));
        for (Document doc : documents) {
            songs.add(documentToSong(doc));
        }
        return songs;
    }

    public List<Song> searchByInstrumentalness(double minValue) {
        return searchByInstrumentalness(minValue, null);
    }

    // Per liveness
    public List<Song> searchByLiveness(double minValue, Double maxValue) {
        List<Song> songs = new ArrayList<>();
        Document query = new Document("liveness", new Document("$gte", minValue));
        if (maxValue != null) {
            query.get("liveness", Document.class).append("$lte", maxValue);
        }
        FindIterable<Document> documents = songCollection.find(query).sort(Sorts.ascending("liveness"));
        for (Document doc : documents) {
            songs.add(documentToSong(doc));
        }
        return songs;
    }

    public List<Song> searchByLiveness(double minValue) {
        return searchByLiveness(minValue, null);
    }

    // Per speechiness
    public List<Song> searchBySpeechiness(double minValue, Double maxValue) {
        List<Song> songs = new ArrayList<>();
        Document query = new Document("speechiness", new Document("$gte", minValue));
        if (maxValue != null) {
            query.get("speechiness", Document.class).append("$lte", maxValue);
        }
        FindIterable<Document> documents = songCollection.find(query).sort(Sorts.ascending("speechiness"));
        for (Document doc : documents) {
            songs.add(documentToSong(doc));
        }
        return songs;
    }

    public List<Song> searchBySpeechiness(double minValue) {
        return searchBySpeechiness(minValue, null);
    }

    // Per valence
    public List<Song> searchByValence(double minValue, Double maxValue) {
        List<Song> songs = new ArrayList<>();
        Document query = new Document("valence", new Document("$gte", minValue));
        if (maxValue != null) {
            query.get("valence", Document.class).append("$lte", maxValue);
        }
        FindIterable<Document> documents = songCollection.find(query).sort(Sorts.ascending("valence"));
        for (Document doc : documents) {
            songs.add(documentToSong(doc));
        }
        return songs;
    }

    public List<Song> searchByValence(double minValue) {
        return searchByValence(minValue, null);
    }



}
