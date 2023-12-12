<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

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
        <p class="col-md-12 fs-4">Preencha o formulário abaixo para realizar a alteração do aluno no sistema.</p>
    </div>
</div>

<main>
    <div class="container">
        <form action="altera" method="POST" class="row g-3">

            <security:csrfInput />

            <!-- ID -->
            <input type="hidden" name="id" value="${aluno.id}" required>

            <!-- NOME -->
            <div class="form-group">
                <label for="nome" class="col-form-label obrigatorio">Nome</label>
                <input type="text" class="form-control" name="nome" autofocus MAXLENGTH="255" value="${aluno.nome}" required>
            </div>

            <!-- MATRICULA -->
            <div class="form-group">
                <label for="matricula" class="col-form-label obrigatorio">Matricula</label>
                <input type="number" class="form-control" name="matricula" autofocus MAXLENGTH="255" value="${aluno.matricula}" required>
            </div>

            <!-- TELEFONE -->
            <div class="form-group">
                <label for="telefone" class="col-form-label obrigatorio">Telefone</label>
                <input type="number" class="form-control" name="telefone" autofocus MAXLENGTH="255" value="${aluno.telefone}" required>
            </div>

            <!-- EMAIL -->
            <div class="form-group">
                <label for="email" class="col-form-label obrigatorio">Email</label>
                <input type="text" class="form-control" name="email" autofocus MAXLENGTH="255" value="${aluno.email}" required>
            </div>

            <!-- STATUS -->
            <div class="form-group">
                <label for="status" class="form-label obrigatorio mt-4">Status</label>
                <select class="form-select" id="status" name="status">
                    <option value="" disabled selected>Selecione status</option>
                    <option value="ativo">Ativo</option>
                    <option value="inativo">Inativo</option>
                </select>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary btn-lg">
                    <i class="bi bi-arrow-clockwise"></i>
                    Atualizar
                </button>
                <a href="<c:url value='/curso/lista' />" class="btn btn-secondary btn-lg">
                    <i class="bi bi-x"></i>
                    Cancelar
                </a>
            </div>

        </form>
    </div>
</main>

<c:import url="../componentes/rodape.jsp" />

</body>
</html>
