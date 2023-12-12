<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
    <title>Cadastrar Atendimento</title>
    <c:import url="../componentes/cabecalho.jsp" />
</head>
<body>

<div class="p-5 mb-4 bg-light rounded-3">
    <div class="container py-5">
        <h1 class="display-5 fw-bold">Cadastrar Atendimento</h1>
        <p class="col-md-12 fs-4">Preencha o formulário abaixo para realizar o cadastro do atendimento no sistema.</p>
    </div>
</div>

<main>
    <div class="container">
        <form action="adiciona" method="POST" class="row g-3">

            <security:csrfInput />
            
            <!-- DATA -->
            <div class="form-group col-md-6">
                <label for="data" class="col-form-label obrigatorio">Data</label>
                <input type="date" class="form-control" name="data" value="${atendimento.data}" required>
            </div>
            
            <!-- HORA -->
            <div class="form-group col-md-6">
                <label for="hora" class="col-form-label obrigatorio">Hora</label>
                <input type="time" class="form-control" name="hora" value="${atendimento.hora}" required>
            </div>

            <!-- DESCRIÇÃO -->
            <div class="form-group">
                <label for="descricao" class="col-form-label obrigatorio">Descrição</label>
                <input type="text" class="form-control" name="descricao" autofocus MAXLENGTH="255" required>
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

</body>
</html>
