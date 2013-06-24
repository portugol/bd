using System;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Collections;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.IO;



public partial class Teste : System.Web.UI.Page
{
    public string data;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private string novadatafim()
    {
        //Ligação à BD efetuada através de uma ConnectionString
        string strConn_Access = ConfigurationManager.ConnectionStrings["ConnectionString_Listar"].ConnectionString;

        MySqlConnection MyConn = new MySqlConnection(strConn_Access);

        // comando SQL 
        string sqlString = "Select Data_Fim from tipo_teste  WHERE Id = @Data;";

        //indica a connectionstring e o comando a serem realizados
        MySqlCommand Cmd = new MySqlCommand(sqlString, MyConn);

        // guarda o id da descricao (string) e converte-o em inteiro
        Int32 numero = (Convert.ToInt32(lbl_idDescricao.Text));

        //Campos a serem inseridos na BD
        Cmd.Parameters.AddWithValue("@Data", numero);

        try
        {
            //abre a conexao
            MyConn.Open();

            //executa o comando SQL
            data = (Cmd.ExecuteScalar().ToString());

        }
        catch (Exception ex)
        {

        }
        finally
        {
            // fecha a conexao
            MyConn.Close();
        }
        //tira os caracteres a mais 00:00:00
        return data.Substring(0, 10);      
    }

    private string novadata()
    {
        //Ligação à BD efetuada através de uma ConnectionString
        string strConn_Access = ConfigurationManager.ConnectionStrings["ConnectionString_Listar"].ConnectionString;

        MySqlConnection MyConn = new MySqlConnection(strConn_Access);

        string sqlString = "Select Data_Inicio from tipo_teste  WHERE Id = @Data;";

        //indica a connectionstring e o comando a serem realizados
        MySqlCommand Cmd = new MySqlCommand(sqlString, MyConn);

        Int32 numero = (Convert.ToInt32(lbl_idDescricao.Text));

        //Campos a serem inseridos na BD
        Cmd.Parameters.AddWithValue("@Data", numero);

        try
        {
            // abre a conexao
            MyConn.Open();

            //executa o comando SQL
            data = (Cmd.ExecuteScalar().ToString());
        }
        catch (Exception ex)
        {

        }
        finally
        {
            // fecha a conexao
            MyConn.Close();
        }
        //tira os caracteres a mais 00:00:00
        return data.Substring(0, 10);  
    }

    protected void bt_GeraTeste_Click(object sender, EventArgs e)
    {
        for (int j=0; j < Convert.ToInt32(txt_Numtestes.Text); j++)
        {
            //Ligação à BD efetuada através de uma ConnectionString
            string strConn_Access = ConfigurationManager.ConnectionStrings["ConnectionString_Listar"].ConnectionString;

            MySqlConnection MyConn = new MySqlConnection(strConn_Access);

            //indica a connectionstring e o comando a serem realizados
            MySqlCommand Cmd = new MySqlCommand(strConn_Access, MyConn);

            // fazemos um comando SQL em que ficamos com a soma (sum) do numero de perguntas de um determinado tipo de teste
            MySqlCommand sqlCommand = new MySqlCommand("SELECT Sum(Num_Perguntas),Capitulo,Dificuldade FROM enunciados  where Id_Tipoteste="+ Drop_Descricao.SelectedItem.Value + " group by Capitulo,Dificuldade",MyConn);

            // criamos um arraylist de capitulos
            ArrayList arrayListCap = new ArrayList(); 
            
            // criamos um arraylist de dificuldade
            ArrayList arrayListDif = new ArrayList();
            
            // criamos um arraylist da soma
            ArrayList arrayListSoma = new ArrayList();
            try
            {
                // abrir a conexão
                MyConn.Open(); 

                // criamos um reader que vai executar o comando SQL e fica com o resultado da consulta
                MySqlDataReader reader = sqlCommand.ExecuteReader();

                // enquanto houver registos na consulta são preenchidos os ArrayList
                while (reader.Read()) 
                {
                    // preenchimeto dos arraylist em o 0 - é a 1 coluna (soma do numero de perguntas), 1 - a 2 coluna (capitulos) e o 2 - a 3 coluna (dificuldade)
                    arrayListSoma.Add(reader[0]);
                    arrayListCap.Add(reader[1]);
                    arrayListDif.Add(reader[2]);

                }
                // fecho o reader (consulta)
                reader.Close(); 

                // crio uma string a ir buscar o caminho do ficheiro html 
                string html = Server.MapPath(Request.ApplicationPath) + "\\Teste.HTML";

                // crio uma stream para escrever no ficheiro html
                System.IO.StreamWriter file = new System.IO.StreamWriter(html);

                // indico o caminho onde vou guardar os pdfs e indico tambem o nome do pdf, em que o i é o numero do teste ex: teste0,teste1, ....
                string pdf = Server.MapPath(Request.ApplicationPath) + "\\Teste" + j + ".Pdf";

                // numero da pergunta
                int n = 1; 

                // escrevo 2 linhas em branco no html
                file.WriteLine(Editor.Content + "<br /><br />"); 

                // enquanto houver registos na Arraylist
                for (int i = 0; i < arrayListDif.Count; i++) 
                {

                    // crio uma nova consulta de SQL em que seleciono n perguntas aleatorias (Rand()) de um determinado capitulo com uma determinada dificuldade
                    sqlCommand = new MySqlCommand("SELECT perguntas.Pergunta FROM perguntas, enunciados WHERE perguntas.Dificuldade = " +
                    arrayListDif[i] + " AND perguntas.CapituloId = " + arrayListCap[i] + " order by Rand()  LIMIT " + Convert.ToInt32(arrayListSoma[i]), MyConn);

                    // criamos um reader que vai executar o comando SQL e fica com o resultado da consulta
                    reader = sqlCommand.ExecuteReader();

                    // escrevo o grupo da pergunta no ficheiro html
                    file.WriteLine("Grupo " + (i + 1) + "<br />"); 
                    
                    // escrevo no ficheiro html
                    file.WriteLine("___________________________________________________________ <br />"); 
                    
                    // escrevo no ficheiro html uma linha em branco
                    file.WriteLine("<br />");
                    
                    // enquanto houver registos na consulta são guardadas as perguntas
                    while (reader.Read()) 
                    {
                        // escrevo o numero da pergunta e a pergunta que foi selecionada pela consulta SQL
                        file.Write(n + " - " + reader[0]); 
                        n++;
                    }

                    // escrevo 2 linhas em branco no ficheiro html
                    file.WriteLine("<br /><br /><br />"); 
                    
                    // fecho o reader 
                    reader.Close(); 
                }

                // fecho  o ficheiro html
                file.Close(); 
                
                // crio um novo Document com um tipo de pagina (A4) e com as margens
                Document doc = new Document(PageSize.A4, 80, 50, 30, 65); 
                
                // crio uma Stream com o caminho e o nome do teste (pdf) e digo que está no modo de criação de pdfs
                var output = new FileStream(pdf,FileMode.Create);
                
                // indico o documento e a stream onde vou escrever
                PdfWriter.GetInstance(doc, output); 
                
                // abro o documento
                doc.Open();
                
                // crio uma string 
                string contents = ""; 
                
                // crio uma stream de leitura
                StreamReader sr; 
                
                // abro o ficheiro html
                sr = File.OpenText(html); 
                
                // vou ler do ficheiro html e guardar na String que criei
                contents = sr.ReadToEnd(); 
                
                // fecho a stream de leitura
                sr.Close();
                // crio o pdf com o conteudo da string

                var parsedHtmlElements = HTMLWorker.ParseToList(new StringReader(contents), null);  
                
                //enquanto houver elementos do html "passo" pa pdfs
                foreach (var htmlElement in parsedHtmlElements) 
                doc.Add(htmlElement as IElement);
                // para cada elemento(linha) da string adiciono ao pdf a mesma linha

                //Fecha o PDF
                doc.Close();
            }
            catch (Exception ex)
            {

            }
            finally { 
                //conexão fechada
                MyConn.Close();
            }
        }
    }

    protected void Drop_Descricao_SelectedIndexChanged(object sender, EventArgs e)
    {
        lbl_idDescricao.Text = Drop_Descricao.SelectedItem.Value;
        Int32 idtipo = Int32.Parse(lbl_idDescricao.Text);

        //label mostra a data de inicio do teste
        lbl_DataInicio.Text = novadata();

        //label mostra a data de fim do teste
        lbl_DataFim.Text = novadatafim();

        //Ligação à BD efetuada através de uma ConnectionString
        string strConn_Access = ConfigurationManager.ConnectionStrings["ConnectionString_Listar"].ConnectionString;

        MySqlConnection MyConn = new MySqlConnection(strConn_Access);


        string sqlString = "SELECT * FROM enunciados WHERE Id_Tipoteste = " + lbl_idDescricao.Text;

        //altera o sqldatasource com o comando indicado anteriormente
        SqlDataSource_Enunciado.SelectCommand = sqlString;

        //indica a connectionstring e o comando a serem realizados
        MySqlCommand Cmd = new MySqlCommand(sqlString, MyConn);

        //GridView torna-se visivel
        Grdv_Enunciado.Visible = true;

        try
        {
            //conexão efetuada
            MyConn.Open();

            //É efetuado o comando em MySQL e inserido os dados 
            Cmd.ExecuteNonQuery();

            //conexão fechada
            MyConn.Close();

            //atualiza a GridView após inserção correta dos dados na BD
            Grdv_Enunciado.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    protected void Drop_Capitulo_SelectedIndexChanged(object sender, EventArgs e)
    {
        //a label toma o valor selecionado da dropdownlist
        lbl_cap.Text = Drop_Capitulo.SelectedItem.Value;
    }

    protected void Drop_Dificuldade_SelectedIndexChanged(object sender, EventArgs e)
    {
        //a label toma o valor selecionado da dropdownlist
        lbl_dif.Text = Drop_Dificuldade.SelectedItem.Value;
    }

    //botão Adicionar / Gravar
    protected void bt_Adicionar_Click(object sender, EventArgs e)
    {
        //Ligação à BD efetuada através de uma ConnectionString
        string strConn_Access = ConfigurationManager.ConnectionStrings["ConnectionString_Listar"].ConnectionString;

        MySqlConnection MyConn = new MySqlConnection(strConn_Access);

        //Comando em MySQl para inserir dados na BD
        string sqlString = "INSERT INTO enunciados " +
                "(Capitulo, Dificuldade, Num_Perguntas, Id_Tipoteste) " +
                "VALUES (@Capitulo, @Dificuldade, @Num_Perguntas, @Id_Tipoteste);";

        //indica a connectionstring e o comando a serem realizados
        MySqlCommand Cmd = new MySqlCommand(sqlString, MyConn);

        //Campos a serem inseridos na BD
        Cmd.Parameters.AddWithValue("@Capitulo", lbl_cap.Text);
        Cmd.Parameters.AddWithValue("@Dificuldade", lbl_dif.Text);
        Cmd.Parameters.AddWithValue("@Num_Perguntas", txt_nperg.Text);
        Cmd.Parameters.AddWithValue("@Id_Tipoteste", lbl_idDescricao.Text);

        try
        {
            //Conexão efetuada
            MyConn.Open();

            //É efetuado o comando em MySQL e inserido os dados
            Cmd.ExecuteNonQuery();

            //Conexão fechada
            MyConn.Close();

            //no caso dos campos estarem bem preenchidos irá aparecer a seguinte mensagem
            lbl_erro.Text = "Dados introduzidos com sucesso!";
            lbl_erro.Visible = true;

        }
        catch (Exception ex)
        {
            //no caso dos campos não estarem bem preenchidos é mostrada esta mensagem de erro
            lbl_erro.Text = "Houve um erro na introdução dos dados";
            lbl_erro.Visible = true;
        }

        string sqlString2 = "SELECT * FROM enunciados WHERE Id_Tipoteste = " + lbl_idDescricao.Text;

        //altera o sqldatasource com o comando indicado anteriormente
        SqlDataSource_Enunciado.SelectCommand = sqlString2;

        //indica a connectionstring e o comando a serem realizados
        Cmd = new MySqlCommand(sqlString2, MyConn);

        //a GrtidView torna-se visivel
        Grdv_Enunciado.Visible = true;

        try
        {
            //conexão efetuada
            MyConn.Open();

            Cmd.ExecuteNonQuery();

            //conexão fechada
            MyConn.Close();

            //gridview atualizada após inserção de novos dados corretamente
            Grdv_Enunciado.DataBind();
        }
        catch (Exception ex)
        {

        }

        //todos as textbox e dropdownlist vão ser limpas / deixadas vazias
        Drop_Capitulo.SelectedValue = "0";
        Drop_Dificuldade.SelectedValue = "0";
        txt_nperg.Text = " ";
        Editor.Content = "";
    }

}