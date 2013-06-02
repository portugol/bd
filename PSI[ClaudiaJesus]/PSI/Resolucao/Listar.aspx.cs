using System;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;
using System.Web.UI;

public partial class Resolucao_Listar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void Drop_IdPergunta_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow gvr = (GridViewRow)(((Control)sender).NamingContainer);
        DropDownList Drop_IdPergunta = (DropDownList)gvr.FindControl("Drop_IdPergunta");
        lbl.Text = Drop_IdPergunta.SelectedItem.Value;
    }
    
    protected void Drop_IdLinguagem_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow gvr = (GridViewRow)(((Control)sender).NamingContainer);
        DropDownList Drop_IdLinguagem = (DropDownList)gvr.FindControl("Drop_IdLinguagem");
        lbl2.Text = Drop_IdLinguagem.SelectedItem.Value;
    }


    protected void SqlDataSource_IdPL(object sender, SqlDataSourceCommandEventArgs e)
    {
        e.Command.Parameters["@idPerg"].Value = lbl.Text;
        e.Command.Parameters["@idLinguagem"].Value = lbl2.Text;        
    }

    protected void bt_Adicionar_Click(object sender, EventArgs e)
    {
        lbl_PgId.Visible = true;
        lbl_Pergunta.Visible = true;
        lbl_Resolucao.Visible = true;
        Editor.Visible = true;
        lbl_LinguagemId.Visible = true;
        Drop_LinguagemId.Visible = true;
        Bt_Gravar.Visible = true;

        string strConn_Access = ConfigurationManager.ConnectionStrings["ConnectionString_Listar"].ConnectionString;

        MySqlConnection MyConn = new MySqlConnection(strConn_Access);


        string sqlString = "SELECT Max(Id) FROM perguntas";


        MySqlCommand Cmd = new MySqlCommand(sqlString, MyConn);


        try
        {
            MyConn.Open();

            MySqlDataReader reader = Cmd.ExecuteReader();

            while (reader.Read())
            {

                lbl_PgId.Text = reader.GetInt32(0) + "";
            }

            reader.Close();
            MyConn.Close();


        }
        catch (Exception ex)
        {

        }
    }

    protected void bt_Gravar(object sender, EventArgs e)
    {
        string strConn_Access = ConfigurationManager.ConnectionStrings["ConnectionString_Listar"].ConnectionString;

        MySqlConnection MyConn = new MySqlConnection(strConn_Access);


        string sqlString = "INSERT INTO resolucoes " +
                "(Id_Pergunta, Id_Linguagem, Resolucao) " +
                "VALUES (@Id_Pergunta, @Id_Linguagem, @Resolucao);";


        MySqlCommand Cmd = new MySqlCommand(sqlString, MyConn);

        Cmd.Parameters.AddWithValue("@Id_Pergunta", lbl_PgId.Text);
        Cmd.Parameters.AddWithValue("@Id_Linguagem", Drop_LinguagemId.Text);
        Cmd.Parameters.AddWithValue("@Resolucao", Editor.Content);

        try
        {
            MyConn.Open();

            Cmd.ExecuteNonQuery();

            MyConn.Close();

            GrdvList_resolucao.DataBind();

            lbl_erro.Text = "Dados introduzidos com sucesso!";
            lbl_erro.Visible = true;

        }
        catch (Exception ex)
        {
            lbl_erro.Text = "Houve um erro na introdução dos dados";
            lbl_erro.Visible = true;
        }
    }
}
