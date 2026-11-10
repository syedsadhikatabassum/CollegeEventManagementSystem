package com.model;

public class Event {

    private int eventId;
    private String eventName;
    private String category;
    private String eventDate;
    private String eventTime;
    private String venue;
    private String description;
    private int maxParticipants;

    public Event() {
    }

    public Event(int eventId, String eventName, String category,
            String eventDate, String eventTime, String venue,
            String description, int maxParticipants) {

        this.eventId = eventId;
        this.eventName = eventName;
        this.category = category;
        this.eventDate = eventDate;
        this.eventTime = eventTime;
        this.venue = venue;
        this.description = description;
        this.maxParticipants = maxParticipants;
    }

    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getEventDate() {
        return eventDate;
    }

    public void setEventDate(String eventDate) {
        this.eventDate = eventDate;
    }

    public String getEventTime() {
        return eventTime;
    }

    public void setEventTime(String eventTime) {
        this.eventTime = eventTime;
    }

    public String getVenue() {
        return venue;
    }

    public void setVenue(String venue) {
        this.venue = venue;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getMaxParticipants() {
        return maxParticipants;
    }

    public void setMaxParticipants(int maxParticipants) {
        this.maxParticipants = maxParticipants;
    }
}