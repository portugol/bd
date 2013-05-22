using System;
using System.Configuration;
using MySql.Data.MySqlClient;

public partial class TipoTeste_Inserir: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void bt_Inserir(object sender, EventArgs e)
    {
        string strConn_Access = ConfigurationManager.ConnectionStrings["ConnectionString_Listar"].ConnectionString;
        
        MySqlConnection MyConn = new MySqlConnection(strConn_Access);

        string sqlString = "INSERT INTO tipo_teste " +
                "(Data_Inicio, Data_Fim, Duracao, Descricao, Max_Perguntas) " +
                "VALUES (@Data_Inicio, @Data_Fim, @Duracao, @Descricao, @Max_Perguntas);";


        MySqlCommand Cmd = new MySqlCommand(sqlString, MyConn);

        Cmd.Parameters.AddWithValue("@Data_Inicio", txt_DataInicio.Text);
        Cmd.Parameters.AddWithValue("@Data_Fim", txt_DataFim.Text);
        Cmd.Parameters.AddWithValue("@Duracao", txt_Duracao.Text);
        Cmd.Parameters.AddWithValue("@Descricao", txt_Descricao.Text);
        Cmd.Parameters.AddWithValue("@Max_Perguntas", txt_MaxPerguntas.Text);
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
            lbl_erro.Text = "Houve um erro na introdu��o dos dados - " + ex.Message;
            lbl_erro.Visible = true;
        }

    }
    protected void bt_Limpar(object sender, EventArgs e)
    {
        txt_DataInicio.Text = "";
        txt_DataFim.Text = "";
        txt_Duracao.Text = "";
        txt_Descricao.Text = "";
        txt_MaxPerguntas.Text = "";
        lbl_erro.Visible = false;
    }
}