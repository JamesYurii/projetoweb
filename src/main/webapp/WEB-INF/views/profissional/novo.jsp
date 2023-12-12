<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Cadastrar Profissional</title>

<c:import url="../componentes/cabecalho.jsp" />

<div class="p-5 mb-4 bg-light rounded-3">
	<div class="container py-5">
		<h1 class="display-5 fw-bold">Cadastrar Profissional</h1>
		<p class="col-md-12 fs-4">Preencha o formulário abaixo para
			realizar o cadastro do profissional no sistema.</p>
	</div>
</div>

<main>
	<div class="container">
		<form action="adiciona" method="POST" class="row g-3">

			<security:csrfInput />

			<!-- NOME -->
			<div class="form-group">
				<label for="profissional" class="col-form-label obrigatorio">profissional</label>
				<input type="text" class="form-control" name="profissional"
					autofocus MAXLENGTH="255" required>
			</div>

			<div class="form-group">
				<label for="siape" class="col-form-label obrigatorio">siape</label>
				<input type="number" class="form-control" name="siape" autofocus
					MAXLENGTH="255" required>
			</div>
            <div class="form-group">
				<label for="tipo" class="form-label obrigatorio mt-4">tipo</label> <select
					class="form-select" id="tipo" name="tipo">
					<option value="" disabled selected>selecione um tipo </option>
					<option value="servidor">servidor</option>
					<option value="tercerizador">tercerizador</option>
					<option value="tecnico">tecnico adm</option>
				</select>
			
			
			<div class="form-group">
				<label for="status" class="form-label obrigatorio mt-4">status</label> <select
					class="form-select" id="status" name="status">
					<option value="" disabled selected>selecione status </option>
					<option value="ativo">ativo</option>
					<option value="inativo">inativo</option>
				</select>
			</div>
	</div>

	<div class="text-center">
		<button type="submit" class="btn btn-primary btn-lg">
			<i class="bi bi-plus-circle"></i> Cadastrar
		</button>
		<button type="reset" class="btn btn-secondary btn-lg">
			<i class="bi bi-trash"></i> Limpar
		</button>
	</div>

	</form>
	</div>
</main>

<c:import url="../componentes/rodape.jsp" />