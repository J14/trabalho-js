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
	
	<link rel="stylesheet" href="_CSS/template.css">
	<link rel="stylesheet" href="_CSS/table-perfil.css">
	<script src="_JS/adm.js"></script>
	<!--[if IE]><link rel="shortcut icon" href="_IMG/favicon.ico"><![endif]-->
	<link rel="icon" href="_IMG/favicon.ico">

</head>
<body>

 
	<div id="container">

		<div id="perfil" class="center">
			<% 
				Usuario u = (Usuario) request.getSession().getAttribute("usuario"); 
			
				Solicitacao s = u.getSolitacao(); 		
								
				
				//String segmento = (String)request.getSession().getAttribute("segmento");
				String segmento = u.getNomeSegmento();
			%>
		
		
		
			<h1 class="center">Meu Perfil</h1>
			<p>Esta � a sua solicita��o de dom�nio.</p>			
			
			<br/><br/>
			<table class="center" border="1">
				
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
					<td><strong>Matricula / SIAPE</strong></td>	
					<%
						/* A matr�cula ou SIAPE s� ser� exibida quando o usu�rio n�o for aposentado nem terceirizado. */
						if(!segmento.equals("Aposentado") && !segmento.equals("Prestador de Servi�o-Terceirizado")){						
					%>							
						<td><%= u.autenticacao() %></td>
					
					<%}else{%>					
						<td>---</td>
					<%} %>
					<td><strong>Data de Admiss�o</strong></td>	
					<td>			<%= u.getDataAdmissao() %>	</td>
				</tr>
				<tr>
					<td><strong>	Celular		</strong></td>				
					<td>			<%= u.getCelular() %>	</td>
					<td><strong>	Email		</strong></td>	
					<td>		<%= u.getEmail() %>	</td>
				</tr>
				
			</table>
			<br/><br/>
			
			
						
			<%  //if(s.getStatus() == Status.APROVADO) {
				//out.print("<a href=\"imprimir.jsp\"  class=\"btn-defaut\">Imprimir</a>");	
		
				switch(s.getStatus()){
					case APROVADO:
						out.print("<div class=\"acepted-request\">"
							+"Parab�ns! Sua solicita��o foi aprovada! <br/>"
							+"Agora, basta imprimir e levar no CTI do seu campus!<br/>"
							+"<br/><br/><a href=\"imprimir.jsp\"  class=\"btn-defaut\">Imprimir</a>"
							+ "</div>");
						break;
						
					case REPROVADO:
						out.print(" <div class=\"denied-request\">" 
								+ "Desculpe! Sua solicita��o n�o foi aceita! <br/>"
								+ "A vida prega algumas pe�as na vida da gente. <br/>Acostume-se.<br/></div>");
						break;
						
					case PENDENTE:
						out.print(" <div class=\"acepted-request\">"
								+ "Pronto! Agora � s� esperar ! <br/>"
								+ "Um administrador vai analisar sua solicita��o.<br/>"
								+ "Venha sempre aqui para saber das novidades.</div>");
						break;			
				}
						
			%>
							
			<br/><br/>
			<a href="ServletLogout" class="btn-defaut">Sair</a> 

		</div>

	  
	  </div>
	

</body>
</html>