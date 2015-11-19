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
			
			<% 
				Usuario u = (Usuario) request.getSession().getAttribute("usuario"); 
			
				Solicitacao s = u.getSolitacao(); 		
								
				
				//String segmento = (String)request.getSession().getAttribute("segmento");
				String segmento = u.getNomeSegmento();
			%>

			<table class="table center" border="1">
				
				<tr>
					<td><strong>	Nome</strong></td>
					<td colspan="3"> <%= u.getNome() %> </td>
				</tr>
				<tr>
					<td><strong>	Segmento	</strong></td>				
					<td>			<%= segmento %>		</td>
					<td><strong>	Campus		</strong></td>			
					<td>			<%= u.getCampus() %>	</td>
				</tr>
				<tr>
					<td><strong>	CPF			</strong></td>				
					<td>			<%= u.getCpf() %>		</td>
					<td><strong>	Setor		</strong></td>			
					<td>			<%= u.getSetor() %>	</td>
				</tr>
				<tr>
					<%
						if(!segmento.equals("Aposentado") && !segmento.equals("Prestador de Serviço-Terceirizado")){
						
					%>
					
					<td><strong>Matricula / SIAPE</strong></td>				
					<td><%= u.autenticacao() %></td>
					
					<%
					}%>
					<td><strong>Data de Admissão</strong></td>	
					<td>			<%= u.getDataAdmissao() %>	</td>
				</tr>
				<tr>
					<td><strong>	Celular		</strong></td>				
					<td>			<%= u.getCelular() %>	</td>
					<td><strong>	Email		</strong></td>	
					<td>		<%= u.getEmail() %>	</td>
				</tr>
				
			</table>
			
			
			<form action="ServletLogout" method="get">
				<input type="submit" value="sair">		
			</form>
			
			<%
			
				if(s.getStatus() == Status.APROVADO) {
					out.print("<a href=\"imprimir.jsp\">Imprimir</a>");
				}
				
			%>

		</div>

	  
	  </div>
	

</body>
</html>