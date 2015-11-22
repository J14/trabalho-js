<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.ifpi.dominio.model.*" %>
<%@ page import="br.edu.ifpi.dominio.dao.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8"/>
	<title>Solicitação de Domínio do IFPI</title>
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
		<h3>Estamos quase lá.</h3>
		<br><br><br>
		<p id="other-navigator">
			Nosso software já gerou seu documento de solicitação. <br>
			Quando imprimir, lembre-se de anexar uma cópia do seu RG. <br>
			<br><br>
			Queríamos gerar um PDF bem chique pra você. Mas estamos trabalhando nisso ainda. <br>
			Para imprimir, basta apertar <span style="color: green; padding: 3px 5px;">CTRL + P </span> após clicar no botão abaixo. <br><br>

			Seja Feliz!
		</p>
		<p id="mozila-navigator">
			<span style="color: red;">Atenção:</span><br/><br/>
			Não imprima no Mozila Firefox. Tente em outro navegador se possível.<br/>
			Se não tiver outra opçao, siga os passos a seguir:
			<br><br><br>
			<span style="color: green;">1º Passo:</span><br/>
			Clique no menu superior direito:<br/><br/>
			<img src="_IMG/1-passo.png"/>
			
			<br><br><br>
			<span style="color: green;">2º Passo:</span><br/>
			Clique na opção 'Imprimir':<br/><br/>
			<img src="_IMG/2-passo.png"/>
			
			
			<br><br><br>
			<span style="color: green;">2º Passo:</span><br/>
			Na opção 'escala' escolha '60%':<br/><br/>
			<img src="_IMG/3-passo.png"/>
		</p>		
		
		<p style="margin-bottom: 40px;"><a href="#" id="close-popup" class="btn-defaut">Ok, entendi</a></p>
	</div>
	<div id="container">
		<div id="header">
			<img src="_IMG/logomarca_instituto.png" width="240" align="left">
			<p align="left"><strong>MINISTÉRIO DA EDUCAÇÃO								</strong></p>
			<br>
			<p align="left"><strong>INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA	</strong></p>
			<br>
			<p align="left"><strong>DIRETORIA DE TECNOLOGIA DA INFORMAÇÃO				</strong></p> 
		</div>
		<br>
		<div id="box">
			<h4>TERMO DE RESPONSABILIDADE</h4>
			<h4>SOLICITAÇÃO DE CRIAÇÃO DE CONTA DE DOMÍNIO NO IFPI</h4>

			<br><br>
			<h5><strong>Identificação do Servidor</strong></h5>
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
						if(!segmento.equals("Aposentado") && !segmento.equals("Prestador de Serviço-Terceirizado")){
						
					%>
				
					<tr>
						<td class="title">Matrícula/SIAPE:</td>
						<td class="infor"><%= u.autenticacao() %></td>
					</tr>
				<%}%>
				<tr>
					<td class="title">Data de Admissão:</td>
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
			<p>Declaro através do presente termo, que assumo quaisquer responsabilidades decorrentes do uso da conta de domínio no Instituto Federal do Piauí. A senha cadastrada é pessoal e intransferível.</p>
			<br><br><br><br><br>
			<p>__________________________________________________________</p>
			<p><strong>Assinatura Servidor</strong></p>
			<br><br><br>
			<p align="left">Conta criada em: ______/______/__________</p>
			<br>
			<p align="left">Responsável pela Liberação: _______________________________________</p>

			<br><br><br>
			<p align="left" style="font-size: 9pt;"><strong>ANEXAR: Cópia da identidade c/ foto.</strong></p>
			<br><br><br><br>
			<h5>
				<i>
					"Fale bem. Faça o bem a alguém. Tenha um milhão de amigos."<br>
					Campanha de humanização do IFPI.
				</i>
			</h5>

		</div>
	</div>
</body>
























</html>