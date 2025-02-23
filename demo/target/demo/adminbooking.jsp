<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Bookings - Admin Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">


    <div class="flex">
        <div class="w-1/4 bg-gray-800 text-white min-h-screen p-5">
            <h1 class="text-3xl font-bold mb-8">Admin Dashboard</h1>
            <ul>
                <li><a href="admin/users" class="block text-xl py-2 px-4 hover:bg-gray-700">Manage Users</a></li>
                <li><a href="admin/cars" class="block text-xl py-2 px-4 hover:bg-gray-700">Manage Cars</a></li>
                <li><a href="admin/bookings" class="block text-xl py-2 px-4 hover:bg-gray-700">Manage Bookings</a></li>
                <li><a href="logout" class="block text-xl py-2 px-4 hover:bg-gray-700">Logout</a></li>
            </ul>
        </div>

        <div class="w-3/4 p-8">
            <h2 class="text-3xl font-bold mb-4">Manage Bookings</h2>
            
            <table class="min-w-full bg-white border border-gray-200">
                <thead>
                    <tr>
                        <th class="border px-4 py-2">Booking ID</th>
                        <th class="border px-4 py-2">Customer Name</th>
                        <th class="border px-4 py-2">Car Assigned</th>
                        <th class="border px-4 py-2">Status</th>
                        <th class="border px-4 py-2">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="booking" items="${bookings}">
                        <tr>
                            <td class="border px-4 py-2">${booking.bookingId}</td>
                            <td class="border px-4 py-2">${booking.customerName}</td>
                            <td class="border px-4 py-2">${booking.carAssigned}</td>
                            <td class="border px-4 py-2">${booking.status}</td>
                            <td class="border px-4 py-2">
                                <a href="admin/updateBookingStatus?id=${booking.bookingId}" class="text-blue-500 hover:underline">Update</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

        </div>
    </div>

</body>
</html>
