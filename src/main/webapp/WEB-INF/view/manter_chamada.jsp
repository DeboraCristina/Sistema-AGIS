<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Área do Professor</title>
    <link rel="stylesheet" type="text/css" href='<c:url value = "./resources/css/style.css"/>' />
    <title>Manter Chamada</title>
</head>
<body>
    <div>
        <jsp:include page="menu.jsp"/>
    </div>
    <main>
        <h1>Manter Chamada</h1>
        <form action="manter_chamada" method="post" >
            <div>
                <table>
                    <thead>
                        <th>Aluno</th>
                        <th>14:50</th>
                        <th>16:00</th>
                        <th>17:00</th>
                        <th>18:00</th>
                    </thead>
                    <tbody>
<%--                        TODO: função java--%>
                    </tbody>
                </table>
            </div>
            <div>
                <a class="btn" href="consultar_chamada">Voltar</a>
                <a class="btn" href="consultar_chamada">Atualizar/Adicionar Chamada</a>
            </div>

        </form>
    </main>

</body>
</html>
