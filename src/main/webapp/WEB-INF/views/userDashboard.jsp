<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String user = (String) session.getAttribute("un");
String ue = (String) session.getAttribute("ue");
String uc = (String) session.getAttribute("uc");
if (user == null) {
	response.sendRedirect("lg");
}
%>

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>User Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>

<style>

/* 🔥 BACKGROUND IMAGE */
body {
    background: url("https://images.unsplash.com/photo-1560448204-e02f11c3d0e2") no-repeat center center/cover;
    min-height: 100vh;
    position: relative;
}

/* DARK OVERLAY */
body::before {
    content: "";
    position: absolute;
    top:0;
    left:0;
    right:0;
    bottom:0;
    background: rgba(0,0,0,0.75);
    z-index: 0;
}

/* CONTENT ABOVE OVERLAY */
.container, .navbar {
    position: relative;
    z-index: 1;
}

/* GLASS EFFECT */
.glass {
    background: rgba(0,0,0,0.7);
    border-radius: 15px;
    backdrop-filter: blur(10px);
}

/* INPUT STYLE */
.form-control, .form-select {
    background: rgba(0,0,0,0.6);
    color: white;
    border: 1px solid #ccc;
}

.form-control:focus, .form-select:focus {
    border-color: #00c6ff;
    box-shadow: 0 0 8px #00c6ff;
}

/* HEADING */
h3 {
    background: linear-gradient(to right,#00c6ff,#0072ff);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

/* PROFILE LABEL */
#profileForm label {
    color: #ffffff;
    font-size: 15px;
    letter-spacing: 0.5px;
}

/* VALUE BOX */
.profile-box {
    background: rgba(255,255,255,0.08);
    color: #ffffff;
    padding: 12px;
    border-radius: 10px;
    font-size: 16px;
    border: 1px solid rgba(255,255,255,0.2);
    transition: 0.3s;
}

/* HOVER EFFECT */
.profile-box:hover {
    background: rgba(0,198,255,0.25);
    border-color: #00c6ff;
    box-shadow: 0 0 10px #00c6ff;
    transform: scale(1.02);
}


/* PROFILE CARD */
#profileForm .glass {
    background: rgba(0,0,0,0.8);
    border-radius: 15px;
}

/* FORM LABEL WHITE */
label {
    color: #fff !important;
    text-shadow: 0 0 5px rgba(0,0,0,0.8);
}

/* INPUT TEXT WHITE */
.form-control,
.form-select {
    color: #ffffff !important;
}

/* PLACEHOLDER COLOR */
::placeholder {
    color: #cccccc !important;
}

/* 🔥 FIX NUMBER INPUT WHITE BACKGROUND */
input[type=number]::-webkit-inner-spin-button,
input[type=number]::-webkit-outer-spin-button {
    filter: invert(1);   /* arrows white */
}

/* ALL INPUT FIX */
.form-control,
.form-select {
    background: rgba(0,0,0,0.7) !important;
    color: #ffffff !important;
    border: 1px solid #555 !important;
}

/* ON FOCUS */
.form-control:focus,
.form-select:focus {
    background: rgba(0,0,0,0.9) !important;
    color: #fff !important;
    border-color: #00c6ff !important;
    box-shadow: 0 0 8px #00c6ff !important;
}

/* LABEL FIX */
label {
    color: #ffffff !important;
    font-weight: 500;
}

/* REMOVE WHITE AUTOFILL */
input:-webkit-autofill {
    -webkit-box-shadow: 0 0 0 1000px black inset !important;
    -webkit-text-fill-color: white !important;
}
</style>

</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-black">
    <div class="container-fluid">
        <a class="navbar-brand">
            <marquee class="text-warning fw-bold">Welcome ${un}</marquee>
        </a>

        <div class="ms-auto">
            <button class="btn btn-success me-2" onclick="showProfile()">View Profile</button>
            <a class="btn btn-danger" href="logout">Log Out</a>
        </div>
    </div>
</nav>


<!-- PROFILE -->
<div id="profileForm" class="container mt-4 d-none">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="glass p-4 shadow text-center">

                <h3 class="mb-4">My Profile</h3>

                <!-- USER ICON -->
                <div class="mb-4">
                    <img src="https://cdn-icons-png.flaticon.com/512/149/149071.png"
                         width="90"
                         class="rounded-circle border border-light p-1">
                </div>

                <!-- USERNAME -->
                <div class="mb-3 text-start">
                    <label class="fw-bold text-light">Username</label>
                    <div class="profile-box mt-1">
                        <%= session.getAttribute("un") %>
                    </div>
                </div>

                <!-- EMAIL -->
                <div class="mb-3 text-start">
                    <label class="fw-bold text-light">Email</label>
                    <div class="profile-box mt-1">
                        <%= session.getAttribute("ue") %>
                    </div>
                </div>

                <!-- PHONE -->
                <div class="mb-3 text-start">
                    <label class="fw-bold text-light">Phone</label>
                    <div class="profile-box mt-1">
                        <%= session.getAttribute("uc") %>
                    </div>
                </div>

                <button class="btn btn-outline-light mt-3 w-100" onclick="hideProfile()">Close</button>

            </div>

        </div>
    </div>
</div>

<!-- FORM -->
<div id="addForm" class="container mt-4">
    <div class="row justify-content-center">

        <div class="col-md-6">
            <div class="glass p-4 shadow">

<h3 class="mb-4 text-center">Fill Property Details</h3>

<form>

<div class="mb-3">
<label>Select State</label>
<select id="ssl" onchange="loadC()" class="form-select">
<option value="">-- Select State --</option>
</select>
</div>

<div class="mb-3">
<label>Select City</label>
<select id="cs" onchange="loadL()" class="form-select">
<option value="">-- Select City --</option>
</select>
</div>

<div class="mb-3">
<label>Select Location</label>
<select id="cl" class="form-select">
<option value="">-- Select Location --</option>
</select>
</div>

<div class="mb-3">
<label>Size (sq ft)</label>
<input type="number" id="area_sqft" class="form-control" placeholder="Enter area">
</div>

<div class="mb-3">
<label>Bedrooms</label>
<input type="number" id="bedrooms" class="form-control" placeholder="Enter bedrooms">
</div>

<div class="mb-3">
<label>Bathrooms</label>
<input type="number" id="bathrooms" class="form-control" placeholder="Enter bathrooms">
</div>

<div class="mb-3">
<label>Metro Distance</label>
<input type="number" id="metro_distance" class="form-control" placeholder="Enter distance">
</div>

<div class="mb-3">
<label>Parking</label>
<select id="parking" class="form-select">
<option value="">-- Select --</option>
<option value="true">Yes</option>
<option value="false">No</option>
</select>
</div>

<div class="text-center mt-4">
<button type="reset" class="btn btn-secondary me-2">Clear</button>
<button type="button" class="btn btn-success" onclick="predictRent()">Predict Rent</button>
</div>

<h3 id="result" class="text-center mt-4 text-warning"></h3>

</form>

</div>
        </div>
    </div>
</div>

<script>

// PROFILE
function showProfile(){
document.getElementById("addForm").classList.add("d-none");
document.getElementById("profileForm").classList.remove("d-none");
}

function hideProfile(){
document.getElementById("profileForm").classList.add("d-none");
document.getElementById("addForm").classList.remove("d-none");
}

// LOAD STATES
function loadS(){
fetch("/RentalPriceEstimationApp/admin/states")
.then(res=>res.json())
.then(data=>{
let stateSelect=document.getElementById("ssl");
stateSelect.innerHTML="<option value=''>Select State</option>";
data.forEach(s=>{
let op=document.createElement("option");
op.value=s.statecode;
op.text=s.statename;
stateSelect.appendChild(op);
});
});
}

// LOAD CITY
function loadC(){
let statecode=document.getElementById("ssl").value;
if(statecode=="") return;

fetch("/RentalPriceEstimationApp/admin/cities/"+statecode)
.then(res=>res.json())
.then(data=>{
let cs=document.getElementById("cs");
cs.innerHTML="<option value=''>Select City</option>";
data.forEach(c=>{
let op=document.createElement("option");
op.value=c.id;
op.textContent=c.name;
cs.appendChild(op);
});
});
}

// LOAD LOCATION
function loadL(){
let cityid=document.getElementById("cs").value;
if(cityid=="") return;

fetch("/RentalPriceEstimationApp/admin/locations/"+cityid)
.then(res=>res.json())
.then(data=>{
let locationSelect=document.getElementById("cl");
locationSelect.innerHTML="<option value=''>Select Location</option>";
data.forEach(l=>{
let op=document.createElement("option");
op.value=l.locationcode;
op.textContent=l.locationname;
locationSelect.appendChild(op);
});
});
}

// PAGE LOAD
window.onload=function(){
loadS();
};

// PREDICT RENT (same logic)
function predictRent(){

let property={
locationcode:Number(document.getElementById("cl").value),
area_sqft:Number(document.getElementById("area_sqft").value),
bedrooms:Number(document.getElementById("bedrooms").value),
bathrooms:Number(document.getElementById("bathrooms").value),
metro_distance:Number(document.getElementById("metro_distance").value),
parking:document.getElementById("parking").value==="true"
};

fetch("/RentalPriceEstimationApp/user/predict",{
method:"POST",
headers:{"Content-Type":"application/json"},
body:JSON.stringify(property)
})
.then(res=>res.json())
.then(data=>{
document.getElementById("result").innerText="Predicted Rent ₹ : "+data.price;
});
}

</script>

</body>
</html>