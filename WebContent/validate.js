function validate() {
	username = document.getElementById("usrname").value;
	password = document.getElementById("pwd").value;

	var reg = /[^a-zA-Z ]/g;
	if (reg.test(username)) {
		alert("username should be only in letters");
		return false;
	}

	var re = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}/;
	if (!re.test(password)) {
		alert("password should contain atleast one caps, lower letters and numbers");
		return false;
	}

	if (document.getElementById("act").value == "register") {
		pwd1 = document.getElementById("pwd1").value;
		if (!(pwd1 == password)) {
			alert("enter same password")
			return false;
		}
	}

	return true;
}

function show() {
	checkbox = document.getElementsByName('chk');
	for ( var i = 0; i < checkbox.length; i++) {
		if (checkbox[i].checked) {
			document.getElementById("num" + i).style.visibility = "visible";
		} else {
			document.getElementById("num" + i).style.visibility = "hidden";
			document.getElementById(i).style.visibility = "hidden";
			getTotal();
		}
	}
}

function givePrice() {

	checkbox = document.getElementsByName('chk');
	for ( var i = 0; i < checkbox.length; i++) {
		if (checkbox[i].checked) {
			num = parseInt(document.getElementById("num" + i).value);
			if (num > parseInt(document.getElementById("q" + i).innerText)) {
				alert("check ur quantity give less quantity");
			} else {
				price = parseInt(document.getElementById("p" + i).innerText);
				document.getElementById(i).innerHTML = num * price;
				document.getElementById(i).style.visibility = "visible";
				getTotal();
			}
		}
	}
}

function getTotal() {
	totItem = 0;
	total = 0;
	checkbox = document.getElementsByName('chk');
	for ( var i = 0; i < checkbox.length; i++) {
		if (checkbox[i].checked) {
			totItem += parseInt(document.getElementById("num" + i).value);
			total += parseInt(document.getElementById(i).innerHTML);
		}
	}
	document.getElementById("totItem").innerHTML = totItem;
	document.getElementById("getTot").innerHTML = total;
	if (isNaN(totItem)) {
		document.getElementById("totItem").style.visibility = "visible";
		document.getElementById("getTot").style.visibility = "visible";
	}
	sessionStorage.setItem("totItem", totItem);
	sessionStorage.setItem("getTot", total);
}

function checkLogin() {
	if (document.getElementById("getTot").innerHTML.length == 1) {
		alert("select any one item")
		return false;
	}
	var user = document.getElementById("user").value;
	if (user == null) {
		alert("login to give payment");
		document.getElementById("user").style.visibility = "visible";
		return false;
	}

	return true;
}

function showPay() {
	document.getElementById("message").innerHTML = "ur item quantity is  "
			+ sessionStorage.getItem("totItem") + "  and cost is "
			+ sessionStorage.getItem("getTot");
}