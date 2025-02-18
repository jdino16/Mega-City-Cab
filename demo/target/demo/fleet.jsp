<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Fleet - Mega City Cab</title>

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <!-- Custom Styles -->
    <link rel="stylesheet" href="fleet.css">
</head>
<body class="bg-black text-white">

    <!-- 🚀 Sidebar Navigation -->
    <nav class="sidebar">
        <div class="sidebar-top">
            <h2 class="logo neon-text">Mega City Cab</h2>
            <button class="expand-btn"><i class="fas fa-bars"></i></button>
        </div>
        <!-- Live Search -->
        <div class="search-wrapper">
            <input type="text" id="searchInput" placeholder="Search...">
            <i class="fas fa-search"></i>
        </div>
        <ul class="sidebar-links">
            <li><a href="index.jsp"><i class="fas fa-home"></i> Home</a></li>
            <li><a href="fleet.jsp" class="active"><i class="fas fa-car"></i> Fleet</a></li>
            <li><a href="company.jsp"><i class="fas fa-building"></i> Company Details</a></li>
            <li><a href="our-cabs.jsp"><i class="fas fa-taxi"></i> Our Cabs</a></li>
            <li><a href="blog.jsp"><i class="fas fa-newspaper"></i> Blog</a></li>
            <li><a href="contact.jsp"><i class="fas fa-phone"></i> Contact Us</a></li>
            <li><a href="profile.jsp"><i class="fas fa-user"></i> Profile</a></li>
            <li><a href="settings.jsp"><i class="fas fa-cog"></i> Settings</a></li>
        </ul>
    </nav>

    <!-- 🌟 Main Fleet Content -->
    <main class="content">
        <section class="fleet-section">
            <h1 class="fleet-title neon-text">🚘 Explore Our Premium Fleet</h1>
            <p class="fleet-description">Find the perfect cab for your next journey!</p>

            <!-- 🔄 Fleet Filter Options -->
            <div class="fleet-filter">
                <button class="filter-btn active" data-category="all">All</button>
                <button class="filter-btn" data-category="economy">🚗 Economy</button>
                <button class="filter-btn" data-category="luxury">🚙 Luxury</button>
                <button class="filter-btn" data-category="family">🚐 Family</button>
            </div>

            <div class="fleet-slider">
                <button class="prev-btn"><i class="fas fa-chevron-left"></i></button>

                <div class="fleet-container">
                    <!-- 🚗 Car 1 - Standard Sedan (Economy) -->
                    <div class="fleet-card" data-category="economy">
                        <div class="fleet-icon"><i class="fas fa-car-side"></i></div>
                        <div class="fleet-details">
                            <h3>🚗 Standard Sedan</h3>
                            <p>Comfortable & budget-friendly rides for daily travel.</p>
                            <ul>
                                <li><i class="fas fa-user"></i> Seats: 4</li>
                                <li><i class="fas fa-wifi"></i> Free Wi-Fi</li>
                                <li><i class="fas fa-snowflake"></i> Air Conditioning</li>
                                <li><i class="fas fa-gas-pump"></i> Fuel Efficiency: 18km/L</li>
                            </ul>
                        </div>
                    </div>

                    <!-- 🚙 Car 2 - Luxury SUV -->
                    <div class="fleet-card" data-category="luxury">
                        <div class="fleet-icon"><i class="fas fa-car"></i></div>
                        <div class="fleet-details">
                            <h3>🚙 Luxury SUV</h3>
                            <p>Spacious & stylish for a premium ride experience.</p>
                            <ul>
                                <li><i class="fas fa-user"></i> Seats: 6</li>
                                <li><i class="fas fa-wifi"></i> Free Wi-Fi</li>
                                <li><i class="fas fa-snowflake"></i> Air Conditioning</li>
                                <li><i class="fas fa-music"></i> Premium Sound System</li>
                                <li><i class="fas fa-shield-alt"></i> Extra Safety Features</li>
                            </ul>
                        </div>
                    </div>

                    <!-- 🚐 Car 3 - Family Van -->
                    <div class="fleet-card" data-category="family">
                        <div class="fleet-icon"><i class="fas fa-shuttle-van"></i></div>
                        <div class="fleet-details">
                            <h3>🚐 Family Van</h3>
                            <p>Spacious and reliable for group travel & family trips.</p>
                            <ul>
                                <li><i class="fas fa-user"></i> Seats: 8</li>
                                <li><i class="fas fa-wifi"></i> Free Wi-Fi</li>
                                <li><i class="fas fa-suitcase"></i> Extra Luggage Space</li>
                                <li><i class="fas fa-road"></i> Long-Distance Comfort</li>
                            </ul>
                        </div>
                    </div>
                            <div class="fleet-card" data-category="taxi">
                                <div class="fleet-icon"><i class="fas fa-taxi"></i></div>
                                <div class="fleet-details">
                                    <h3>🚕 Standard City Taxi</h3>
                                    <p>Fast and convenient taxi service within the city.</p>
                                    <ul>
                                        <li><i class="fas fa-user"></i> Seats: 4</li>
                                        <li><i class="fas fa-money-bill-wave"></i> Affordable Pricing</li>
                                        <li><i class="fas fa-wifi"></i> Free Wi-Fi</li>
                                    </ul>
                                </div>
                            </div>
                    
                            <!-- 🚕 Taxi 2 - Hybrid Taxi -->
                            <div class="fleet-card" data-category="taxi">
                                <div class="fleet-icon"><i class="fas fa-car"></i></div>
                                <div class="fleet-details">
                                    <h3>🚕 Hybrid Eco Taxi</h3>
                                    <p>Fuel-efficient & eco-friendly taxi for everyday rides.</p>
                                    <ul>
                                        <li><i class="fas fa-user"></i> Seats: 4</li>
                                        <li><i class="fas fa-leaf"></i> Low Carbon Emissions</li>
                                        <li><i class="fas fa-gas-pump"></i> High Fuel Efficiency</li>
                                    </ul>
                                </div>
                            </div>
                    
                            <!-- 🚕 Taxi 3 - Express Taxi -->
                            <div class="fleet-card" data-category="taxi">
                                <div class="fleet-icon"><i class="fas fa-car-alt"></i></div>
                                <div class="fleet-details">
                                    <h3>🚕 Express Taxi</h3>
                                    <p>Quick taxi service with priority pickup.</p>
                                    <ul>
                                        <li><i class="fas fa-user"></i> Seats: 4</li>
                                        <li><i class="fas fa-clock"></i> Fast Pickup</li>
                                        <li><i class="fas fa-credit-card"></i> Contactless Payment</li>
                                    </ul>
                                </div>
                            </div>
                    
                            <!-- 🚐 Family Van 1 -->
                            <div class="fleet-card" data-category="family">
                                <div class="fleet-icon"><i class="fas fa-shuttle-van"></i></div>
                                <div class="fleet-details">
                                    <h3>🚐 Family Van - Standard</h3>
                                    <p>Comfortable for small families & group rides.</p>
                                    <ul>
                                        <li><i class="fas fa-user"></i> Seats: 6</li>
                                        <li><i class="fas fa-snowflake"></i> Air Conditioning</li>
                                        <li><i class="fas fa-wifi"></i> Free Wi-Fi</li>
                                    </ul>
                                </div>
                            </div>
                    
                            <!-- 🚐 Family Van 2 -->
                            <div class="fleet-card" data-category="family">
                                <div class="fleet-icon"><i class="fas fa-van-shuttle"></i></div>
                                <div class="fleet-details">
                                    <h3>🚐 Deluxe Family Van</h3>
                                    <p>Spacious van with extra legroom & luggage space.</p>
                                    <ul>
                                        <li><i class="fas fa-user"></i> Seats: 7</li>
                                        <li><i class="fas fa-suitcase"></i> Extra Luggage Space</li>
                                        <li><i class="fas fa-music"></i> Entertainment System</li>
                                    </ul>
                                </div>
                            </div>
                    
                            <!-- 🚐 Family Van 3 -->
                            <div class="fleet-card" data-category="family">
                                <div class="fleet-icon"><i class="fas fa-truck-pickup"></i></div>
                                <div class="fleet-details">
                                    <h3>🚐 Executive Family Van</h3>
                                    <p>Luxury van for long-distance family travels.</p>
                                    <ul>
                                        <li><i class="fas fa-user"></i> Seats: 8</li>
                                        <li><i class="fas fa-star"></i> Leather Seating</li>
                                        <li><i class="fas fa-road"></i> Smooth Ride Suspension</li>
                                    </ul>
                                </div>
                            </div>
                    
                            <!-- 🚖 Premium Taxi 1 -->
                            <div class="fleet-card" data-category="premium">
                                <div class="fleet-icon"><i class="fas fa-car"></i></div>
                                <div class="fleet-details">
                                    <h3>🚖 Premium Taxi - Business</h3>
                                    <p>Luxury taxi for corporate travel.</p>
                                    <ul>
                                        <li><i class="fas fa-user"></i> Seats: 4</li>
                                        <li><i class="fas fa-globe"></i> GPS Navigation</li>
                                        <li><i class="fas fa-briefcase"></i> Business Class Seating</li>
                                    </ul>
                                </div>
                            </div>
                    
                            <!-- 🚖 Premium Taxi 2 -->
                            <div class="fleet-card" data-category="premium">
                                <div class="fleet-icon"><i class="fas fa-car-alt"></i></div>
                                <div class="fleet-details">
                                    <h3>🚖 VIP Luxury Taxi</h3>
                                    <p>High-end taxi for a luxurious experience.</p>
                                    <ul>
                                        <li><i class="fas fa-user"></i> Seats: 4</li>
                                        <li><i class="fas fa-wifi"></i> Free Wi-Fi</li>
                                        <li><i class="fas fa-couch"></i> Reclining Seats</li>
                                    </ul>
                                </div>
                            </div>
                    
                            <!-- 🚌 Mini Bus 1 -->
                            <div class="fleet-card" data-category="bus">
                                <div class="fleet-icon"><i class="fas fa-bus"></i></div>
                                <div class="fleet-details">
                                    <h3>🚌 Standard Mini Bus</h3>
                                    <p>Comfortable transport for up to 15 passengers.</p>
                                    <ul>
                                        <li><i class="fas fa-user"></i> Seats: 15</li>
                                        <li><i class="fas fa-snowflake"></i> Air Conditioning</li>
                                    </ul>
                                </div>
                            </div>
                    
                            <!-- 🚌 Mini Bus 2 -->
                            <div class="fleet-card" data-category="bus">
                                <div class="fleet-icon"><i class="fas fa-bus-alt"></i></div>
                                <div class="fleet-details">
                                    <h3>🚌 Luxury Mini Bus</h3>
                                    <p>Spacious, high-comfort mini bus for long trips.</p>
                                    <ul>
                                        <li><i class="fas fa-user"></i> Seats: 18</li>
                                        <li><i class="fas fa-music"></i> Entertainment System</li>
                                        <li><i class="fas fa-coffee"></i> Refreshment Bar</li>
                                    </ul>
                                </div>
                            </div>
                    
                            <!-- 🚌 Mini Bus 3 -->
                            <div class="fleet-card" data-category="bus">
                                <div class="fleet-icon"><i class="fas fa-bus"></i></div>
                                <div class="fleet-details">
                                    <h3>🚌 VIP Executive Mini Bus</h3>
                                    <p>Perfect for business groups and private transport.</p>
                                    <ul>
                                        <li><i class="fas fa-user"></i> Seats: 20</li>
                                        <li><i class="fas fa-star"></i> Leather Reclining Seats</li>
                                        <li><i class="fas fa-laptop"></i> Work Desk & USB Ports</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    
                        <button class="next-btn"><i class="fas fa-chevron-right"></i></button>
                    </div>
                    
                </div>

                <button class="next-btn"><i class="fas fa-chevron-right"></i></button>
            </div>
        </section>
    </main>

    <!-- JavaScript -->
    <script src="fleet.js"></script>
</body>
</html>
