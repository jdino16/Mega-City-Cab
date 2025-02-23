<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page import="com.megacitycab.utils.DatabaseUtil" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book a Ride - Mega City Cab</title>
    <link rel="stylesheet" href="styles/booking.css">
    <script src="js/booking.js" defer></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>

<%
    // Ensure user is logged in
    Object userIdObj = session.getAttribute("userId");
    if (userIdObj == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    int userId = (Integer) userIdObj;

    // Retrieve parameters for persistence
    String customerName = request.getParameter("customerName");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String pickup = request.getParameter("pickup");
    String destination = request.getParameter("destination");
    String distance = request.getParameter("distance");
    String fare = request.getParameter("fare");
%>

<!-- ✅ Booking Form Section -->
<div class="booking-container">
    <h2>🚖 Book Your Ride</h2>

    <form action="CalculateFareServlet" method="post" onsubmit="return validateForm()">
        <label for="customerName">👤 Customer Name</label>
        <input type="text" id="customerName" name="customerName" required placeholder="Enter your name"
               value="<%= customerName != null ? customerName : "" %>">

        <label for="phone">📞 Phone Number</label>
        <input type="text" id="phone" name="phone" required placeholder="Enter your phone number"
               value="<%= phone != null ? phone : "" %>">

        <label for="address">🏠 Address</label>
        <input type="text" id="address" name="address" required placeholder="Enter your address"
               value="<%= address != null ? address : "" %>">

        <label for="pickup">📍 Pickup Location</label>
        <select id="pickup" name="pickup" required>
            <!-- Pickup locations -->
            <option value="Colombo City" <%= "Colombo City".equals(pickup) ? "selected" : "" %>>Colombo City</option>
            <option value="Colombo Town" <%= "Colombo Town".equals(pickup) ? "selected" : "" %>>Colombo Town</option>
            <option value="Wellawatte" <%= "Wellawatte".equals(destination) ? "selected" : "" %>>Wellawatte</option>
            <option value="Galle Face" <%= "Galle Face".equals(destination) ? "selected" : "" %>>Galle Face</option>
            <option value="Kollupitiya" <%= "Kollupitiya".equals(destination) ? "selected" : "" %>>Kollupitiya</option>
            <option value="Wellawatte" <%="Wellawatte" .equals(destination) ? "selected" : "" %>
                >Wellawatte</option>
            <option value="Galle Face" <%="Galle Face" .equals(destination) ? "selected" : "" %>
                >Galle Face</option>
            <option value="Kollupitiya" <%="Kollupitiya" .equals(destination) ? "selected" : ""
                %>
                >Kollupitiya</option>
            <option value="Borella" <%="Borella" .equals(destination) ? "selected" : "" %>
                >Borella
            </option>
            <option value="Dehiwala" <%="Dehiwala" .equals(destination) ? "selected" : "" %>
                >Dehiwala</option>
            <option value="Mount Lavinia" <%="Mount Lavinia" .equals(destination) ? "selected"
                : "" %>>Mount Lavinia</option>
            <option value="Rajagiriya" <%="Rajagiriya" .equals(destination) ? "selected" : "" %>
                >Rajagiriya</option>
            <option value="Battaramulla" <%="Battaramulla" .equals(destination) ? "selected"
                : "" %>
                >Battaramulla</option>
            <option value="Kotte" <%="Kotte" .equals(destination) ? "selected" : "" %>>Kotte
            </option>
            <option value="Kolonnawa" <%="Kolonnawa" .equals(destination) ? "selected" : "" %>
                >Kolonnawa</option>
            <option value="Maharagama" <%="Maharagama" .equals(destination) ? "selected" : "" %>
                >Maharagama</option>
            <option value="Pettah" <%="Pettah" .equals(destination) ? "selected" : "" %>>Pettah
            </option>
            <option value="Nugegoda" <%="Nugegoda" .equals(destination) ? "selected" : "" %>
                >Nugegoda</option>
            <option value="Kaduwela" <%="Kaduwela" .equals(destination) ? "selected" : "" %>
                >Kaduwela</option>
            <option value="Homagama" <%="Homagama" .equals(destination) ? "selected" : "" %>
                >Homagama</option>
            <option value="Boralesgamuwa" <%="Boralesgamuwa" .equals(destination) ? "selected"
                : "" %>>Boralesgamuwa</option>
            <option value="Sri Jayawardenepura Kotte" <%="Sri Jayawardenepura Kotte"
                .equals(destination) ? "selected" : "" %>>Sri Jayawardenepura Kotte</option>
            <option value="Angoda" <%="Angoda" .equals(destination) ? "selected" : "" %>>Angoda
            </option>
            <option value="Pannipitiya" <%="Pannipitiya" .equals(destination) ? "selected" : ""
                %>
                >Pannipitiya</option>
            <option value="Rathmalana" <%="Rathmalana" .equals(destination) ? "selected" : "" %>
                >Rathmalana</option>
            <option value="Kotte Road" <%="Kotte Road" .equals(destination) ? "selected" : "" %>
                >Kotte Road</option>
            <option value="Kaduwela Road" <%="Kaduwela Road" .equals(destination) ? "selected"
                : "" %>>Kaduwela Road</option>
            <option value="Mawatha" <%="Mawatha" .equals(destination) ? "selected" : "" %>
                >Mawatha</option>
            <option value="Bambalapitiya" <%="Bambalapitiya" .equals(destination) ? "selected"
                : "" %>>Bambalapitiya</option>
            <option value="Negombo Road" <%="Negombo Road" .equals(destination) ? "selected"
                : "" %>>Negombo Road</option>
            <option value="Sri Kailawasanathan Swami Devasthanam Kovil"
                <%="Sri Kailawasanathan Swami Devasthanam Kovil" .equals(destination)
                ? "selected" : "" %>>Sri Kailawasanathan Swami Devasthanam Kovil</option>
            <option value="Sri Ponnambalawaneswaram Kovil" <%="Sri Ponnambalawaneswaram Kovil"
                .equals(destination) ? "selected" : "" %>>Sri Ponnambalawaneswaram Kovil
            </option>
            <option value="Sri Rajamahabodhi Viharaya" <%="Sri Rajamahabodhi Viharaya"
                .equals(destination) ? "selected" : "" %>>Sri Rajamahabodhi Viharaya</option>
            <option value="Sri Lanka Maha Viharaya" <%="Sri Lanka Maha Viharaya"
                .equals(destination) ? "selected" : "" %>>Sri Lanka Maha Viharaya</option>
            <option value="Shiva Subramaniya Kovil" <%="Shiva Subramaniya Kovil"
                .equals(destination) ? "selected" : "" %>>Shiva Subramaniya Kovil</option>
            <option value="Sri Sambuddhaloka Viharaya" <%="Sri Sambuddhaloka Viharaya"
                .equals(destination) ? "selected" : "" %>>Sri Sambuddhaloka Viharaya</option>
            <option value="Sri Sumangala Viharaya" <%="Sri Sumangala Viharaya"
                .equals(destination) ? "selected" : "" %>>Sri Sumangala Viharaya</option>
            <option value="Siva Temple" <%="Siva Temple" .equals(destination) ? "selected" : ""
                %>>Siva Temple</option>
            <option value="Vishnu Kovil" <%="Vishnu Kovil" .equals(destination) ? "selected"
                : "" %>>Vishnu Kovil</option>
            <option value="Ramanathan Kovil" <%="Ramanathan Kovil" .equals(destination)
                ? "selected" : "" %>>Ramanathan Kovil</option>
            <option value="Koneswaram Kovil" <%="Koneswaram Kovil" .equals(destination)
                ? "selected" : "" %>>Koneswaram Kovil</option>
            <option value="Muthumariamman Kovil" <%="Muthumariamman Kovil" .equals(destination)
                ? "selected" : "" %>>Muthumariamman Kovil</option>
            <option value="Sri Muthumariamman Kovil" <%="Sri Muthumariamman Kovil"
                .equals(destination) ? "selected" : "" %>>Sri Muthumariamman Kovil</option>
            <option value="Selvavinayagar Kovil" <%="Selvavinayagar Kovil" .equals(destination)
                ? "selected" : "" %>>Selvavinayagar Kovil</option>
            <option value="Sri Balasubramaniyam Kovil" <%="Sri Balasubramaniyam Kovil"
                .equals(destination) ? "selected" : "" %>>Sri Balasubramaniyam Kovil</option>
            <option value="Thiruvalluvar Kovil" <%="Thiruvalluvar Kovil" .equals(destination)
                ? "selected" : "" %>>Thiruvalluvar Kovil</option>
            <option value="Sri Venkateshwara Kovil" <%="Sri Venkateshwara Kovil"
                .equals(destination) ? "selected" : "" %>>Sri Venkateshwara Kovil</option>
            <option value="Nallur Kandaswamy Kovil" <%="Nallur Kandaswamy Kovil"
                .equals(destination) ? "selected" : "" %>>Nallur Kandaswamy Kovil</option>
            <option value="Shree Kalyana Venkateswara Kovil"
                <%="Shree Kalyana Venkateswara Kovil" .equals(destination) ? "selected" : "" %>
                >Shree Kalyana Venkateswara Kovil</option>
            <option value="Maha Sivan Kovil" <%="Maha Sivan Kovil" .equals(destination)
                ? "selected" : "" %>>Maha Sivan Kovil</option>
            <option value="National Hospital of Sri Lanka" <%="National Hospital of Sri Lanka"
                .equals(destination) ? "selected" : "" %>>National Hospital of Sri Lanka
            </option>
            <option value="Asiri Hospital" <%="Asiri Hospital" .equals(destination) ? "selected"
                : "" %>>Asiri Hospital</option>
            <option value="Nawaloka Hospital" <%="Nawaloka Hospital" .equals(destination)
                ? "selected" : "" %>>Nawaloka Hospital</option>
            <option value="Kotelawala Defence University Hospital"
                <%="Kotelawala Defence University Hospital" .equals(destination) ? "selected"
                : "" %>>Kotelawala Defence University Hospital</option>
            <option value="Lanka Hospitals" <%="Lanka Hospitals" .equals(destination)
                ? "selected" : "" %>>Lanka Hospitals</option>
            <option value="De Zoysa Maternity Hospital" <%="De Zoysa Maternity Hospital"
                .equals(destination) ? "selected" : "" %>>De Zoysa Maternity Hospital</option>
            <option value="Sri Jayewardenepura General Hospital"
                <%="Sri Jayewardenepura General Hospital" .equals(destination) ? "selected" : ""
                %>>Sri Jayewardenepura General Hospital</option>
            <option value="Maharagama Cancer Hospital" <%="Maharagama Cancer Hospital"
                .equals(destination) ? "selected" : "" %>>Maharagama Cancer Hospital</option>
            <option value="Colombo South Teaching Hospital" <%="Colombo South Teaching Hospital"
                .equals(destination) ? "selected" : "" %>>Colombo South Teaching Hospital
            </option>
            <option value="Sri Lanka Military Hospital" <%="Sri Lanka Military Hospital"
                .equals(destination) ? "selected" : "" %>>Sri Lanka Military Hospital</option>
            <option value="Apeksha Hospital" <%="Apeksha Hospital" .equals(destination)
                ? "selected" : "" %>>Apeksha Hospital</option>
            <option value="Borella General Hospital" <%="Borella General Hospital"
                .equals(destination) ? "selected" : "" %>>Borella General Hospital</option>
            <option value="Kandy General Hospital" <%="Kandy General Hospital"
                .equals(destination) ? "selected" : "" %>>Kandy General Hospital</option>
            <option value="Colombo Eye Hospital" <%="Colombo Eye Hospital" .equals(destination)
                ? "selected" : "" %>>Colombo Eye Hospital</option>
            <option value="Ragama Teaching Hospital" <%="Ragama Teaching Hospital"
                .equals(destination) ? "selected" : "" %>>Ragama Teaching Hospital</option>
            <option value="Lady Ridgeway Hospital" <%="Lady Ridgeway Hospital"
                .equals(destination) ? "selected" : "" %>>Lady Ridgeway Hospital</option>
            <option value="Kotalawela Defence University Hospital"
                <%="Kotalawela Defence University Hospital" .equals(destination) ? "selected"
                : "" %>>Kotalawela Defence University Hospital</option>
            <option value="Independence Square Hospital" <%="Independence Square Hospital"
                .equals(destination) ? "selected" : "" %>>Independence Square Hospital</option>
            <option value="Wellawatte Medical Centre" <%="Wellawatte Medical Centre"
                .equals(destination) ? "selected" : "" %>>Wellawatte Medical Centre</option>
            <option value="Wattala General Hospital" <%="Wattala General Hospital"
                .equals(destination) ? "selected" : "" %>>Wattala General Hospital</option>
            <option value="Rajagiriya Medical Centre" <%="Rajagiriya Medical Centre"
                .equals(destination) ? "selected" : "" %>>Rajagiriya Medical Centre</option>
            <option value="Colombo Fort Railway Station" <%="Colombo Fort Railway Station"
                .equals(destination) ? "selected" : "" %>>Colombo Fort Railway Station</option>
            <option value="Colombo Maradana Railway Station"
                <%="Colombo Maradana Railway Station" .equals(destination) ? "selected" : "" %>
                >Colombo Maradana Railway Station</option>
            <option value="Colombo Wellawatta Railway Station"
                <%="Colombo Wellawatta Railway Station" .equals(destination) ? "selected" : ""
                %>>Colombo Wellawatta Railway Station</option>
            <option value="Colombo Fort Harbour Railway Station"
                <%="Colombo Fort Harbour Railway Station" .equals(destination) ? "selected" : ""
                %>>Colombo Fort Harbour Railway Station</option>
            <option value="Colombo Bambalapitiya Railway Station"
                <%="Colombo Bambalapitiya Railway Station" .equals(destination) ? "selected"
                : "" %>>Colombo Bambalapitiya Railway Station</option>
            <option value="Colombo Kanatta Railway Station" <%="Colombo Kanatta Railway Station"
                .equals(destination) ? "selected" : "" %>>Colombo Kanatta Railway Station
            </option>
            <option value="Colombo Kelaniya Railway Station"
                <%="Colombo Kelaniya Railway Station" .equals(destination) ? "selected" : "" %>
                >Colombo Kelaniya Railway Station</option>
            <option value="Colombo Colombo Fort Railway Station"
                <%="Colombo Colombo Fort Railway Station" .equals(destination) ? "selected" : ""
                %>>Colombo Colombo Fort Railway Station</option>
            <option value="Colombo Ragama Railway Station" <%="Colombo Ragama Railway Station"
                .equals(destination) ? "selected" : "" %>>Colombo Ragama Railway Station
            </option>
            <option value="Colombo Colombo Railway Junction"
                <%="Colombo Colombo Railway Junction" .equals(destination) ? "selected" : "" %>
                >Colombo Colombo Railway Junction</option>
            <option value="Colombo Malabe Railway Station" <%="Colombo Malabe Railway Station"
                .equals(destination) ? "selected" : "" %>>Colombo Malabe Railway Station
            </option>
            <option value="Colombo Nugegoda Railway Station"
                <%="Colombo Nugegoda Railway Station" .equals(destination) ? "selected" : "" %>
                >Colombo Nugegoda Railway Station</option>
            <option value="Colombo Maharagama Railway Station"
                <%="Colombo Maharagama Railway Station" .equals(destination) ? "selected" : ""
                %>>Colombo Maharagama Railway Station</option>
            <option value="Colombo Colombo North Railway Station"
                <%="Colombo Colombo North Railway Station" .equals(destination) ? "selected"
                : "" %>>Colombo Colombo North Railway Station</option>
            <option value="Colombo Colombo South Railway Station"
                <%="Colombo Colombo South Railway Station" .equals(destination) ? "selected"
                : "" %>>Colombo Colombo South Railway Station</option>
            <option value="Colombo Colombo East Railway Station"
                <%="Colombo Colombo East Railway Station" .equals(destination) ? "selected" : ""
                %>>Colombo Colombo East Railway Station</option>
            <option value="Colombo Colombo Central Railway Station"
                <%="Colombo Colombo Central Railway Station" .equals(destination) ? "selected"
                : "" %>>Colombo Colombo Central Railway Station</option>
            <option value="Colombo Colombo West Railway Station"
                <%="Colombo Colombo West Railway Station" .equals(destination) ? "selected" : ""
                %>>Colombo Colombo West Railway Station</option>
            <option value="Colombo Fort Southern Railway Station"
                <%="Colombo Fort Southern Railway Station" .equals(destination) ? "selected"
                : "" %>>Colombo Fort Southern Railway Station</option>
            <option value="Colombo Ratmalana Railway Station"
                <%="Colombo Ratmalana Railway Station" .equals(destination) ? "selected" : "" %>
                >Colombo Ratmalana Railway Station</option>
            <option value="Colombo Colombo Suburban Railway Station"
                <%="Colombo Colombo Suburban Railway Station" .equals(destination) ? "selected"
                : "" %>>Colombo Colombo Suburban Railway Station</option>
            <option value="">-- Select Pickup Location --</option>
            <option value="Bandaranaike International Airport"
                <%="Bandaranaike International Airport" .equals(pickup) ? "selected" : "" %>
                >Bandaranaike International Airport</option>
            <option value="Ratmalana Airport" <%="Ratmalana Airport" .equals(pickup)
                ? "selected" : "" %>>Ratmalana Airport</option>
            <option value="Colombo International Airport" <%="Colombo International Airport"
                .equals(pickup) ? "selected" : "" %>>Colombo International Airport</option>
            <option value="Mattala Rajapaksa International Airport"
                <%="Mattala Rajapaksa International Airport" .equals(pickup) ? "selected" : ""
                %>>Mattala Rajapaksa International Airport</option>
            <option value="Colombo Domestic Airport" <%="Colombo Domestic Airport"
                .equals(pickup) ? "selected" : "" %>>Colombo Domestic Airport</option>
            <option value="Colombo Suburban Airport" <%="Colombo Suburban Airport"
                .equals(pickup) ? "selected" : "" %>>Colombo Suburban Airport</option>
            <option value="BIA Colombo International" <%="BIA Colombo International"
                .equals(pickup) ? "selected" : "" %>>BIA Colombo International</option>
            <option value="Colombo International Aviation Center"
                <%="Colombo International Aviation Center" .equals(pickup) ? "selected" : "" %>
                >Colombo International Aviation Center</option>
            <option value="CMB Airport" <%="CMB Airport" .equals(pickup) ? "selected" : "" %>
                >CMB Airport</option>
            <option value="Bandaranaike International Airport Terminal"
                <%="Bandaranaike International Airport Terminal" .equals(pickup) ? "selected"
                : "" %>>Bandaranaike International Airport Terminal</option>
            <option value="Negombo Airport" <%="Negombo Airport" .equals(pickup) ? "selected"
                : "" %>>Negombo Airport</option>
            <option value="Colombo Logistics Airport" <%="Colombo Logistics Airport"
                .equals(pickup) ? "selected" : "" %>>Colombo Logistics Airport</option>
            <option value="International Colombo Airport" <%="International Colombo Airport"
                .equals(pickup) ? "selected" : "" %>>International Colombo Airport</option>
            <option value="Colombo Cargo Terminal" <%="Colombo Cargo Terminal" .equals(pickup)
                ? "selected" : "" %>>Colombo Cargo Terminal</option>
            <option value="Airport Zone Colombo" <%="Airport Zone Colombo" .equals(pickup)
                ? "selected" : "" %>>Airport Zone Colombo</option>
            <option value="Colombo Air Cargo Centre" <%="Colombo Air Cargo Centre"
                .equals(pickup) ? "selected" : "" %>>Colombo Air Cargo Centre</option>
            <option value="SRI Lanka Colombo Airport" <%="SRI Lanka Colombo Airport"
                .equals(pickup) ? "selected" : "" %>>SRI Lanka Colombo Airport</option>
            <option value="Colombo Airport Complex" <%="Colombo Airport Complex" .equals(pickup)
                ? "selected" : "" %>>Colombo Airport Complex</option>
            <option value="Colombo Seaport and Airport" <%="Colombo Seaport and Airport"
                .equals(pickup) ? "selected" : "" %>>Colombo Seaport and Airport</option>
            <option value="Colombo Airport Hub" <%="Colombo Airport Hub" .equals(pickup)
                ? "selected" : "" %>>Colombo Airport Hub</option>
        </select>

        <label for="destination">📍 Destination</label>
        <select id="destination" name="destination" required>
            <!-- Destination locations -->
            <option value="Galle Face" <%= "Galle Face".equals(destination) ? "selected" : "" %>>Galle Face</option>
            <option value="Wellawatte" <%= "Wellawatte".equals(destination) ? "selected" : "" %>>Wellawatte</option>
            <option value="Wellawatte" <%= "Wellawatte".equals(destination) ? "selected" : "" %>>Wellawatte</option>
            <option value="Galle Face" <%= "Galle Face".equals(destination) ? "selected" : "" %>>Galle Face</option>
            <option value="Kollupitiya" <%= "Kollupitiya".equals(destination) ? "selected" : "" %>>Kollupitiya</option>
            <option value="Wellawatte" <%="Wellawatte" .equals(destination) ? "selected" : "" %>
                >Wellawatte</option>
            <option value="Galle Face" <%="Galle Face" .equals(destination) ? "selected" : "" %>
                >Galle Face</option>
            <option value="Kollupitiya" <%="Kollupitiya" .equals(destination) ? "selected" : ""
                %>
                >Kollupitiya</option>
            <option value="Borella" <%="Borella" .equals(destination) ? "selected" : "" %>
                >Borella
            </option>
            <option value="Dehiwala" <%="Dehiwala" .equals(destination) ? "selected" : "" %>
                >Dehiwala</option>
            <option value="Mount Lavinia" <%="Mount Lavinia" .equals(destination) ? "selected"
                : "" %>>Mount Lavinia</option>
            <option value="Rajagiriya" <%="Rajagiriya" .equals(destination) ? "selected" : "" %>
                >Rajagiriya</option>
            <option value="Battaramulla" <%="Battaramulla" .equals(destination) ? "selected"
                : "" %>
                >Battaramulla</option>
            <option value="Kotte" <%="Kotte" .equals(destination) ? "selected" : "" %>>Kotte
            </option>
            <option value="Kolonnawa" <%="Kolonnawa" .equals(destination) ? "selected" : "" %>
                >Kolonnawa</option>
            <option value="Maharagama" <%="Maharagama" .equals(destination) ? "selected" : "" %>
                >Maharagama</option>
            <option value="Pettah" <%="Pettah" .equals(destination) ? "selected" : "" %>>Pettah
            </option>
            <option value="Nugegoda" <%="Nugegoda" .equals(destination) ? "selected" : "" %>
                >Nugegoda</option>
            <option value="Kaduwela" <%="Kaduwela" .equals(destination) ? "selected" : "" %>
                >Kaduwela</option>
            <option value="Homagama" <%="Homagama" .equals(destination) ? "selected" : "" %>
                >Homagama</option>
            <option value="Boralesgamuwa" <%="Boralesgamuwa" .equals(destination) ? "selected"
                : "" %>>Boralesgamuwa</option>
            <option value="Sri Jayawardenepura Kotte" <%="Sri Jayawardenepura Kotte"
                .equals(destination) ? "selected" : "" %>>Sri Jayawardenepura Kotte</option>
            <option value="Angoda" <%="Angoda" .equals(destination) ? "selected" : "" %>>Angoda
            </option>
            <option value="Pannipitiya" <%="Pannipitiya" .equals(destination) ? "selected" : ""
                %>
                >Pannipitiya</option>
            <option value="Rathmalana" <%="Rathmalana" .equals(destination) ? "selected" : "" %>
                >Rathmalana</option>
            <option value="Kotte Road" <%="Kotte Road" .equals(destination) ? "selected" : "" %>
                >Kotte Road</option>
            <option value="Kaduwela Road" <%="Kaduwela Road" .equals(destination) ? "selected"
                : "" %>>Kaduwela Road</option>
            <option value="Mawatha" <%="Mawatha" .equals(destination) ? "selected" : "" %>
                >Mawatha</option>
            <option value="Bambalapitiya" <%="Bambalapitiya" .equals(destination) ? "selected"
                : "" %>>Bambalapitiya</option>
            <option value="Negombo Road" <%="Negombo Road" .equals(destination) ? "selected"
                : "" %>>Negombo Road</option>
            <option value="Sri Kailawasanathan Swami Devasthanam Kovil"
                <%="Sri Kailawasanathan Swami Devasthanam Kovil" .equals(destination)
                ? "selected" : "" %>>Sri Kailawasanathan Swami Devasthanam Kovil</option>
            <option value="Sri Ponnambalawaneswaram Kovil" <%="Sri Ponnambalawaneswaram Kovil"
                .equals(destination) ? "selected" : "" %>>Sri Ponnambalawaneswaram Kovil
            </option>
            <option value="Sri Rajamahabodhi Viharaya" <%="Sri Rajamahabodhi Viharaya"
                .equals(destination) ? "selected" : "" %>>Sri Rajamahabodhi Viharaya</option>
            <option value="Sri Lanka Maha Viharaya" <%="Sri Lanka Maha Viharaya"
                .equals(destination) ? "selected" : "" %>>Sri Lanka Maha Viharaya</option>
            <option value="Shiva Subramaniya Kovil" <%="Shiva Subramaniya Kovil"
                .equals(destination) ? "selected" : "" %>>Shiva Subramaniya Kovil</option>
            <option value="Sri Sambuddhaloka Viharaya" <%="Sri Sambuddhaloka Viharaya"
                .equals(destination) ? "selected" : "" %>>Sri Sambuddhaloka Viharaya</option>
            <option value="Sri Sumangala Viharaya" <%="Sri Sumangala Viharaya"
                .equals(destination) ? "selected" : "" %>>Sri Sumangala Viharaya</option>
            <option value="Siva Temple" <%="Siva Temple" .equals(destination) ? "selected" : ""
                %>>Siva Temple</option>
            <option value="Vishnu Kovil" <%="Vishnu Kovil" .equals(destination) ? "selected"
                : "" %>>Vishnu Kovil</option>
            <option value="Ramanathan Kovil" <%="Ramanathan Kovil" .equals(destination)
                ? "selected" : "" %>>Ramanathan Kovil</option>
            <option value="Koneswaram Kovil" <%="Koneswaram Kovil" .equals(destination)
                ? "selected" : "" %>>Koneswaram Kovil</option>
            <option value="Muthumariamman Kovil" <%="Muthumariamman Kovil" .equals(destination)
                ? "selected" : "" %>>Muthumariamman Kovil</option>
            <option value="Sri Muthumariamman Kovil" <%="Sri Muthumariamman Kovil"
                .equals(destination) ? "selected" : "" %>>Sri Muthumariamman Kovil</option>
            <option value="Selvavinayagar Kovil" <%="Selvavinayagar Kovil" .equals(destination)
                ? "selected" : "" %>>Selvavinayagar Kovil</option>
            <option value="Sri Balasubramaniyam Kovil" <%="Sri Balasubramaniyam Kovil"
                .equals(destination) ? "selected" : "" %>>Sri Balasubramaniyam Kovil</option>
            <option value="Thiruvalluvar Kovil" <%="Thiruvalluvar Kovil" .equals(destination)
                ? "selected" : "" %>>Thiruvalluvar Kovil</option>
            <option value="Sri Venkateshwara Kovil" <%="Sri Venkateshwara Kovil"
                .equals(destination) ? "selected" : "" %>>Sri Venkateshwara Kovil</option>
            <option value="Nallur Kandaswamy Kovil" <%="Nallur Kandaswamy Kovil"
                .equals(destination) ? "selected" : "" %>>Nallur Kandaswamy Kovil</option>
            <option value="Shree Kalyana Venkateswara Kovil"
                <%="Shree Kalyana Venkateswara Kovil" .equals(destination) ? "selected" : "" %>
                >Shree Kalyana Venkateswara Kovil</option>
            <option value="Maha Sivan Kovil" <%="Maha Sivan Kovil" .equals(destination)
                ? "selected" : "" %>>Maha Sivan Kovil</option>
            <option value="National Hospital of Sri Lanka" <%="National Hospital of Sri Lanka"
                .equals(destination) ? "selected" : "" %>>National Hospital of Sri Lanka
            </option>
            <option value="Asiri Hospital" <%="Asiri Hospital" .equals(destination) ? "selected"
                : "" %>>Asiri Hospital</option>
            <option value="Nawaloka Hospital" <%="Nawaloka Hospital" .equals(destination)
                ? "selected" : "" %>>Nawaloka Hospital</option>
            <option value="Kotelawala Defence University Hospital"
                <%="Kotelawala Defence University Hospital" .equals(destination) ? "selected"
                : "" %>>Kotelawala Defence University Hospital</option>
            <option value="Lanka Hospitals" <%="Lanka Hospitals" .equals(destination)
                ? "selected" : "" %>>Lanka Hospitals</option>
            <option value="De Zoysa Maternity Hospital" <%="De Zoysa Maternity Hospital"
                .equals(destination) ? "selected" : "" %>>De Zoysa Maternity Hospital</option>
            <option value="Sri Jayewardenepura General Hospital"
                <%="Sri Jayewardenepura General Hospital" .equals(destination) ? "selected" : ""
                %>>Sri Jayewardenepura General Hospital</option>
            <option value="Maharagama Cancer Hospital" <%="Maharagama Cancer Hospital"
                .equals(destination) ? "selected" : "" %>>Maharagama Cancer Hospital</option>
            <option value="Colombo South Teaching Hospital" <%="Colombo South Teaching Hospital"
                .equals(destination) ? "selected" : "" %>>Colombo South Teaching Hospital
            </option>
            <option value="Sri Lanka Military Hospital" <%="Sri Lanka Military Hospital"
                .equals(destination) ? "selected" : "" %>>Sri Lanka Military Hospital</option>
            <option value="Apeksha Hospital" <%="Apeksha Hospital" .equals(destination)
                ? "selected" : "" %>>Apeksha Hospital</option>
            <option value="Borella General Hospital" <%="Borella General Hospital"
                .equals(destination) ? "selected" : "" %>>Borella General Hospital</option>
            <option value="Kandy General Hospital" <%="Kandy General Hospital"
                .equals(destination) ? "selected" : "" %>>Kandy General Hospital</option>
            <option value="Colombo Eye Hospital" <%="Colombo Eye Hospital" .equals(destination)
                ? "selected" : "" %>>Colombo Eye Hospital</option>
            <option value="Ragama Teaching Hospital" <%="Ragama Teaching Hospital"
                .equals(destination) ? "selected" : "" %>>Ragama Teaching Hospital</option>
            <option value="Lady Ridgeway Hospital" <%="Lady Ridgeway Hospital"
                .equals(destination) ? "selected" : "" %>>Lady Ridgeway Hospital</option>
            <option value="Kotalawela Defence University Hospital"
                <%="Kotalawela Defence University Hospital" .equals(destination) ? "selected"
                : "" %>>Kotalawela Defence University Hospital</option>
            <option value="Independence Square Hospital" <%="Independence Square Hospital"
                .equals(destination) ? "selected" : "" %>>Independence Square Hospital</option>
            <option value="Wellawatte Medical Centre" <%="Wellawatte Medical Centre"
                .equals(destination) ? "selected" : "" %>>Wellawatte Medical Centre</option>
            <option value="Wattala General Hospital" <%="Wattala General Hospital"
                .equals(destination) ? "selected" : "" %>>Wattala General Hospital</option>
            <option value="Rajagiriya Medical Centre" <%="Rajagiriya Medical Centre"
                .equals(destination) ? "selected" : "" %>>Rajagiriya Medical Centre</option>
            <option value="Colombo Fort Railway Station" <%="Colombo Fort Railway Station"
                .equals(destination) ? "selected" : "" %>>Colombo Fort Railway Station</option>
            <option value="Colombo Maradana Railway Station"
                <%="Colombo Maradana Railway Station" .equals(destination) ? "selected" : "" %>
                >Colombo Maradana Railway Station</option>
            <option value="Colombo Wellawatta Railway Station"
                <%="Colombo Wellawatta Railway Station" .equals(destination) ? "selected" : ""
                %>>Colombo Wellawatta Railway Station</option>
            <option value="Colombo Fort Harbour Railway Station"
                <%="Colombo Fort Harbour Railway Station" .equals(destination) ? "selected" : ""
                %>>Colombo Fort Harbour Railway Station</option>
            <option value="Colombo Bambalapitiya Railway Station"
                <%="Colombo Bambalapitiya Railway Station" .equals(destination) ? "selected"
                : "" %>>Colombo Bambalapitiya Railway Station</option>
            <option value="Colombo Kanatta Railway Station" <%="Colombo Kanatta Railway Station"
                .equals(destination) ? "selected" : "" %>>Colombo Kanatta Railway Station
            </option>
            <option value="Colombo Kelaniya Railway Station"
                <%="Colombo Kelaniya Railway Station" .equals(destination) ? "selected" : "" %>
                >Colombo Kelaniya Railway Station</option>
            <option value="Colombo Colombo Fort Railway Station"
                <%="Colombo Colombo Fort Railway Station" .equals(destination) ? "selected" : ""
                %>>Colombo Colombo Fort Railway Station</option>
            <option value="Colombo Ragama Railway Station" <%="Colombo Ragama Railway Station"
                .equals(destination) ? "selected" : "" %>>Colombo Ragama Railway Station
            </option>
            <option value="Colombo Colombo Railway Junction"
                <%="Colombo Colombo Railway Junction" .equals(destination) ? "selected" : "" %>
                >Colombo Colombo Railway Junction</option>
            <option value="Colombo Malabe Railway Station" <%="Colombo Malabe Railway Station"
                .equals(destination) ? "selected" : "" %>>Colombo Malabe Railway Station
            </option>
            <option value="Colombo Nugegoda Railway Station"
                <%="Colombo Nugegoda Railway Station" .equals(destination) ? "selected" : "" %>
                >Colombo Nugegoda Railway Station</option>
            <option value="Colombo Maharagama Railway Station"
                <%="Colombo Maharagama Railway Station" .equals(destination) ? "selected" : ""
                %>>Colombo Maharagama Railway Station</option>
            <option value="Colombo Colombo North Railway Station"
                <%="Colombo Colombo North Railway Station" .equals(destination) ? "selected"
                : "" %>>Colombo Colombo North Railway Station</option>
            <option value="Colombo Colombo South Railway Station"
                <%="Colombo Colombo South Railway Station" .equals(destination) ? "selected"
                : "" %>>Colombo Colombo South Railway Station</option>
            <option value="Colombo Colombo East Railway Station"
                <%="Colombo Colombo East Railway Station" .equals(destination) ? "selected" : ""
                %>>Colombo Colombo East Railway Station</option>
            <option value="Colombo Colombo Central Railway Station"
                <%="Colombo Colombo Central Railway Station" .equals(destination) ? "selected"
                : "" %>>Colombo Colombo Central Railway Station</option>
            <option value="Colombo Colombo West Railway Station"
                <%="Colombo Colombo West Railway Station" .equals(destination) ? "selected" : ""
                %>>Colombo Colombo West Railway Station</option>
            <option value="Colombo Fort Southern Railway Station"
                <%="Colombo Fort Southern Railway Station" .equals(destination) ? "selected"
                : "" %>>Colombo Fort Southern Railway Station</option>
            <option value="Colombo Ratmalana Railway Station"
                <%="Colombo Ratmalana Railway Station" .equals(destination) ? "selected" : "" %>
                >Colombo Ratmalana Railway Station</option>
            <option value="Colombo Colombo Suburban Railway Station"
                <%="Colombo Colombo Suburban Railway Station" .equals(destination) ? "selected"
                : "" %>>Colombo Colombo Suburban Railway Station</option>
            <option value="">-- Select Pickup Location --</option>
            <option value="Bandaranaike International Airport"
                <%="Bandaranaike International Airport" .equals(pickup) ? "selected" : "" %>
                >Bandaranaike International Airport</option>
            <option value="Ratmalana Airport" <%="Ratmalana Airport" .equals(pickup)
                ? "selected" : "" %>>Ratmalana Airport</option>
            <option value="Colombo International Airport" <%="Colombo International Airport"
                .equals(pickup) ? "selected" : "" %>>Colombo International Airport</option>
            <option value="Mattala Rajapaksa International Airport"
                <%="Mattala Rajapaksa International Airport" .equals(pickup) ? "selected" : ""
                %>>Mattala Rajapaksa International Airport</option>
            <option value="Colombo Domestic Airport" <%="Colombo Domestic Airport"
                .equals(pickup) ? "selected" : "" %>>Colombo Domestic Airport</option>
            <option value="Colombo Suburban Airport" <%="Colombo Suburban Airport"
                .equals(pickup) ? "selected" : "" %>>Colombo Suburban Airport</option>
            <option value="BIA Colombo International" <%="BIA Colombo International"
                .equals(pickup) ? "selected" : "" %>>BIA Colombo International</option>
            <option value="Colombo International Aviation Center"
                <%="Colombo International Aviation Center" .equals(pickup) ? "selected" : "" %>
                >Colombo International Aviation Center</option>
            <option value="CMB Airport" <%="CMB Airport" .equals(pickup) ? "selected" : "" %>
                >CMB Airport</option>
            <option value="Bandaranaike International Airport Terminal"
                <%="Bandaranaike International Airport Terminal" .equals(pickup) ? "selected"
                : "" %>>Bandaranaike International Airport Terminal</option>
            <option value="Negombo Airport" <%="Negombo Airport" .equals(pickup) ? "selected"
                : "" %>>Negombo Airport</option>
            <option value="Colombo Logistics Airport" <%="Colombo Logistics Airport"
                .equals(pickup) ? "selected" : "" %>>Colombo Logistics Airport</option>
            <option value="International Colombo Airport" <%="International Colombo Airport"
                .equals(pickup) ? "selected" : "" %>>International Colombo Airport</option>
            <option value="Colombo Cargo Terminal" <%="Colombo Cargo Terminal" .equals(pickup)
                ? "selected" : "" %>>Colombo Cargo Terminal</option>
            <option value="Airport Zone Colombo" <%="Airport Zone Colombo" .equals(pickup)
                ? "selected" : "" %>>Airport Zone Colombo</option>
            <option value="Colombo Air Cargo Centre" <%="Colombo Air Cargo Centre"
                .equals(pickup) ? "selected" : "" %>>Colombo Air Cargo Centre</option>
            <option value="SRI Lanka Colombo Airport" <%="SRI Lanka Colombo Airport"
                .equals(pickup) ? "selected" : "" %>>SRI Lanka Colombo Airport</option>
            <option value="Colombo Airport Complex" <%="Colombo Airport Complex" .equals(pickup)
                ? "selected" : "" %>>Colombo Airport Complex</option>
            <option value="Colombo Seaport and Airport" <%="Colombo Seaport and Airport"
                .equals(pickup) ? "selected" : "" %>>Colombo Seaport and Airport</option>
            <option value="Colombo Airport Hub" <%="Colombo Airport Hub" .equals(pickup)
                ? "selected" : "" %>>Colombo Airport Hub</option>
        </select>

        <label for="distance">📏 Estimated Distance (KM)</label>
        <input type="number" id="distance" name="distance" required min="1" step="0.1" placeholder="Enter Distance in KM"
               value="<%= distance != null ? distance : "" %>">

        <label for="date">📅 Booking Date</label>
        <input type="datetime-local" id="date" name="date" required value="<%= new java.util.Date() %>">

        <input type="hidden" name="userId" value="<%= userId %>">
        
        <button type="submit">💰 Calculate Fare</button>
    </form>

    <% if (fare != null) { %>
        <p class="fare-display">🚕 Estimated Fare: Rs <%= fare %></p>

        <!-- Confirm Booking Button -->
        <form action="BookingServlet" method="post">
            <input type="hidden" name="userId" value="<%= userId %>">
            <input type="hidden" name="customerName" value="<%= customerName %>">
            <input type="hidden" name="phone" value="<%= phone %>">
            <input type="hidden" name="address" value="<%= address %>">
            <input type="hidden" name="pickup" value="<%= pickup %>">
            <input type="hidden" name="destination" value="<%= destination %>">
            <input type="hidden" name="distance" value="<%= distance %>">
            <input type="hidden" name="fare" value="<%= fare %>">
            <button type="submit">✅ Confirm Booking</button>
        </form>
    <% } %>
</div>

<!-- ✅ Booking History Section -->
<div class="booking-history">
    <h2>📜 Your Past Bookings</h2>
    <table>
        <thead>
            <tr>
                <th>Booking ID</th>
                <th>Customer Name</th>
                <th>Phone</th>
                <th>Address</th>
                <th>Pickup</th>
                <th>Destination</th>
                <th>Date</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <% 
                Connection conn = DatabaseUtil.getConnection();
                String sql = "SELECT booking_id, customer_name, phone, address, pickup, destination, date, status FROM bookings WHERE user_id=?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, userId);
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) { %>
                    <tr>
                        <td><%= rs.getInt("booking_id") %></td>
                        <td><%= rs.getString("customer_name") %></td>
                        <td><%= rs.getString("phone") %></td>
                        <td><%= rs.getString("address") %></td>
                        <td><%= rs.getString("pickup") %></td>
                        <td><%= rs.getString("destination") %></td>
                        <td><%= rs.getString("date") %></td>
                        <td><%= rs.getString("status") %></td>
                    </tr>
            <% } conn.close(); %>
        </tbody>
    </table>
</div>

<div class="quick-actions">
    <a href="booking.jsp" class="action-btn"><i class="fas fa-calendar-check"></i> View Bookings</a>
    <a href="billing.jsp" class="action-btn"><i class="fas fa-credit-card"></i> Billing & Transactions</a>
    <a href="profile1.jsp" class="action-btn"><i class="fas fa-user-edit"></i> Edit Profile</a>
    <a href="support.jsp" class="action-btn"><i class="fas fa-question-circle"></i> Get Support</a>
</div>


<nav class="navbar">
    <div class="navbar">
        <a href="index.jsp" class="nav-link"><i class="fas fa-home"></i> Home</a>
        <a href="our-cabs.jsp" class="nav-link"><i class="fas fa-taxi"></i> Our Cabs</a>
        <a href="company.jsp" class="nav-link"><i class="fas fa-building"></i> Company</a>
        <a href="booking.jsp" class="nav-link"><i class="fas fa-taxi"></i> Booking</a>
        <a href="profile1.jsp" class="nav-link"><i class="fas fa-user-edit"></i> Manage Profile</a>
        <a href="logout.jsp" class="nav-link"><i class="fas fa-sign-out-alt"></i> Logout</a>    
    </div>
</nav>

<script>
    function validateForm() {
        const pickup = document.getElementById("pickup").value;
        const destination = document.getElementById("destination").value;
        const distance = document.getElementById("distance").value;

        if (pickup === destination) {
            alert("🚫 Pickup and destination cannot be the same.");
            return false;
        }

        if (distance <= 0) {
            alert("🚫 Distance must be greater than 0.");
            return false;
        }

        return true;
    }
</script>

</body>
</html>
