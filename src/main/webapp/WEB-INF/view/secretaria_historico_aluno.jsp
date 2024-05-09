<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Histórico Alunos</title>
    <link rel="stylesheet" type="text/css" href='<c:url value = "./resources/css/style.css"/>' />
</head>

<body>
    <div>
        <jsp:include page="menu.jsp"/>
    </div>

    <main>
        <h1>Histórico Aluno</h1>
        <br>
        <form action="historico" method="post">
            <div>
                <label for="buscar">RA</label>
                <input type="number" name="buscar" id="buscar">
                <input type="submit" name="botao" value="Buscar">
            </div>
            <div>
                <table>
                    <thead>
                        <th>RA</th>
                        <th>NOME</th>
                        <th>NOME CURSO</th>
                        <th>DATA 1ª MATRICULA</th>
                        <th>PONTUAÇÃO VESTUBULAR</th>
                        <th>POSIÇÃO VESTUBULAR</th>
                    </thead>
                    <tbody>
                        <tr>
                            <td>202411234</td>
                            <td>placelholder</td>
                            <td>Analise e Desenvolvimento de Sistemas</td>
                            <td>2024/1</td>
                            <td>90</td>
                            <td>3</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <br>
            <br>

            <!-- DISCIPLINAS -->
            <h3>Disciplinas Aprovadas</h3>
            <div class="tabela_container">
                <table>
                    <thead>
                        <th>CÓDIGO DISCIPLINA</th>
                        <th>NOME DISCIPLINA</th>
                        <th>PROFESSOR</th>
                        <th>NOTA FINAL</th>
                        <th>FALTAS</th>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1001</td>
                            <td>Banco de Dados</td>
                            <td>Colevati</td>
                            <td>10.0</td>
                            <td>8</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </form>
    </main>

</body>

</html>