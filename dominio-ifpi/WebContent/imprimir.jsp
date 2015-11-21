<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.ifpi.dominio.model.*" %>
<%@ page import="br.edu.ifpi.dominio.dao.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8"/>
	<title>Solicita��o de Dom�nio do IFPI</title>
	<link rel="stylesheet" href="_CSS/imprimir.css">
	<script src="_JS/popup-imprimir.js"></script>
	<!--[if IE]><link rel="shortcut icon" href="_IMG/favicon.ico"><![endif]-->
	<link rel="icon" href="_IMG/favicon.ico">    	
</head>
<body>
	<% 
		Usuario u = (Usuario) request.getSession().getAttribute("usuario");
		Solicitacao s = u.getSolitacao(); 		
		String segmento = u.getNomeSegmento();
	%>
	<div id="popup">
		<h1>Calma...</h1>
		<h3>Estamos quase l�.</h3>
		<br><br><br>
		<p>
			Nosso software j� gerou seu documento de solicita��o. <br>
			Quando imprimir, lembre-se de anexar uma c�pia do seu RG. <br>
			<br><br>
			Quer�amos gerar um PDF bem chique pra voc�. Mas estamos trabalhando nisso ainda. <br>
			Para imprimir, basta apertar <span style="color: green; padding: 3px 5px;">CTRL + P </span> ap�s clicar no bot�o abaixo. <br><br>

			Seja Feliz!
		</p>
		<br><br><br>
		<a href="#" id="close-popup" class="btn-defaut">Ok, entendi</a>
	</div>
	<div id="container">
		<div id="header">
			<img src="_IMG/logomarca_instituto.png" width="240" align="left">
			<p align="left"><strong>MINIST�RIO DA EDUCA��O								</strong></p>
			<br>
			<p align="left"><strong>INSTITUTO FEDERAL DE EDUCA��O, CI�NCIA E TECNOLOGIA	</strong></p>
			<br>
			<p align="left"><strong>DIRETORIA DE TECNOLOGIA DA INFORMA��O				</strong></p> 
		</div>
		<br>
		<div id="box">
			<h4>TERMO DE RESPONSABILIDADE</h4>
			<h4>SOLICITA��O DE CRIA��O DE CONTA DE DOM�NIO NO IFPI</h4>

			<br><br>
			<h5><strong>Identifica��o do Servidor</strong></h5>
			<table>
				
				<tr>
					<td class="title">Nome Completo:</td>
					<td class="infor"><%= u.getNome() %></td>
				</tr>

				<tr>
					<td class="title">Segmento:</td>
					<td class="infor"><%= segmento %></td>
				</tr>
				
				<tr>
					<td class="title">Campus:</td>
					<td class="infor"><%= u.getCampus() %></td>
				</tr>
				
				<tr>
					<td class="title">Setor:</td>
					<td class="infor"><%= u.getSetor() %></td>
				</tr>


				<tr>
					<td class="title">CPF:</td>
					<td class="infor"><%= u.getCpf() %></td>
				</tr>
				<%
						if(!segmento.equals("Aposentado") && !segmento.equals("Prestador de Servi�o-Terceirizado")){
						
					%>
				
					<tr>
						<td class="title">Matr�cula/SIAPE:</td>
						<td class="infor"><%= u.autenticacao() %></td>
					</tr>
				<%}%>
				<tr>
					<td class="title">Data de Admiss�o:</td>
					<td class="infor"><%= u.getDataAdmissao() %></td>
				</tr>

				<tr>
					<td class="title">Celular:</td>
					<td class="infor"><%= u.getCelular() %></td>
				</tr>

				<tr>
					<td class="title">Email:</td>
					<td class="infor"><%= u.getEmail() %></td>
				</tr>
			</table>
			<br><br><br><br><br>
			<p>__________________ PI,_________ de _____________________ de __________.</p>
			<br><br>
			<p>Declaro atrav�s do presente termo, que assumo quaisquer responsabilidades decorrentes do uso da conta de dom�nio no Instituto Federal do Piau�. A senha cadastrada � pessoal e intransfer�vel.</p>
			<br><br><br><br><br>
			<p>__________________________________________________________</p>
			<p><strong>Assinatura Servidor</strong></p>
			<br><br><br>
			<p align="left">Conta criada em: ______/______/__________</p>
			<br>
			<p align="left">Respons�vel pela Libera��o: _______________________________________</p>

			<br><br><br>
			<p align="left" style="font-size: 9pt;"><strong>ANEXAR: C�pia da identidade c/ foto.</strong></p>
			<br><br><br><br>
			<h5>
				<i>
					"Fale bem. Fa�a o bem a algu�m. Tenha um milh�o de amigos."<br>
					Campanha de humaniza��o do IFPI.
				</i>
			</h5>

		</div>
	</div>
</body>
























</html>