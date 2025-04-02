package model;

import java.util.Date;

public class Booking {
    private int bookingId;
    private String username;
    private String destination;
    private Date bookingDate;
    private int guests;
    private String offer;
    private double price;

    // Getters and Setters
    public int getBookingId() { return bookingId; }
    public void setBookingId(int bookingId) { this.bookingId = bookingId; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getDestination() { return destination; }
    public void setDestination(String destination) { this.destination = destination; }

    public Date getBookingDate() { return bookingDate; }
    public void setBookingDate(Date bookingDate) { this.bookingDate = bookingDate; }

    public int getGuests() { return guests; }
    public void setGuests(int guests) { this.guests = guests; }

    public String getOffer() { return offer; }
    public void setOffer(String offer) { this.offer = offer; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
}
