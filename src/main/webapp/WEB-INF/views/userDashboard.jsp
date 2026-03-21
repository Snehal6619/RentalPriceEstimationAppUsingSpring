
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

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"/>

</head>

<body class="bg-dark text-light">

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-black">
    <div class="container-fluid">
        <a class="navbar-brand" href="">
            <marquee class="text-warning fw-bold">Welcome ${un}</marquee>
        </a>

        <div class="ms-auto">
            <button class="btn btn-success me-2" onclick="showProfile()">View Profile</button>
            <a class="btn btn-danger " href="logout">Log Out</a>
        </div>
    </div>
</nav>


<div id="profileForm" class="container mt-4 d-none">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="bg-black border border-secondary rounded p-4 shadow">
                <h3 class="mb-3 text-center">My Profile</h3>
                <form id="userProfileForm">
                    <div class="mb-3">
                        <label>Username</label>
                       <%--  <input type="text" id="username" class="form-control bg-dark text-light border-light" readonly value="<%= session.getAttribute("un") %>"> --%>
                       <h3><%= session.getAttribute("un") %></h3>
                    </div>

                    <div class="mb-3">
                        <label>Email</label>
                                <h3><%= session.getAttribute("ue") %></h3>
                       
                    </div>

                    <div class="mb-3">
                        <label>Phone</label>
                   		        <h3><%= session.getAttribute("uc") %></h3>
                   	 </div>

                    <div class="text-center mt-3">

                        <button type="button" class="btn btn-secondary btn-lg" onclick="hideProfile()">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- FORM SECTION (UPPER POSITION) -->
<div id="addForm" class="container mt-4">
    <div class="row justify-content-center">

        <div class="col-md-6">

            <!-- BLACK FORM -->
            
<div class="bg-black border border-secondary rounded p-4 shadow">
                <h3 class="mb-3 text-center">Fill Property details</h3>

               <form>

<div class="mt-3">
<label>Select State</label>
<select id="ssl" onchange="loadC()"  class="form-select bg-dark text-light border-secondary">
    <option value="">-- Select State --</option>
</select>
</div>

<div class="mt-3">
<label>Select City</label>
<select id="cs" onchange="loadL()"  class="form-select bg-dark text-light border-secondary">
    <option value="">-- Select City --</option>
</select>
</div>

<div class="mt-3">
<label>Select Location</label>
<select id="cl"  class="form-select bg-dark text-light border-secondary">
    <option value="">-- Select Location --</option>
</select>
</div>

<div class="mt-3">
<label>Size (sq ft)</label>
<input type="number" id="area_sqft"  class="form-select bg-dark text-light border-secondary">
</div>

<div class="mt-3">
<label>Bedrooms</label>
<input type="number" id="bedrooms"  class="form-select bg-dark text-light border-secondary">
</div>

<div class="mt-3">
<label>Bathrooms</label>
<input type="number" id="bathrooms"  class="form-select bg-dark text-light border-secondary">
</div>

<div class="mt-3">
<label>Metro Distance</label>
<input type="number" id="metro_distance"  class="form-select bg-dark text-light border-secondary">
</div>

<div class="mt-3">
<label>Parking</label>
<select id="parking"  class="form-select bg-dark text-light border-secondary">
    <option value="">-- Select --</option>
    <option value="true">Yes</option>
                    <option value="false">No</option>
</select>
</div>

<div class="mt-4 text-center">
<button type="reset" class="btn btn-secondary">Clear</button>

<button type="button" class="btn btn-success" onclick="predictRent()">Predict Rent</button>

</div>

<h3 id="result" class="text-center mt-4 text-warning"></h3>

</form>

            </div>

        </div>
    </div>
</div>


<script>

function showSection(sectionId) {
	const sections=document.querySelectorAll(".section");
	sections.forEach(sec=>{
	sec.classList.add("d-none");
	});
	document.getElementById(sectionId).classList.remove("d-none");
	if(sectionId=="addcity" || sectionId=="addloc")
	{
	loadStates();
	}
	}

    // 🔥 PARKING
    let p = document.getElementById("parking");
    p.innerHTML = `
        <option value=''>--Select--</option>
        <option value="1">Yes</option>
        <option value="0">No</option>
    `;

});

document.getElementById("stateForm").addEventListener("submit",function(event){
	event.preventDefault();
	let statecode=document.getElementById("statecode").value.trim();
	let statename=document.getElementById("statename").value.trim();
	if(statecode=="")
	{
	alert("statecode required");
	return;
	}
	if(statename=="")
	{
	alert("statename required");
	return;
	}
	let state={
	statecode:statecode,
	statename:statename
	};
	fetch("/RentalPriceEstimationApp/admin/savestate",{
	method:"POST",
	headers:{
	"Content-Type":"application/json"
	},
	body:JSON.stringify(state)
	})
	.then(res=>res.text())
	.then(msg=>{
	alert(msg);
	document.getElementById("stateForm").reset();
	})
	.catch(err=>{
	alert("Error : "+err);
	});
	});
</script>
	<!-- load state -->
	<script>	
function loadStates(){
	fetch("/RentalPriceEstimationApp/admin/states")
	.then(res=>res.json())
	.then(data=>{
	let stateCity=document.getElementById("stateSelectCity");
	let stateLocation=document.getElementById("stateSelectLocation");
	stateCity.innerHTML="<option value=''>Select State</option>";
	stateLocation.innerHTML="<option value=''>Select State</option>";
	data.forEach(s=>{
	let op1=document.createElement("option");
	op1.value=s.statecode;
	op1.text=s.statename;
	let op2=document.createElement("option");
	op2.value=s.statecode;
	op2.text=s.statename;
	stateCity.appendChild(op1);
	stateLocation.appendChild(op2);
	});
	});
	}
	// load cities
	function loadCities(){
	let statecode=document.getElementById("stateSelectLocation").value;
	if(statecode=="")
	{
	return;
	}
	fetch("/RentalPriceEstimationApp/admin/cities/"+statecode)
	.then(res=>res.json())
	.then(data=>{
	let citySelect=document.getElementById("citySelect");
	citySelect.innerHTML="<option value=''>Select City</option>";
	data.forEach(function(c){
	let op=document.createElement("option");
	op.value=c.id;
	op.textContent=c.name;
	citySelect.appendChild(op);
	});
	});
	}
	
	//save location
	function saveLocation(){
		let cityid=document.getElementById("citySelect").value;
		let locationname=document.getElementById("locationname").value;
		let loc={
		cid:cityid,
		locationname:locationname
		};
		fetch("/RentalPriceEstimationApp/admin/saveLocation",{
		method:"POST",
		headers:{
		"Content-Type":"application/json"
		},
		body:JSON.stringify(loc)
		})
		.then(res=>res.text())
		.then(msg=>alert(msg));
		}
	
	function loadS(){

		fetch("/RentalPriceEstimationApp/admin/states")

		.then(res=>res.json())

		.then(data=>{

		let stateSelect=document.getElementById("ssl");

		stateSelect.innerHTML="<option value=''>Select State</option>";

		data.forEach(function(s){

		let op=document.createElement("option");

		op.value=s.statecode;
		op.text=s.statename;

		stateSelect.appendChild(op);

		});

		});

		}
	// load cities
	function loadC(){
	let statecode=document.getElementById("ssl").value;
	if(statecode=="")
	{
	return;
	}
	fetch("/RentalPriceEstimationApp/admin/cities/"+statecode)
	.then(res=>res.json())
	.then(data=>{
	let cs=document.getElementById("cs");
	cs.innerHTML="<option value=''>Select City</option>";
	data.forEach(function(c){
	let op=document.createElement("option");
	op.value=c.id;
	op.textContent=c.name;
	cs.appendChild(op);
	});
	});
	}
	//load location
	function loadL(){
let cityid=document.getElementById("cs").value;

if(cityid=="")
{
return;
}

fetch("/RentalPriceEstimationApp/admin/locations/"+cityid)

.then(res=>res.json())

.then(data=>{

let locationSelect=document.getElementById("cl");

locationSelect.innerHTML="<option value=''>Select Location</option>";

data.forEach(function(l){

let op=document.createElement("option");

op.value=l.locationcode;
op.textContent=l.locationname;

locationSelect.appendChild(op);

});

});

}
	
	//save property
	function saveProperty(){	
		let property={
			    locationcode: Number(document.getElementById("cl").value),
			    area_sqft: Number(document.getElementById("area_sqft").value),
			    bedrooms: Number(document.getElementById("bedrooms").value),
			    bathrooms: Number(document.getElementById("bathrooms").value),
			    parking: document.getElementById("parking").value === "true",
			    metro_distance: Number(document.getElementById("metro_distance").value),
			    price: Number(document.getElementById("price").value)
			};
		fetch("/RentalPriceEstimationApp/admin/saveProperty",{
		method:"POST",
		headers:{
		"Content-Type":"application/json"
		},
		body:JSON.stringify(property)
		})
		.then(res=>res.text())
		.then(msg=>alert(msg));
		};
	// page load  even
	/* window.onload=function(){
	loadS();
	document.getElementById("ssl").addEventListener("change",loadC);
	} */
	
	window.addEventListener("load",function(){

		loadStates(); // state for city/location form
		loadS();      // state for property form
		document.getElementById("stateSelectLocation").addEventListener("change",loadCities);
		document.getElementById("ssl").addEventListener("change",loadC);
		document.getElementById("cs").addEventListener("change",loadL);
		});

</script>



<script>
function showProfile() {
    document.getElementById("addForm").classList.add("d-none");
    document.getElementById("profileForm").classList.remove("d-none");
}

function hideProfile() {
    document.getElementById("profileForm").classList.add("d-none");
    document.getElementById("addForm").classList.remove("d-none");
}
</script>
<!-- predict rent -->
<script type="text/javascript">

function predictRent(){


	let state = document.getElementById("ssl").value;
	let city = document.getElementById("cs").value;
	let location = document.getElementById("cl").value;
	let area = document.getElementById("area_sqft").value;
	let bed = document.getElementById("bedrooms").value;
	let bath = document.getElementById("bathrooms").value;
	let metro = document.getElementById("metro_distance").value;
	let parking = document.getElementById("parking").value;

	// ✅ VALIDATION

	if(state==""){
	alert("Please select state");
	return;
	}

	if(city==""){
	alert("Please select city");
	return;
	}

	if(location==""){
	alert("Please select location");
	return;
	}

	if(area=="" || area<=0){
	alert("Enter valid area (sq ft)");
	return;
	}

	if(area > 5000){
	alert("Area too large (Max 5000 allowed)");
	return;
	}

	if(bed=="" || bed<=0){
	alert("Enter valid bedrooms");
	return;
	}

	if(bed > 10){
	alert("Max 10 bedrooms allowed");
	return;
	}

	if(bath=="" || bath<=0){
	alert("Enter valid bathrooms");
	return;
	}

	if(bath > 10){
	alert("Max 10 bathrooms allowed");
	return;
	}

	if(metro=="" || metro<0){
	alert("Enter valid metro distance");
	return;
	}

	if(metro > 50000){
	alert("Metro distance too high");
	return;
	}

	if(parking==""){
	alert("Select parking option");
	return;
	}


	let property={
	locationcode: Number(location),
	area_sqft: Number(area),
	bedrooms: Number(bed),
	bathrooms: Number(bath),
	metro_distance: Number(metro),
	parking: parking === "true"
	};


	fetch("/RentalPriceEstimationApp/user/predict",{
	method:"POST",
	headers:{
	"Content-Type":"application/json"
	},
	body:JSON.stringify(property)
	})
	.then(res=>res.json())
	.then(data=>{
	document.getElementById("result").innerText =
	"Predicted Rent ₹ : " + data.price;
	})
	.catch(err=>{
	alert("Error : "+err);
	});

	}
</script>
</body>
</html>