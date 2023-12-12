<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<title>Editar Curso</title>
<c:import url="../componentes/cabecalho.jsp" />
</head>
<body>

	<div class="p-5 mb-4 bg-light rounded-3">
		<div class="container py-5">
			<h1 class="display-5 fw-bold">Editar ALUNO</h1>
			<p class="col-md-12 fs-4">Preencha o formulário abaixo para
				realizar a alteração do atendimento no sistema.</p>
		</div>
	</div>

	<main>
		<div class="container">
			<form action="altera" method="POST" class="row g-3">

				<security:csrfInput />

				<!-- ID -->
				<input type="hidden" name="id" value="${atendimento.id}" required>

				<!-- DATA -->
				<div class="form-group">
					<label for="data" class="col-form-label obrigatorio">Data</label> <input
						type="date" class="form-control" name="data"
						value="${atendimento.data}" required>
				</div>
				<!-- HORA -->
				<div class="form-group">
					<label for="hora" class="col-form-label obrigatorio">Hora</label> <input
						type="time" class="form-control" name="hora"
						value="${atendimento.hora}" required>
				</div>

				<!-- DESCRIÇÃO -->
				<div class="form-group">
					<label for="descricao" class="col-form-label obrigatorio">Descrição</label>
					<input type="text" class="form-control" name="descricao" autofocus
						MAXLENGTH="255" required value="${atendimento.descricao}">
				</div>

				<div class="text-center">
					<button type="submit" class="btn btn-primary btn-lg">
						<i class="bi bi-arrow-clockwise"></i> Atualizar
					</button>
					<a href="<c:url value='/curso/lista' />"
						class="btn btn-secondary btn-lg"> <i class="bi bi-x"></i>
						Cancelar
					</a>
				</div>

			</form>
		</div>
	</main>

	<c:import url="../componentes/rodape.jsp" />

</body>
</html>
