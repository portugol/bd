using System;
using System.Configuration;
using MySql.Data.MySqlClient;

public partial class TipoUser_Inserir : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //bot�o Gravar
    protected void bt_Gravar(object sender, EventArgs e)
    {
        //Liga��o � BD efetuada atrav�s de uma ConnectionString
        string strConn_Access = ConfigurationManager.ConnectionStrings["ConnectionString_Listar"].ConnectionString;

        MySqlConnection MyConn = new MySqlConnection(strConn_Access);

        //Comando em MySQl para inserir dados na BD
        string sqlString = "INSERT INTO Tipo_User " +
                "(Tipo) " +
                "VALUES (@Tipo);";

        //indica a connectionstring e o comando a serem realizados
        MySqlCommand Cmd = new MySqlCommand(sqlString, MyConn);

        //Campos a serem inseridos na BD
        Cmd.Parameters.AddWithValue("@Tipo", txt_Tipo.Text);

        try
        {
            //Conex�o efetuada
            MyConn.Open();

            //� efetuado o comando em MySQL e inserido os dados
            Cmd.ExecuteNonQuery();

            //Conex�o fechada
            MyConn.Close();

            //no caso dos campos estarem bem preenchidos ir� aparecer a seguinte mensagem
            lbl_erro.Text = "Dados introduzidos com sucesso!";
            lbl_erro.Visible = true;
            
        }
        catch (Exception ex)
        {
            //no caso dos campos n�o estarem bem preenchidos � mostrada esta mensagem de erro
            lbl_erro.Text = "Houve um erro na introdu��o dos dados";
            lbl_erro.Visible = true;
        }
    }

    //bot�o Limpar
    protected void bt_Limpar(object sender, EventArgs e)
    {
        //todos as textbox v�o ser limpas / deixadas vazias
        txt_Tipo.Text = "";
        lbl_erro.Visible = false;
    }
}
