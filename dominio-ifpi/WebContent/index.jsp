<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8"/>
	<title>Domínio</title>
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
				<p>Para ver sua solicitação, entre com seus dados.</p>
			</div>
			
			<div class="form center">
				<form action="ServletIdentificaUsuario" method="post">
					<input type="text" placeholder="Identificador" name="ident" 
					title="Seu identificador pode ser sua matrícula, CPF ou SIAPE. Caso não seja cadastrado, faça um cadastro logo abaixo.">

					<br>
					<input type="password" placeholder="Senha" name="senha" title="Digite a senha que você cadastrou.">

					<input type="submit" value="Entrar" class="btn"/>
				</form>
			</div>
		</div>


		<div id="cadastro">
			<div class="header center">				
				<h1>Não tem cadastro? Faça um agora!</h1>
				<p>É só preencher o formulário e esperar!</p>
			</div>
			<div class="form center">
				
				<form action="ServletCadastraUsuario" method="post">
					<input type="text" placeholder="Nome" name="nome" title="Nome completo"/>

					<select id="segmento" title="Segmento">
						<option >Segmento...</option>
						<option id="aluno" name="aluno">Aluno</option>
						<option name="docente">Docente</option>
						<option name="aposentado">Aposentado</option>
						<option name="TecAdmin">Técnico-Administrativo</option>
						<option name="presServTerc">Prestador de Serviço</option>					 
					</select>

					<input type="text" placeholder="SIAPE" name="SIAPE"/>

					<input type="text" placeholder="Campus" name="campus" title="Precisamos saber onde você estuda ou trabalha."/>
					<input type="text" placeholder="Setor" name="setor"/>
					<input type="text" placeholder="CPF" name="cpf" 
					title="Não se preocupe. Seu cpf não será divulgado."/>

					<input type="text" placeholder="Data de Admissão" name="dataAdmissao"/>
					<input type="text" placeholder="Telefone" name="celular"/>
					<input type="text" placeholder="E-mail" name="email"/>

					<input type="submit" value="Pedir Domínio" class="btn" id="btn"/>
				</form>
			</div>
		</div>		
	</div>
	
</body>
</html>