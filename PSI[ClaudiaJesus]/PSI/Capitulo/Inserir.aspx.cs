using System;
using System.Configuration;
using MySql.Data.MySqlClient;

public partial class Capitulo_InserirCap: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //botão Gravar
    protected void bt_Gravar(object sender, EventArgs e)
    {
        //Ligação à BD efetuada através de uma ConnectionString
        string strConn_Access = ConfigurationManager.ConnectionStrings["ConnectionString_Listar"].ConnectionString;
        
        MySqlConnection MyConn = new MySqlConnection(strConn_Access);

        //Comando em MySQl para inserir dados na BD
        string sqlString = "INSERT INTO capitulo " +
                "(Nome, Descricao) " +
                "VALUES (@Nome, @Descricao);";

        //indica a connectionstring e o comando a serem realizados
        MySqlCommand Cmd = new MySqlCommand(sqlString, MyConn);

        //Campos a serem inseridos na BD
        Cmd.Parameters.AddWithValue("@Nome", txt_Nome.Text);
        Cmd.Parameters.AddWithValue("@Descricao", txt_Descricao.Text);

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
    }

    //botão Limpar
    protected void bt_Limpar(object sender, EventArgs e)
    {
        //todos as textbox vão ser limpas / deixadas vazias
        txt_Nome.Text = "";
        txt_Descricao.Text = "";
        lbl_erro.Visible = false;
    }
}