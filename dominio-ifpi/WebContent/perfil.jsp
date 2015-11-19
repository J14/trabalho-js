<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.ifpi.dominio.model.*" %>
<%@ page import="br.edu.ifpi.dominio.dao.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Meu Perfil</title>
	<link rel="stylesheet" href="_CSS/table-perfil.css">
	<link rel="stylesheet" href="_CSS/template.css">
	<script src="_JS/adm.js"></script>

</head>
<body>


	<div id="container">

		<div id="perfil" class="center">
			<h1 class="center">Minha Solicitação</h1>

			<!-- <table class="table center" border="1">
				
				<tr>
					<td><strong>Nome</strong></td>
					<td colspan="3">João Ferreira da Silva</td>
				</tr>
				<tr>
					<td><strong>	Segmento	</strong></td>				
					<td>			Aluno		</td>
					<td><strong>	Campus		</strong></td>			
					<td>			Parnaiba	</td>
				</tr>
				<tr>
					<td><strong>	CPF			</strong></td>				
					<td>			356.968.798-00		</td>
					<td><strong>	Setor		</strong></td>			
					<td>			7	</td>
				</tr>
				<tr>
					<td><strong>Matricula / SIAPE</strong></td>				
					<td>			20071ASC1298-6	</td>
					<td><strong>Data de Admissão</strong></td>	
					<td>			12/04/2345	</td>
				</tr>
				<tr>
					<td><strong>Celular</strong></td>				
					<td>			9845-1286	</td>
					<td><strong>Email</strong></td>	
					<td>fulanodetal@email.com	</td>
				</tr>
			</table> -->
			
			<% Usuario u = (Usuario) request.getSession().getAttribute("usuario"); %>
			
			<table class="table center" border="1">
		
			<%
				Solicitacao s = u.getSolitacao(); 
			
				out.print("<tr>");
				out.print("<td>"+s.toString()+"</td>");
				out.print("</tr>");
				
				if(s.getStatus() == Status.APROVADO) {
					//TODO link ou botao imprimir
				}
			%>
		
			</table>

		</div>

	  
	  </div>
	

</body>
</html>