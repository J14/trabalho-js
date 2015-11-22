<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8"/>
	<title>Dom�nio</title>
	<link rel="stylesheet" type="text/css" href="_CSS/template.css">
	<script src="_JS/index.js"></script>
	<!--[if IE]><link rel="shortcut icon" href="_IMG/favicon.ico"><![endif]-->
	<link rel="icon" href="_IMG/favicon.ico">

</head>
<body>
	<div id="container">
		<div id="login">
			<div class="header center">
				<h1>Bem Vindo !</h1>
				<p>Para ver sua solicita��o, entre com seus dados.</p>				
			</div>
			
			<div class="form center">
			
				
				<form action="ServletIdentificaUsuario" method="post">
					<div class="title">
						<input type="text" placeholder="Identificador" name="ident" class="input-title"/>
						<span>MATR�CULA SIAPE ou CPF</span>
					</div>

					
					<div class="title">
						<input type="password" placeholder="Senha" name="senha">
						<span>A senha que voc� cadastrou</span>
					</div>
					
					<input type="submit" value="Entrar" class="btn"/>
					
					<%-- <%if(request.getAttribute("msg-login") != null){ %>
						<span class="error">
							Desculpe. N�o encontramos esse usu�rio.				
						</span>
					<%} %> --%>
					<%if(request.getSession().getAttribute("msg-login") != null){ %>
						<span class="error">
							Desculpe. N�o encontramos esse usu�rio.				
						</span>
					<%} %>
				</form>
			</div>
		</div>


		<div id="cadastro">
			<div class="header center">				
				<h1>N�o tem cadastro? Fa�a um agora!</h1>
				<p>� s� preencher o formul�rio e esperar!</p>
			</div>
			<div class="form center">
				
				<form action="ServletCadastraUsuario" method="post">
				
					<div class="title">
						<input type="text" placeholder="Nome" name="nome"/>
						<span>Digite seu nome completo</span>
					</div>
					
					
					<div class="title">
						<select id="segmento" name="segmento">
							<option >Segmento...</option>
							<option id="aluno" value="aluno">Aluno</option>
							<option value="docente">Docente</option>
							<option value="aposentado">Aposentado</option>
							<option value="TecAdmin">T�cnico-Administrativo</option>
							<option value="presServTerc">Prestador de Servi�o-Terceirizado</option>					 
						</select>
						<span>Segmento</span>
					</div>
					
					<div class="title">
						<input type="text" placeholder="Matricula/SIAPE" name="matriculaSiape"/>
						<span>Somente se for Aluno ou Servidor</span>
					</div>
					
					
					<div class="title">
						<input type="text" placeholder="Campus" name="campus"/>
						<span>Onde voc� estuda/trabalha?</span>
					</div>
					
					<div class="title">
						<input type="text" placeholder="Setor" name="setor"/>
						<span>Qual o setor?</span>
					</div>
					
					<div class="title">
						<input type="text" placeholder="CPF" name="cpf"/>
						<span>N�o se preocupe. Seu CPF n�o ser� divulgado.</span>
					</div>
					
					<div class="title">
						<input type="text" placeholder="Data de Admiss�o" name="dataAdmissao"/>
						<span>Fomato: <strong>DD/MM/AAAA</strong></span>
					</div>
					
					<div class="title">
						<input type="text" placeholder="Telefone" name="celular" />
						<span>Fomato: <strong>DD/MM/AAAA</strong></span>
					</div>
					
					<div class="title">
						<input type="text" placeholder="E-mail" name="email" title=""/>
						<span>Entraremos em contato com voc�.</span>
					</div>
					
					<div class="title">
						<input type="password" placeholder="Senha" name="senha" />
						<span>Senha para login posterior</span>
					</div>				
					
					
					
					
					
					
					<br/>
					<input type="submit" value="Pedir Dom�nio" class="btn" id="btn"/>
					<br/><br/>					
				</form>
				<section id="down">
					<%
						if(request.getSession().getAttribute("msg-cadastro") != null){ 
							request.getSession().setAttribute("msg-cadastro", null);
					%>
						<span class="error">
							Desculpe. N�o conseguimos fazer seu cadastro.<br/>
							Seria bom revisar seu formul�rio.
						</span>					
					<%} %>
				</section>
			</div>
		</div>
	</div>
	
</body>
</html>