window.onload = function(){ 
	var btn_aceitar = document.getElementById("btn-aceitar");
	var btn_recusar = document.getElementById("btn-recusar");
	var tr = document.getElementById("1");
	var td = document.getElementById("button");

	function mudaClasseAceitar(){
		tr.className = 'success'
		td.innerHTML = "Aprovado";

	} 
	function mudaClasseRecusar(){
		tr.className = 'error'
		td.innerHTML = "Recusado";
	}


	btn_aceitar.addEventListener("click", mudaClasseAceitar);
	btn_recusar.addEventListener("click", mudaClasseRecusar);


}  


