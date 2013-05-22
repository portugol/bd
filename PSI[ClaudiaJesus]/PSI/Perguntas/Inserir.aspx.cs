using System;
using System.Configuration;
using MySql.Data.MySqlClient;

public partial class Perguntas_Inserir : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void bt_Inserir(object sender, EventArgs e)
    {
        string strConn_Access = ConfigurationManager.ConnectionStrings["ConnectionString_Listar"].ConnectionString;

        MySqlConnection MyConn = new MySqlConnection(strConn_Access);


        string sqlString = "INSERT INTO perguntas " +
                "(Pergunta, Dificuldade, CapituloId, TipoPg) " +
                "VALUES (@Pergunta, @Dificuldade, @CapituloId, @TipoPg);";

 
        MySqlCommand Cmd = new MySqlCommand(sqlString, MyConn);

        Cmd.Parameters.AddWithValue("@Pergunta", Editor.Content);
        Cmd.Parameters.AddWithValue("@Dificuldade", txt_Dificuldade.Text);
        Cmd.Parameters.AddWithValue("@CapituloId", Drop_Capitulo.Text);
        Cmd.Parameters.AddWithValue("@TipoPg", Drop_Tipo.Text);

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
        txt_Dificuldade.Text = "";
        lbl_erro.Visible = false;
    }
}
