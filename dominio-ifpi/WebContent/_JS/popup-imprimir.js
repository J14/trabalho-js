var body = document.getElementsByTagName("body");

window.onload = function(){
	
	var isFirefox = typeof InstallTrigger !== 'undefined';
	var isIE = /* @cc_on!@ */false || !!document.documentMode;
	
	body[0].style.overflow="hidden";
	var btn = document.getElementById("close-popup");
	btn.addEventListener("click", closePopup);
	
	
	if(isFirefox){
		prepareToMozila();
	}
	 
	
	
}

function prepareToMozila(){
	var other = document.getElementById("other-navigator");
	other.style.display="none";
	
	var mozila = document.getElementById("mozila-navigator");
	mozila.style.display="block";
}

function closePopup() {
	document.getElementById("popup").style.display="none";
	body[0].style.overflow="auto";
}
