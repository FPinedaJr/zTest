<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign in - DoRA</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body class="bg-gray-900 text-white flex justify-center items-center h-screen">
  <div class="text-center">
    <img src="logo.png" alt="Logo" class="mx-auto mb-4 w-1/2">
    <h1>Sign in to unlock more of DoRA</h1>
    <input id="username" type="username" placeholder="username" class="mt-4 block mx-auto w-64 bg-gray-800 border-gray-700 focus:outline-none focus:ring focus:border-orange-500 rounded-lg py-2 px-4 text-white">
    <input id="password" type="password" placeholder="Password" class="mt-4 block mx-auto w-64 bg-gray-800 border-gray-700 focus:outline-none focus:ring focus:border-orange-500 rounded-lg py-2 px-4 text-white">
    <button id="loginBtn" class="mt-4 text-white font-bold py-2 px-4 rounded-full focus:outline-none focus:shadow-outline bg-orange-500 hover:bg-orange-600">LOG IN</button>
  </div>

  <script>
  $(document).ready(function(){
    $("#loginBtn").click(function(){
      var username = $("#username").val();
      var password = $("#password").val();
      
      $.ajax({
        url: "check_login.php",
        method: "POST",
        data: { username: username, password: password },
        success: function(response) {
          console.log(response)
          if (response === "success") {
            window.location.href = "user_dashboard.php";
          } else {
            console.log("Invalid username or password");
          }
        }
      });
    });
  });
</script>
</body>
</html>
