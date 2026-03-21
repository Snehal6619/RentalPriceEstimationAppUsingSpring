

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String user = (String) session.getAttribute("un");
if (user == null) {
	response.sendRedirect("lg");
}
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>admin Dashboard</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
</head>
<body class="bg-dark text-light">
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-secondary">
		<div class="container-fluid">
			<a class="navbar-brand fw-bold" href="#">Rental Price Predication
				System</a>
		</div>
	</nav>
	<div class="container-fluid">
		<div class="row">
			<!-- Sidebar -->
			<div class="col-md-3 col-lg-2 bg-secondary min-vh-100 p-3">
				<h5 class="text-center mb-4">Menu</h5>
				<marquee direction="left" scrollamount="6" behavior="scroll"
					class="text-warning fw-bold"> Welcome ${un} </marquee>
				<div class="nav flex-column">
					<!-- add property -->
					<button class="btn btn-outline-light mb-2"
						onclick="showSection('addForm')">Add Property</button>
					<button class="btn btn-outline-light mb-2"
						onclick="showSection('addState')">Add State</button>
					<button class="btn btn-outline-light mb-2"
						onclick="showSection('addcity')">Add City</button>
					<button class="btn btn-outline-light mb-2"
						onclick="showSection('addloc')">Add location</button>
					<button class="btn btn-outline-light mb-2"
						onclick="showSection('searchForm'); loadProperty();">Display
						Property</button>
					<button class="btn btn-outline-light mb-2"
						onclick="(showSection('displayData'), display());">
						Display User</button>

					<button class="btn btn-outline-light "
						onclick="showSection('displayInquery');displayInquery();">View
						Inquiry</button>
						
					<a class="btn btn-danger mt-5" href="logout">Log Out</a>
				</div>
			</div>
			<!-- Main Content -->
			<div class="col-md-9 col-lg-10 p-4">
				<div id="addForm" class="section">
					<div class="row align-items-center">
						<div class="container mt-5 ">

							<h3 class="text-light mb-4">Add Property</h3>

							<!-- STATE -->
							<div class="mb-3">
								<label class="form-label text-light">Select State</label> <select
									id="ssl" onchange="loadC()"
									class="form-select bg-dark text-light border-light">
									<option value="">Select State</option>
								</select>
							</div>

							<!-- CITY -->
							<div class="mb-3">
								<label class="form-label text-light">Select City</label> <select
									id="cs" onchange="loadL()"
									class="form-select bg-dark text-light border-light">
									<option value="">Select City</option>
								</select>
							</div>

							<!-- LOCATION -->
							<div class="mb-3">
								<label class="form-label text-light">Select Location</label> <select
									id="cl" class="form-select bg-dark text-light border-light">
									<option value="">Select Location</option>
								</select>
							</div>

							<!-- AREA -->
							<div class="mb-3">
								<label class="form-label text-light">Area (sq ft)</label> <input
									type="number" id="area_sqft"
									class="form-control bg-dark text-light border-light">
							</div>

							<!-- BEDROOMS -->
							<div class="mb-3">
								<label class="form-label text-light">Bedrooms</label> <input
									type="number" id="bedrooms"
									class="form-control bg-dark text-light border-light">
							</div>

							<!-- BATHROOMS -->
							<div class="mb-3">
								<label class="form-label text-light">Bathrooms</label> <input
									type="number" id="bathrooms"
									class="form-control bg-dark text-light border-light">
							</div>

							<!-- PARKING -->
							<div class="mb-3">
								<label class="form-label text-light">Parking</label> <select
									id="parking"
									class="form-select bg-dark text-light border-light">
									<option value="">Select</option>
									<option value="true">Yes</option>
									<option value="false">No</option>
								</select>
							</div>

							<!-- METRO -->
							<div class="mb-3">
								<label class="form-label text-light">Metro Distance
									(Meter)</label> <input type="number" id="metro_distance"
									class="form-control bg-dark text-light border-light">
							</div>

							<!-- PRICE -->
							<div class="mb-3">
								<label class="form-label text-light">Price (₹)</label> <input
									type="number" id="price"
									class="form-control bg-dark text-light border-light">
							</div>

							<!-- BUTTONS -->
							<button type="button" onclick="saveProperty()"
								class="btn btn-outline-primary mt-3 me-3">Add Property
							</button>

							<button type="button" onclick="clearForm()"
								class="btn btn-outline-danger mt-3">Clear</button>

							<p id="msg" class="text-success mt-3"></p>

						</div>
					</div>
				</div>


				<!-- add state  -->
				<div id="addState" class="section mt-5 d-none">
					<div class="overlay">
						<!-- Login Section -->
						<div
							class="container flex-grow-1 d-flex justify-content-center align-items-center">
							<div class="col-md-4">
								<div class="card shadow p-4">
									<h3 class="text-center mb-4">Add State</h3>
									<form id="stateForm">
										<div class="mb-3">
											<label class="form-label">State Code</label> <input
												type="number" class="form-control" id="statecode"
												placeholder="Enter state code" required="required" />
										</div>
										<div class="mb-3">
											<label class="form-label">State Name</label> <input
												type="text" class="form-control" required="required"
												id="statename" placeholder="Enter state name" />
										</div>
										<div class="d-flex">
											<button type="submit" class="btn btn-primary me-3">Add</button>
											<button type="reset" class="btn btn-secondary">Cancel</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- add city  -->
				<div id="addcity" class="section mt-5 d-none">
					<div class="overlay">
						<div
							class="container flex-grow-1 d-flex justify-content-center align-items-center">
							<div class="col-md-4">
								<div class="card shadow p-4">
									<h3 class="text-center mb-4">Add City</h3>

									<form id="cityForm">

										<div class="mb-3">
											<label class="form-label">Select State</label> <select
												id="stateSelectCity" name="statecode" class="form-control"
												required>
												<option value="">Select State</option>
											</select>
										</div>

										<div class="mb-3">
											<label class="form-label">City Name</label> <input
												type="text" class="form-control" id="cityname"
												placeholder="Enter city name" required />
										</div>

										<div class="d-flex">
											<button type="submit" class="btn btn-primary me-3">Add</button>
											<button type="reset" class="btn btn-secondary">Cancel</button>
										</div>

									</form>

								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- add location  -->
				<div id="addloc" class="section mt-5 d-none">
					<div class="overlay">
						<div
							class="container flex-grow-1 d-flex justify-content-center align-items-center">
							<div class="col-md-4">
								<div class="card shadow p-4">

									<h3 class="text-center mb-4">Add Location</h3>

									<form>

										<div class="mb-3">
											<label class="form-label">Select State</label> <select
												id="stateSelectLocation" onchange="loadCities()"
												class="form-control">
												<option value="">Select State</option>
											</select>
										</div>

										<div class="mb-3">
											<label class="form-label">Select City</label> <select
												id="citySelect" name="cityid" class="form-control">
												<option value="">Select City</option>
											</select>
										</div>

										<div class="mb-3">
											<label class="form-label">Location Name</label> <input
												type="text" id="locationname" class="form-control"
												placeholder="Enter location name">
										</div>

										<div class="d-flex">
											<button type="button" onclick="saveLocation()"
												class="btn btn-primary me-3">Add</button>

											<button type="reset" class="btn btn-secondary">
												Cancel</button>
										</div>

										<p id="msg" class="mt-3 text-center"></p>

									</form>

								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Search -->
				<div id="searchForm" class="section d-none">
					<div class="container mt-5">
						<h2 class="mb-4">Property List</h2>
						<!-- Search Section -->
						<div class="row mb-4">
							<div class="col-md-4">
								<label class="form-label">Search By City</label> <input
									type="text" id="searchCity"
									class="form-control bg-dark text-light border-secondary"
									placeholder="Enter city" />
							</div>
							<div class="col-md-2 d-flex align-items-end">
								<button type="button" onclick="searchProperty()"
									class="btn btn-primary w-100">Search</button>
							</div>
						</div>
						<!-- Property Table -->
						<table class="table table-dark table-striped table-bordered">
							<thead>
								<tr>
									<th>Property ID</th>
									<th>State</th>
									<th>City</th>
									<th>Location</th>
									<th>Area (sqft)</th>
									<th>Bedrooms</th>
									<th>Bathrooms</th>
									<th>Parking</th>
									<th>Metro Distance</th>
									<th>Price</th>
									<!-- <th>Actions</th> -->
									<th id="actionHeader">Actions</th>
								</tr>
							</thead>
							<tbody id="propertyTable"></tbody>
						</table>
					</div>
				</div>
				<!--Display inquery  -->
				<div id="displayInquery" class="section d-none">
					<div class="container mt-5">
						<h2 class="mb-4">Display Inquiry</h2>
						<table class="table table-dark table-striped table-bordered">
							<thead>
								<tr>
									<th>ID</th>
									<th>Name</th>
									<th>Email</th>
									<th>Message</th>
								</tr>
							</thead>
							<tbody id="tbb">
							</tbody>
							</table>
					</div>
				</div>
				<!-- Display User -->
				<div id="displayData" class="section d-none">
					<div class="container mt-5">
						<h2 class="mb-4">User List</h2>
						<table class="table table-dark table-striped table-bordered">
							<thead>
								<tr>
									<th>User ID</th>
									<th>User Name</th>
									<th>Email</th>
									<th>Contact</th>
									<th>Role</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody id="tb">
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- UPDATE MODAL -->
<div class="modal fade" id="updateModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content bg-dark text-light">

      <div class="modal-header">
        <h5 class="modal-title">Update Property</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body">

        <input type="hidden" id="upid">

        <div class="mb-2">
          <label>Location Code</label>
          <input type="number" id="ulocation" class="form-control">
        </div>

        <div class="mb-2">
          <label>Area</label>
          <input type="number" id="uarea" class="form-control">
        </div>

        <div class="mb-2">
          <label>Bedrooms</label>
          <input type="number" id="ubed" class="form-control">
        </div>

        <div class="mb-2">
          <label>Bathrooms</label>
          <input type="number" id="ubath" class="form-control">
        </div>

        <div class="mb-2">
          <label>Parking</label>
          <select id="upark" class="form-control">
            <option value="true">Yes</option>
            <option value="false">No</option>
          </select>
        </div>

        <div class="mb-2">
          <label>Metro Distance</label>
          <input type="number" id="umetro" class="form-control">
        </div>

        <div class="mb-2">
          <label>Price</label>
          <input type="number" id="uprice" class="form-control">
        </div>

      </div>

      <div class="modal-footer">
        <button class="btn btn-success" onclick="updatePropertyData()">Update</button>
        <button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
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
	
/* //display user */
function display()
{
	fetch("/RentalPriceEstimationApp/admin/display").	
	then((res)=>{
		/* if(!res.ok)
			{
			return res.json().then((err)=>{
				throw err;
			});
			} */
		return res.json();
	}).
	then((data)=>{   //ya data madhe back end vrun yenari list ahe
		let tb=document.getElementById("tb");
		tb.innerHTML="";
		data.forEach(ele => {
			let tr = document.createElement("tr");
			let tdid = document.createElement("td");
			tdid.innerText = ele.id;
			let tdname = document.createElement("td");
			tdname.innerText = ele.username;
			let tdemail = document.createElement("td");
			tdemail.innerText = ele.email;
			let tdcontact = document.createElement("td");
			tdcontact.innerText = ele.contact;
			let tdrole = document.createElement("td");
			tdrole.innerText = ele.role;
			let tdaction = document.createElement("td");
			
			let btn = document.createElement("button");
			btn.innerText = "Delete";
			btn.className="btn btn-danger btn-sm";
			btn.onclick=function(){
				deleteUser(ele.id);  
				};
			
			tdaction.appendChild(btn);
			tr.appendChild(tdid);
			tr.appendChild(tdname);
			tr.appendChild(tdemail);
			tr.appendChild(tdcontact);
			tr.appendChild(tdrole);
			tr.appendChild(tdaction);
			tb.appendChild(tr);
			});
	}).
	catch((err)=>{
		alert(err.message);
	});
}
//delete user
function deleteUser(id)
{
if(confirm("Are you sure you want to delete?"))
{
fetch("/RentalPriceEstimationApp/admin/deleteuser/"+id)
.then(res=>res.text())
.then(msg=>{
alert(msg);
display(); // reload table
})
.catch(err=>{
alert("Error : "+err);
});
}
}
</script>
	<!--save state  -->
	<script type="text/javascript">
	
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
	// page load  even
	/* window.onload=function(){
	loadStates();
	document.getElementById("stateSelectLocation").addEventListener("change",loadCities);
	} */
<!-- </script>

	<!-- 	Save Properties -->
	<script>	 -->
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
console.log("CITY ID:", cityid);
if(cityid=="")
{
return;
}

fetch("/RentalPriceEstimationApp/admin/locations/"+cityid)

.then(res=>res.json())

.then(data=>{
	 console.log("LOCATION DATA:", data);
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
	<script type="text/javascript">

function loadProperty(){

	fetch("/RentalPriceEstimationApp/admin/properties")

	.then(res=>res.json())

	.then(data=>{

	console.log(data);

	let tb=document.getElementById("propertyTable");

	tb.innerHTML="";

	data.forEach(function(p){

	let tr=document.createElement("tr");

	tr.innerHTML=
	"<td>"+p.property_id+"</td>"+
	"<td>"+p.statename+"</td>"+
	"<td>"+p.city+"</td>"+
	"<td>"+p.locationname+"</td>"+
	"<td>"+p.area_sqft+"</td>"+
	"<td>"+p.bedrooms+"</td>"+
	"<td>"+p.bathrooms+"</td>"+
	"<td>"+(p.parking ? "Yes":"No")+"</td>"+
	"<td>"+p.metro_distance+"</td>"+
	"<td>"+p.price+"</td>"+
	"<td>" +
	"<button class='btn btn-danger btn-sm me-2' onclick='deleteProperty("+p.property_id+")'>Delete</button>" +
	"<button class='btn btn-success btn-sm' onclick='editProperty("+p.property_id+")'>Update</button>" +
	"</td>";
	tb.appendChild(tr);

	});

	});

	}
	//clear fild
function clearForm(){
    document.getElementById("ssl").value = "";
    document.getElementById("cs").innerHTML = "<option value=''>Select City</option>";
    document.getElementById("cl").innerHTML = "<option value=''>Select Location</option>";
    document.getElementById("area_sqft").value = "";
    document.getElementById("bedrooms").value = "";
    document.getElementById("bathrooms").value = "";
    document.getElementById("parking").value = "";
    document.getElementById("metro_distance").value = "";
    document.getElementById("price").value = "";
}
function saveProperty(){

    let location = document.getElementById("cl").value;
    let area = document.getElementById("area_sqft").value;
    let bedrooms = document.getElementById("bedrooms").value;
    let bathrooms = document.getElementById("bathrooms").value;
    let parking = document.getElementById("parking").value;
    let metro = document.getElementById("metro_distance").value;
    let price = document.getElementById("price").value;

    // ================= VALIDATION =================

    if(location === ""){
        alert("All fields are required");
        return;
    }

    if(area === "" || Number(area) <= 0){
        alert("Enter valid Area");
        return;
    }

    if(bedrooms === "" || Number(bedrooms) <= 0){
        alert("Enter valid Bedrooms");
        return;
    }

    if(bathrooms === "" || Number(bathrooms) <= 0){
        alert("Enter valid Bathrooms");
        return;
    }

    if(parking === ""){
        alert("Select Parking");
        return;
    }

    if(metro === "" || Number(metro) < 0){
        alert("Enter valid Metro Distance");
        return;
    }

    if(price === "" || Number(price) <= 0){
        alert("Enter valid Price");
        return;
    }

    // ================= API CALL =================

    let property={
        locationcode: Number(location),
        area_sqft: Number(area),
        bedrooms: Number(bedrooms),
        bathrooms: Number(bathrooms),
        parking: parking === "true",
        metro_distance: Number(metro),
        price: Number(price)
    };

    fetch("/RentalPriceEstimationApp/admin/saveProperty",{
        method:"POST",
        headers:{
            "Content-Type":"application/json"
        },
        body:JSON.stringify(property)
    })
    .then(res=>res.text())
    .then(msg=>{
        alert(msg);
        clearForm();
    });
}

</script>

	<!--search city  -->
	<script type="text/javascript">
function searchProperty(){

    let city = document.getElementById("searchCity").value;

    if(city === ""){
        alert("Enter city name");
        return;
    }

    document.getElementById("actionHeader").style.display = "none";
    
    fetch("/RentalPriceEstimationApp/admin/search/" + city)
    .then(res => res.json())
    .then(data => {

        let tb = document.getElementById("propertyTable");
        tb.innerHTML = "";

        data.forEach(function(p){

            let tr = document.createElement("tr");

            tr.innerHTML =
            "<td>"+p.property_id+"</td>"+
            "<td>"+p.statename+"</td>"+
            "<td>"+p.city+"</td>"+
            "<td>"+p.locationname+"</td>"+
            "<td>"+p.area_sqft+"</td>"+
            "<td>"+p.bedrooms+"</td>"+
            "<td>"+p.bathrooms+"</td>"+
            "<td>"+(p.parking ? "Yes":"No")+"</td>"+
            "<td>"+p.metro_distance+"</td>"+
            "<td>"+p.price+"</td>";

            tb.appendChild(tr);
        });

    })
    .catch(err=>{
        alert("Error: " + err);
    });
}
</script>

	<!-- delete proprty -->
	<script type="text/javascript">
function deleteProperty(id){

    if(!confirm("Are you sure you want to delete?")){
        return;
    }
 console.log(id);
    fetch("/RentalPriceEstimationApp/admin/delete/" + id, {
        method: "DELETE"
    })
    .then(res => res.text())
    .then(msg => {
        alert(msg);

        loadProperty();  
    })
    .catch(err => {
        alert("Error: " + err);
    });
}


//update
function editProperty(id){

    fetch("/RentalPriceEstimationApp/admin/property/" + id)
    .then(res => res.json())
    .then(data => {

        document.getElementById("upid").value = data.property_id;
        document.getElementById("ulocation").value = data.locationcode;
        document.getElementById("uarea").value = data.area_sqft;
        document.getElementById("ubed").value = data.bedrooms;
        document.getElementById("ubath").value = data.bathrooms;
        document.getElementById("upark").value = data.parking;
        document.getElementById("umetro").value = data.metro_distance;
        document.getElementById("uprice").value = data.price;

        // 👇 modal open
        let modal = new bootstrap.Modal(document.getElementById('updateModal'));
        modal.show();
    });
}

function updatePropertyData(){

    let property = {
        property_id: document.getElementById("upid").value,
        locationcode: document.getElementById("ulocation").value,
        area_sqft: document.getElementById("uarea").value,
        bedrooms: document.getElementById("ubed").value,
        bathrooms: document.getElementById("ubath").value,
        parking: document.getElementById("upark").value === "true",
        metro_distance: document.getElementById("umetro").value,
        price: document.getElementById("uprice").value
    };

    fetch("/RentalPriceEstimationApp/admin/updateProperty", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(property)
    })
    .then(res => res.text())
    .then(msg => {
        alert(msg);

        // modal close
        let modal = bootstrap.Modal.getInstance(document.getElementById('updateModal'));
        modal.hide();

        loadProperty();
    });
}

function displayInquery() {

    fetch("/RentalPriceEstimationApp/admin/getAllInquiries")
    .then((res) => {
        return res.json();
    })
    .then((data) => {

        console.log(data);

        let tb = document.getElementById("tbb"); // correct table id
        tb.innerHTML = ""; // clear once

        data.forEach(ele => {

            let tr = document.createElement("tr");

            let tdid = document.createElement("td");
            tdid.innerText = ele.id;

            let tdname = document.createElement("td");
            tdname.innerText = ele.name;

            let tdemail = document.createElement("td");
            tdemail.innerText = ele.email;

            let tdmessage = document.createElement("td");
            tdmessage.innerText = ele.message;

            tr.appendChild(tdid);
            tr.appendChild(tdname);
            tr.appendChild(tdemail);
            tr.appendChild(tdmessage);

            tb.appendChild(tr);
        });

    })
    .catch((err) => {
        console.log("Error:", err);
    });
}
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
