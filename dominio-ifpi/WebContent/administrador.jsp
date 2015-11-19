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
	<title>Administrador</title>
	<link rel="stylesheet" href="_CSS/table.css">
	<link rel="stylesheet" href="_CSS/template.css">
	<script src="_JS/adm.js"></script>

</head>
<body> 
	


	<div id="container">

		<div id="adm" class="center">
			<h1>Solicitações</h1>
		
			 <table class="table">
				<%
					List<Solicitacao> pendentes = new SolicitacaoDAO().pendentes(); 
					
					for(Solicitacao pendente : pendentes){
						/*
						out.print("<tr>");
						out.print("<td width=\"100\">"+pendente.getId()+"</td>");
						out.print("<td>");
						out.print("<a href=\"/dominio-ifpi/ServletStatusSolicitacao?id="+pendente.getId()+"\">Aprovado</a> |");
						out.print("<a href=\"/dominio-ifpi/ServletStatusSolicitacao?id="+pendente.getId()+"\">Reprovado</a>");
						out.print("</td>");
						out.print("</tr>");
						*/						
				%>
				
				
				<tr class="center">
					<td><strong>Nome</strong></td>
					<td><strong>Segmento</strong></td>
					<td><strong>Campus</strong></td>
					<td><strong>Setor</strong></td>
					<td><strong>CPF</strong></td>
					<td><strong>Matricula / SIAPE</strong></td>	
					<td><strong>Data de Admissão</strong></td>
					<td><strong>Celular</strong></td>
					<td><strong>email</strong></td>
					<td><strong>Decisão</strong></td>
				</tr>
				
				<tr>
					<td><%= pendente.getUsuario().getNome() %></td>
					<td><%= pendente.getUsuario().getNomeSegmento() %>
					<td><%= pendente.getUsuario().getCampus() %></td>
					<td><%= pendente.getUsuario().getSetor() %></td>
					<td><%= pendente.getUsuario().getCpf() %></td>
					<%
						String segmento = pendente.getUsuario().getNomeSegmento();	
						if(!segmento.equals("Aposentado") && !segmento.equals("Prestador de Serviço-Terceirizado")){
							System.out.println("Entrou");
						
					%>
								
					<td><%= pendente.getUsuario().autenticacao() %></td>
					
					<%} else {%>
					
					<td></td>
					<%} %>
					
					<td><%= pendente.getUsuario().getDataAdmissao() %></td>
					<td><%= pendente.getUsuario().getCelular() %></td>
					<td><%= pendente.getUsuario().getEmail() %></td>
					<td id="button">
					
						<!-- <form action="ServletStatusSolicitacao?">
							<input type="submit" value="Aprovar" id="btn-aceitar" name="btn-aceitar"/>
						</form>
						
						<form action="ServletStatusSolicitacao?">
							<input type="submit" value="Recusar" id="btn-recusar" name="btn-recusar"/>
						</form> -->
						
						<%
							String urlAprovar = "ServletStatusSolicitacao?id=" + pendente.getId()+ "&botao=btn-aceitar";
							String urlRecusar = "ServletStatusSolicitacao?id=" + pendente.getId()+ "&botao=btn-Recusar";
						%>
						
						<a href="<%= urlAprovar %>">Aprovar</a>
						<a href="<%= urlRecusar %>">Recusar</a>					
					</td>
				</tr>
				
						
				<%} %>
			</table>
			
			<form action="ServletLogout" method="get">
				<input type="submit" value="sair">		
			</form>
			
		</div>  



	  </div>
	</div>

</body>
</html>