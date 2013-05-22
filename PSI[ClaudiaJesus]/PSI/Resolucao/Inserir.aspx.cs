using System;
using System.Configuration;
using MySql.Data.MySqlClient;

public partial class Resolucao_Inserir : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void bt_Inserir(object sender, EventArgs e)
    {
        string strConn_Access = ConfigurationManager.ConnectionStrings["ConnectionString_Listar"].ConnectionString;

        MySqlConnection MyConn = new MySqlConnection(strConn_Access);


        string sqlString = "INSERT INTO resolucoes " +
                "(Id_Pergunta, Id_Linguagem, Resolucao) " +
                "VALUES (@Id_Pergunta, @Id_Linguagem, @Resolucao);";

 
        MySqlCommand Cmd = new MySqlCommand(sqlString, MyConn);

        Cmd.Parameters.AddWithValue("@Id_Pergunta", Drop_PerguntaId.Text);
        Cmd.Parameters.AddWithValue("@Id_Linguagem", Drop_LinguagemId.Text);
        Cmd.Parameters.AddWithValue("@Resolucao", Editor.Content);

        try
        {
            MyConn.Open();

            Cmd.ExecuteNonQuery();

            MyConn.Close();

            lbl_erro.Text = "Dados introduzidos com sucesso!";
            lbl_erro.Visible = true;
            
        }
        catch (Exception ex)
        {
            lbl_erro.Text = "Houve um erro na introdução dos dados - " + ex.Message;
            lbl_erro.Visible = true;
        }
    }
    protected void bt_Limpar(object sender, EventArgs e)
    {
        lbl_erro.Visible = false;
    }
}
