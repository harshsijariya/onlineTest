<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:include page="test.html"/>
   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><script>
function validateForm() {
  var x = document.forms["myform"]["name"].value;
  if (x == "") {
    alert("Name must be filled out");
    return false;
  }
  var y = document.forms["myform"]["pass"].value;
  if (y.length<8) {
	    alert("Pass must be filled out");
	    return false;
	  }
 
</script>


<style>
body {
  font-family: Arial, Helvetica, sans-serif;
}

* {
  box-sizing: border-box;
}

/* Style inputs */
input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}
input[type=password], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}
input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

/* Style the container/contact section */
.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 10px;
}

/* Create two columns that float next to eachother */
.column {
  float: left;
  width: 50%;
  margin-top: 6px;
  padding: 20px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .column, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
</style>

</head>
<body>



<div class="container">
  <div style="text-align:center">
  <h id='op'></h>
    <h2>Login</h2>
    <p>Login And Test Your Skill</p>
  </div>
  
    <div class="column">
     
<form action="DatabaseAccess" id="my_form" name="myform" method="get" onsubmit="return validateForm()">
        <label for="fname">First Name</label>
        <input type="text" id="fname" name="name" placeholder="Your name..">

        <label for="lname">Enter Password</label>
        <input type="password" id="lname" name="pass" placeholder="Confirm Password">
        
        <input type="submit" value="Submit">
        
      </form><p>
      Don't have account? 
        <h><a href="http://localhost:8085/myser/Signup.html">   Signup</a></h>
      
      </p>
      
    </div>
  </div>
</div>

</body>
</html>
