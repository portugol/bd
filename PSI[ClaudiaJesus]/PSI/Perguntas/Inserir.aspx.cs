using System;
using System.Configuration;
using MySql.Data.MySqlClient;

public partial class Perguntas_Inserir : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
    //botão Limpar
    protected void bt_Limpar(object sender, EventArgs e)
    {
        //todos as textbox e dropdownlist vão ser limpas / deixadas vazias
        Drop_Capitulo.SelectedValue = "0";
        Drop_Tipo.SelectedValue = "0";
        txt_Dificuldade.Text = "";
        lbl_erro.Visible = false;
        Editor.Content = "";
    }

    //botão para efetuar a gravação da pergunta e prosseguir para a página de inserção da solução correspondente à mesma
    protected void bt_Solucao(object sender, EventArgs e)
    {
        //Ligação à BD efetuada através de uma ConnectionString
        string strConn_Access = ConfigurationManager.ConnectionStrings["ConnectionString_Listar"].ConnectionString;

        MySqlConnection MyConn = new MySqlConnection(strConn_Access);

        //Comando em MySQl para inserir dados na BD
        string sqlString = "INSERT INTO perguntas " +
                "(Pergunta, Dificuldade, CapituloId, TipoPg) " +
                "VALUES (@Pergunta, @Dificuldade, @CapituloId, @TipoPg);";

        //indica a connectionstring e o comando a serem realizados
        MySqlCommand Cmd = new MySqlCommand(sqlString, MyConn);

        //Campos a serem inseridos na BD
        Cmd.Parameters.AddWithValue("@Pergunta", Editor.Content);
        Cmd.Parameters.AddWithValue("@Dificuldade", txt_Dificuldade.Text);
        Cmd.Parameters.AddWithValue("@CapituloId", Drop_Capitulo.Text);
        Cmd.Parameters.AddWithValue("@TipoPg", Drop_Tipo.Text);

        try
        {
            //Conexão efetuada
            MyConn.Open();

            //É efetuado o comando em MySQL e inserido os dados 
            Cmd.ExecuteNonQuery();

            //Conexão fechada
            MyConn.Close();

            //Após os dados inseridos na BD, é redirecionado 
            Response.Redirect("~/Solucao/Listar.aspx");

        }
        catch (Exception ex)
        {
            //no caso dos campos não estarem bem preenchidos é mostrada esta mensagem de erro
            lbl_erro.Text = "Houve um erro na introdução dos dados";
            lbl_erro.Visible = true;
        }
    }
}
