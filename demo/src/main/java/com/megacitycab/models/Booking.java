package com.megacitycab.models;

import java.util.Date;

public class Booking {
    private int bookingId;
    private int userId;
    private String customerName;
    private String phone;
    private String address;
    private String pickup;
    private String destination;
    private Date date;
    private String status;

    // Constructor
    public Booking(int bookingId, int userId, String customerName, String phone, String address,
                   String pickup, String destination, Date date, String status) {
        this.bookingId = bookingId;
        this.userId = userId;
        this.customerName = customerName;
        this.phone = phone;
        this.address = address;
        this.pickup = pickup;
        this.destination = destination;
        this.date = date;
        this.status = status;
    }

    // Getters and Setters
    public int getBookingId() { return bookingId; }
    public void setBookingId(int bookingId) { this.bookingId = bookingId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getPickup() { return pickup; }
    public void setPickup(String pickup) { this.pickup = pickup; }

    public String getDestination() { return destination; }
    public void setDestination(String destination) { this.destination = destination; }

    public Date getDate() { return date; }
    public void setDate(Date date) { this.date = date; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    @Override
    public String toString() {
        return "Booking{" +
                "bookingId=" + bookingId +
                ", userId=" + userId +
                ", customerName='" + customerName + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", pickup='" + pickup + '\'' +
                ", destination='" + destination + '\'' +
                ", date=" + date +
                ", status='" + status + '\'' +
                '}';
    }
}
