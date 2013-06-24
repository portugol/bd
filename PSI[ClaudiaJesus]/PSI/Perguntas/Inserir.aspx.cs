using System;
using System.Configuration;
using MySql.Data.MySqlClient;

public partial class Perguntas_Inserir : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
    //bot�o Limpar
    protected void bt_Limpar(object sender, EventArgs e)
    {
        //todos as textbox e dropdownlist v�o ser limpas / deixadas vazias
        Drop_Capitulo.SelectedValue = "0";
        Drop_Tipo.SelectedValue = "0";
        txt_Dificuldade.Text = "";
        lbl_erro.Visible = false;
        Editor.Content = "";
    }

    //bot�o para efetuar a grava��o da pergunta e prosseguir para a p�gina de inser��o da solu��o correspondente � mesma
    protected void bt_Solucao(object sender, EventArgs e)
    {
        //Liga��o � BD efetuada atrav�s de uma ConnectionString
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
            //Conex�o efetuada
            MyConn.Open();

            //� efetuado o comando em MySQL e inserido os dados 
            Cmd.ExecuteNonQuery();

            //Conex�o fechada
            MyConn.Close();

            //Ap�s os dados inseridos na BD, � redirecionado 
            Response.Redirect("~/Solucao/Listar.aspx");

        }
        catch (Exception ex)
        {
            //no caso dos campos n�o estarem bem preenchidos � mostrada esta mensagem de erro
            lbl_erro.Text = "Houve um erro na introdu��o dos dados";
            lbl_erro.Visible = true;
        }
    }
}
