<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    
    <title>Webadvice</title>
    <link rel="stylesheet" href="java.css"> <!-- Link para um CSS externo-->
   
</head>

<body>
    <div class="container">
<%
    //cria as variaveis e armazena as informações digitadas pelo usuário
    String vnome  = request.getParameter("txtNome") ;
    String vemail = request.getParameter("txtEmail");
    int    vnumero = Integer.parseInt( request.getParameter("txtNumero") );
    String vservico = request.getParameter("txtServico"); 


    //variaveis para acessar o banco de dados
    String database = "webadvice"; 
    String endereco = "jdbc:mysql://localhost:3306/" + database ; 
    String usuario  = "root"; 
    String senha    = "";


    //Driver 
    String driver = "com.mysql.jdbc.Driver" ;


    //Carrega o driver na memoria
    Class.forName( driver ) ;


    //Cria a variavel para conectar com o banco
    Connection conexao ;


   //Abrir a conexao com o banco
   conexao = DriverManager.getConnection( endereco , usuario, senha) ;


   //Varival para o comando Insert do SQL
   String sql = "INSERT INTO cadastros (nome, email, numero, servico) values (?, ?, ?, ?)" ;


   //Cria a variavel Statement para executar o SQL
   PreparedStatement stm = conexao.prepareStatement(sql) ;
   stm.setString( 1 , vnome ) ;
   stm.setString( 2 , vemail ) ;
   stm.setInt( 3 , vnumero ) ;
   stm.setString( 4 , vservico ) ;


   stm.execute() ;
   stm.close() ;
 %>
    <h3>Dados gravados com sucesso!</h3>
        <p><strong>Nome:</strong> <%= vnome %></p>
        <p><strong>Email:</strong> <%= vemail %></p>
        <p><strong>Número:</strong> <%= vnumero %></p>
        <p><strong>Serviço:</strong> <%= vservico %></p>
        <br>
        <a href="inicial.html">Voltar para a página inicial</a>

</div>
</body>
</html>

