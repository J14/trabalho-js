<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Administrador</title>
	<link rel="stylesheet" href="_CSS/table.css">
	<link rel="stylesheet" href="_CSS/template.css">
	<script src="_JS/adm.js"></script>

</head>
<body> 




	<div id="container">

		<div id="adm" class="center">
			<h1>Solicita��es</h1>
		
			<table class="table">
				<strong>
				<tr class="center">
					<td><strong>Nome</strong></td>
					<td><strong>Segmento</strong></td>
					<td><strong>Campus</strong></td>
					<td><strong>Setor</strong></td>
					<td><strong>CPF</strong></td>
					<td><strong>Matricula / SIAPE</strong></td>
					<td><strong>Data de Admiss�o</strong></td>
					<td><strong>Celular</strong></td>
					<td><strong>Email</strong></td>
					<td><strong>Decis�o</strong></td>
				</tr>
				</strong>
				<tr class="error">
					<td>Jo�o Ferreira da Silva</td>
					<td>Aluno</td>
					<td>Parna�ba</td>
					<td>Teste</td>
					<td>568.789.256-99</td>
					<td>2014ACD987-88</td>
					<td>12/55/9874</td>
					<td>9985-9658</td>
					<td>fulanodetal@email.com</td>
					<td>Recusado</td>
				</tr>
				<tr id="1" >
					<td>Jo�o Ferreira da Silva Santos Cruz Civaldo</td>
					<td>Aluno</td>
					<td>Parna�ba</td>
					<td>Teste</td>
					<td>568.789.256-99</td>
					<td>2014ACD987-88</td>
					<td>12/55/9874</td>
					<td>9985-9658</td>
					<td>fulanodetal@email.com</td>
					<td id="button"><button id="btn-aceitar">Aprovar</button> <button id="btn-recusar">Recusar</button></td>
				</tr>

				<tr class="success">
					<td>Jo�o Ferreira da Silva Santos Cruz Civaldo</td>
					<td>Aluno</td>
					<td>Parna�ba</td>
					<td>Teste</td>
					<td>568.789.256-99</td>
					<td>2014ACD987-88</td>
					<td>12/55/9874</td>
					<td>9985-9658</td>
					<td>fulanodetal@email.com</td>
					<td>Aprovado</td>
				</tr>

				<tr>
					<td>Jo�o Ferreira da Silva Santos Cruz Civaldo</td>
					<td>Aluno</td>
					<td>Parna�ba</td>
					<td>Teste</td>
					<td>568.789.256-99</td>
					<td>2014ACD987-88</td>
					<td>12/55/9874</td>
					<td>9985-9658</td>
					<td>fulanodetal@email.com</td>
					<td><button>Aprovar</button> <button>Recusar</button></td>
				</tr>
			</table>
		</div>  



	  </div>
	</div>

</body>
</html>