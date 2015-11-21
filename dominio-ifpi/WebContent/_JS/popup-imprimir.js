var body = document.getElementsByTagName("body");

window.onload = function(){	
	body[0].style.overflow="hidden";
	var btn = document.getElementById("close-popup");
	btn.addEventListener("click", closePopup);
}

function closePopup() {
	document.getElementById("popup").style.display="none";
	body[0].style.overflow="auto";
}