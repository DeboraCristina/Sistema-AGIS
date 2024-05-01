<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Área do Professor</title>
    <link rel="stylesheet" type="text/css" href='<c:url value = "./resources/css/style.css"/>' />
    <title>Consultar Chamada</title>
</head>
<body>
    <div>
        <jsp:include page="menu.jsp"/>
    </div>
    <main>
        <h1>Chamadas</h1>
        <form id="chamada" action="consultar_chamada" method="post">
        <div>
            <label for="curso">Curso:</label>
            <select name="curso" id="curso">
                <option value="" disabled selected hidden>Selecione uma opção...</option>
                <c:if test="${not empty cursos}">
                    <c:forEach var="c" items="${cursos}">
                        <option value="${c.codigo}">${c.nome}</option>
                    </c:forEach>
                </c:if>
            </select>
            <label for="disciplina">Disciplina:</label>
            <select name="disciplina" id="disciplina">
                <option value="" disabled selected hidden>Selecione uma opção...</option>
                <c:if test="${not empty disciplinas}">
                    <c:forEach var="d" items="${disciplinas}">
                        <option value="${d.codigo}">${d.nome}</option>
                    </c:forEach>
                </c:if>
            </select>
        </div>
        <div align="center">
            <c:if test="${not empty saida}">
                <h3><b><c:out value="${saida}"/></b></h3>
            </c:if>
            <c:if test="${not empty erro}">
                <h3><b><c:out value="${erro}"/></b></h3>
            </c:if>
        </div>
        <div class="tabela_container">
            <table>
                <thead>
                    <th>Data</th>
                    <th>Semestre</th>
                    <th>Ação</th>
                </thead>
                <tbody>
                    <c:if test="${not empty presencas}">
                        <c:forEach var="p" items="${presencas}">
                            <td><c:out value="${p.data}" /> </td>
                            <td><c:out value="${p.semestre}"/> </td>
                        </c:forEach>
                    </c:if>
                </tbody>
            </table>
        </div>
        <div>
            <a class="btn" href="area_professor">Voltar</a>
            <input type="submit" class="btn" value="Adicionar Chamada" name="botao">
<%--            <label for="periodo">Período:</label>--%>
<%--            <select name="cursos" id="periodo">--%>
<%--                <option value="1º">1º</option>--%>
<%--                <option value="2º">2º</option>--%>
<%--                <option value="3º">3º</option>--%>
<%--                <option value="4º">4º</option>--%>
<%--                <option value="5º">5º</option>--%>
<%--                <option value="6º">6º</option>--%>
<%--            </select>--%>
        </div>

        </form>
        <script>
            // Adicionando um event listener para detectar a mudança de seleção
            document.getElementById("curso").addEventListener("change", function() {
                // Enviar o formulário quando uma opção for selecionada
                document.getElementById("chamada").submit();
            });
        </script>
        <script>
            // Adicionando um event listener para detectar a mudança de seleção
            document.getElementById("disciplina").addEventListener("change", function() {
                // Enviar o formulário quando uma opção for selecionada
                document.getElementById("chamada").submit();
            });
        </script>
    </main>

</body>
</html>
