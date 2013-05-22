using System;
using System.Configuration;
using MySql.Data.MySqlClient;

public partial class Solucao_Inserir : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void bt_Inserir(object sender, EventArgs e)
    {
        string strConn_Access = ConfigurationManager.ConnectionStrings["ConnectionString_Listar"].ConnectionString;
        
        MySqlConnection MyConn = new MySqlConnection(strConn_Access);

        string sqlString = "INSERT INTO solucao " +
                "(Entradas, Saidas, PerguntasId) " +
                "VALUES (@Entradas, @Saidas, @PerguntasId);";
  
        MySqlCommand Cmd = new MySqlCommand(sqlString, MyConn);

        Cmd.Parameters.AddWithValue("@Entradas", txt_entradas.Text);
        Cmd.Parameters.AddWithValue("@Saidas", txt_saidas.Text);
        Cmd.Parameters.AddWithValue("@PerguntasId", Drop_Perguntaid.Text);

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
        txt_entradas.Text = "";
        txt_saidas.Text = "";
        lbl_erro.Visible = false;
    }
}
