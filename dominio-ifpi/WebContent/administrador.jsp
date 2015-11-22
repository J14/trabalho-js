<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="br.edu.ifpi.dominio.model.*" %>
<%@ page import="br.edu.ifpi.dominio.dao.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.persistence.EntityManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Administrador</title>
	<link rel="stylesheet" href="_CSS/table.css">
	<link rel="stylesheet" href="_CSS/template.css">
	<script src="_JS/adm.js"></script>
	<!--[if IE]><link rel="shortcut icon" href="_IMG/favicon.ico"><![endif]-->
	<link rel="icon" href="_IMG/favicon.ico"/>
	<style type="text/css">body{ background: #FFEBB6;}</style>
</head>
<body> 
	


	
		<% 
			
			EntityManager em = (EntityManager) getServletContext().getAttribute("em");
		
			List<Solicitacao> pendentes = new SolicitacaoDAO(em).pendentes(); 
		
		%>
		
		<div id="adm" class="center">
			<h1>Solicitações</h1>
			<p>Bem vindo, Administrador</p>
			
			<br/>
			<% if(pendentes.isEmpty()){
					out.print("<div class=\"administrator-request\">"
							+  "Parabéns!<br/>"
							+ "Nenhuma solicitação pendente.<br/>"
							+ "Relaxe e tome um café.</div>");
					
					
				
				
			}else{
				out.print("<div class=\"administrator-request\">"
						+  "Temos aqui algumas solicitações pendentes.<br/> "
						+ "Pedimos que pense bem antes de clicar em 'Recusar'.<br/>"
						+ "Quem pede um domínio, só pede uma vez.</div>");
				
				
				
				
			%>
			
		<br/><br/>
			 <table class="table center">
			 	<tr class="center">
					<td class="center border-top" width="300"><strong>Nome</strong></td>
					<td class="border-top center"><strong>Segmento</strong></td>
					<td class="border-top center"><strong>Campus</strong></td>
					<td class="border-top center"><strong>Setor</strong></td>
					<td class="border-top center"><strong>CPF</strong></td>
					<td class="border-top center"><strong>Matricula / SIAPE</strong></td>	
					<td class="border-top center"><strong>Data de Admissão</strong></td>
					<td class="border-top center"><strong>Celular</strong></td>
					<td class="border-top center"><strong>Email</strong></td>
					<!-- <td class="center"><strong>Decisão</strong></td> -->
				</tr>
				<%} %>
				<%
					
					
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
				
				
				
				
				<tr>
					<td width="200" class="center"><%= pendente.getUsuario().getNome() %></td>
					<td class="center" ><%= pendente.getUsuario().getNomeSegmento() %>
					<td class="center" ><%= pendente.getUsuario().getCampus() %></td>
					<td class="center" ><%= pendente.getUsuario().getSetor() %></td>
					<td class="center" ><%= pendente.getUsuario().getCpf() %></td>
					<%
						String segmento = pendente.getUsuario().getNomeSegmento();	
						if(!segmento.equals("Aposentado") && !segmento.equals("Prestador de Serviço-Terceirizado")){						
					%>
								
					<td class="center" ><%= pendente.getUsuario().autenticacao() %></td>
					
					<%} else {%>
					
						<td class="center" >---</td>
					<%} %>
					
					<td class="center" >
						<%
							/*  Formatação da data de admissão  */			 
							Date valorDoBanco = pendente.getUsuario().getDataAdmissao();
						    String dataz = "dd/MM/yyyy";
						    SimpleDateFormat formatas = new SimpleDateFormat(dataz );
						    String data = formatas.format(valorDoBanco );
						    out.print(data);					 
						
						%>
					</td>
					<td class="center" ><%= pendente.getUsuario().getCelular() %></td>
					<td class="center" ><%= pendente.getUsuario().getEmail() %></td>
					<!-- 
					<td id="button" class="center">						
						<%
							String urlAprovar = "ServletStatusSolicitacao?id=" + pendente.getId()+ "&botao=btn-aceitar";
							String urlRecusar = "ServletStatusSolicitacao?id=" + pendente.getId()+ "&botao=btn-Recusar";
						%>
						
						<a href="<%= urlAprovar %>" class="btn-aceitar">Aprovar</a>
						<a href="<%= urlRecusar %>" class="btn-recusar">Recusar</a>					
					</td>
					 -->
				</tr>
				<tr>					
					<td class="line-button">
							
					</td>
					<td colspan="8" class="line-button">
						<a href="<%= urlAprovar %>" class="btn-aceitar">Aprovar</a>
						<a href="<%= urlRecusar %>" class="btn-recusar">Recusar</a>
					</td>
				</tr>
				
						
				<%} %>
			</table>
			<br/><br/>
			<a href="ServletLogout" class="btn-defaut">Sair</a>
				
			
		</div>  



	  
	

</body>
</html>