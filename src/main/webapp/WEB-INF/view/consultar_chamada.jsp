<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <form action="consultar_chamada" method="post">
        <div>
            <label for="cursos">Curso:</label>
            <select name="cursos" id="cursos">
                <option value="ADS">ADS</option>
                <option value="COMEX">COMEX</option>
<%--                TODO: função com java--%>
            </select>
            <label for="disciplinas">Disciplina:</label>
            <select name="disciplinas" id="disciplinas">
                <option value="Banco de dados">Banco de Dados</option>
                <option value="seila">seila</option>
                //TODO: função com java
            </select>
        </div>
        <div class="tabela_container">
            <table>
                <thead>
                    <th>Data</th>
                    <th>Semestre</th>
                    <th>Ação</th>
                </thead>
                <tbody>
<%--                    <c:if test="${not empty listaChamadas}">--%>
<%--                        <c:forEach var="chamada" items="${listaChamadas}">--%>
<%--                            //TODO função em java--%>
<%--                        </c:forEach>--%>
<%--                    </c:if>--%>
                </tbody>
            </table>
        </div>
        <div>
            <a class="btn" href="area_professor">Voltar</a>
            <a class="btn" href="manter_chamada">Adicionar Chamada</a>
        </div>

        </form>
    </main>

</body>
</html>
