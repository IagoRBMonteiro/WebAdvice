<%@page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title></title>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="inicial.css">
    </head>

    <body>
        <header>
        <div id="title">
            <h1>Projeto </h1>
            <h2>WebAdvice</h2>
        </div>
        <ul>
            <a href="inicial.html" id="id"><li>Voltar a Página Inicial</li></a>
        </ul>
        </header>

        <main>
        <aside>
            <h2>Página de</h2>
            <h2><span>Consulta de Dados</span></h2>
        </aside>
        </main>

        <%
            //variavel para acessar o banco de dados
            String database   = "webadvice" ;
            String enderecoBD = "jdbc:mysql://localhost:3306/" + database ;
            String usuarioBD  = "root" ;
            String senhaBD    = "" ;

            //Driver
            String driver = "com.mysql.jdbc.Driver" ;

            //Carregar o driver na memoria
            Class.forName( driver ) ;

            //Cria uma variavel para conexao com o banco de dados
            Connection conexao;

            //Abrir a conexao com o banco
            conexao = DriverManager.getConnection( enderecoBD, usuarioBD , senhaBD ) ;

            //comando para consultar no banco
            String sql = "SELECT * FROM cadastros" ;

            //cria a variavel do tipo Statement
            PreparedStatement stm = conexao.prepareStatement( sql );

            //cria a variavel do tipo ResultSet
            //para armazenar os dados que estão banco
            ResultSet dados  = stm.executeQuery() ;

            out.print("<table border=1>") ;

            while ( dados.next() )
            {
                out.print("<tr>") ;
                    out.print("<td>") ;
                        out.print( dados.getString("ID") ) ;
                    out.print("</td>") ;

                    out.print("<td>") ;
                        out.print( dados.getString("nome") ) ;                    
                    out.print("</td>") ;

                    out.print("<td>") ;
                        out.print( dados.getString("email") ) ;
                    out.print("</td>") ;

                    out.print("<td>") ;
                        out.print( dados.getString("numero") ) ;
                    out.print("</td>") ;

                    out.print("<td>") ;
                        out.print( dados.getString("servico") ) ;
                    out.print("</td>") ;

                    out.print("<td>") ;
                        out.print( dados.getString("status") ) ;
                    out.print("</td>") ;  

                out.print("</tr>") ;
            }

            out.print("</table>") ;

            
        %>
    </body>
</html>