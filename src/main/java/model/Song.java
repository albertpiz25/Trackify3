package model;

import org.bson.types.ObjectId;

public class Song {
    private ObjectId id;
    private double acousticness;
    private String artistName;
    private double danceability;
    private double energy;
    private double instrumentalness;
    private double liveness;
    private double speechiness;
    private long streams;
    private String trackName;
    private double valence;

    // Getters e Setters


    public Song(ObjectId id, double acousticness, String artistName, double danceability, double energy, double instrumentalness, double liveness, double speechiness, long streams, String trackName, double valence) {
        this.id = id;
        this.acousticness = acousticness;
        this.artistName = artistName;
        this.danceability = danceability;
        this.energy = energy;
        this.instrumentalness = instrumentalness;
        this.liveness = liveness;
        this.speechiness = speechiness;
        this.streams = streams;
        this.trackName = trackName;
        this.valence = valence;
    }

    public Song() {
        this.id = null;
        this.acousticness = 0;
        this.artistName = null;
        this.danceability = 0;
        this.energy = 0;
        this.instrumentalness = 0;
        this.liveness = 0;
        this.speechiness = 0;
        this.streams = 0;
        this.trackName = null;
        this.valence = 0;
    }

    public ObjectId getId() {
        return id;
    }

    public void setId(ObjectId id) {
        this.id = id;
    }

    public double getAcousticness() {
        return acousticness;
    }

    public void setAcousticness(double acousticness) {
        this.acousticness = acousticness;
    }

    public String getArtistName() {
        return artistName;
    }

    public void setArtistName(String artistName) {
        this.artistName = artistName;
    }

    public double getDanceability() {
        return danceability;
    }

    public void setDanceability(double danceability) {
        this.danceability = danceability;
    }

    public double getEnergy() {
        return energy;
    }

    public void setEnergy(double energy) {
        this.energy = energy;
    }

    public double getInstrumentalness() {
        return instrumentalness;
    }

    public void setInstrumentalness(double instrumentalness) {
        this.instrumentalness = instrumentalness;
    }

    public double getLiveness() {
        return liveness;
    }

    public void setLiveness(double liveness) {
        this.liveness = liveness;
    }

    public double getSpeechiness() {
        return speechiness;
    }

    public void setSpeechiness(double speechiness) {
        this.speechiness = speechiness;
    }

    public long getStreams() {
        return streams;
    }

    public void setStreams(long streams) {
        this.streams = streams;
    }

    public String getTrackName() {
        return trackName;
    }

    public void setTrackName(String trackName) {
        this.trackName = trackName;
    }

    public double getValence() {
        return valence;
    }

    public void setValence(double valence) {
        this.valence = valence;
    }
}
