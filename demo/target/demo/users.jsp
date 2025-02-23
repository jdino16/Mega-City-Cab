<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users - Admin Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">


    <div class="flex">
        <div class="w-1/4 bg-gray-800 text-white min-h-screen p-5">
            <h1 class="text-3xl font-bold mb-8">Admin Dashboard</h1>
            <ul>
                <li><a href="admin/users" class="block text-xl py-2 px-4 hover:bg-gray-700">Manage Users</a></li>
                <li><a href="admin/payments" class="block text-xl py-2 px-4 hover:bg-gray-700">Manage Payments</a></li>
                <li><a href="admin/support" class="block text-xl py-2 px-4 hover:bg-gray-700">Support Inquiries</a></li>
                <li><a href="logout" class="block text-xl py-2 px-4 hover:bg-gray-700">Logout</a></li>
            </ul>
        </div>

 
        <div class="w-3/4 p-8">
            <h2 class="text-3xl font-bold mb-4">Users Management</h2>
            
            <table class="min-w-full bg-white border border-gray-200">
                <thead>
                    <tr>
                        <th class="border px-4 py-2">ID</th>
                        <th class="border px-4 py-2">Name</th>
                        <th class="border px-4 py-2">Email</th>
                        <th class="border px-4 py-2">Role</th>
                        <th class="border px-4 py-2">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td class="border px-4 py-2">${user.id}</td>
                            <td class="border px-4 py-2">${user.name}</td>
                            <td class="border px-4 py-2">${user.email}</td>
                            <td class="border px-4 py-2">${user.role}</td>
                            <td class="border px-4 py-2">
                                <a href="admin/editUser?id=${user.id}" class="text-blue-500 hover:underline">Edit</a> | 
                                <a href="admin/deleteUser?id=${user.id}" class="text-red-500 hover:underline">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

        </div>
    </div>

</body>
</html>
