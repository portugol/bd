using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using MySql.Data.MySqlClient;


public partial class Solucao_Listar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Drop_Perguntaid_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow gvr = (GridViewRow)(((Control)sender).NamingContainer);
        DropDownList Drop_Perguntaid = (DropDownList)gvr.FindControl("Drop_Perguntaid");
        lbl.Text = Drop_Perguntaid.SelectedItem.Value;
    }

    protected void SqlDataSource_IdPg(object sender, SqlDataSourceCommandEventArgs e)
    {
        e.Command.Parameters["@idPg"].Value = lbl.Text;
    }

    protected void bt_Adicionar_Click(object sender, EventArgs e)
    {

        lbl_Pergunta.Visible = true;
        lbl_entradas.Visible = true;
        lbl_saidas.Visible = true;
        lbl_PgId.Visible = true;
        txt_entradas.Visible = true;
        txt_saidas.Visible = true;
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

        string sqlString = "INSERT INTO solucao " +
                "(Entradas, Saidas, PerguntasId) " +
                "VALUES (@Entradas, @Saidas, @PerguntasId);";

        MySqlCommand Cmd = new MySqlCommand(sqlString, MyConn);

        Cmd.Parameters.AddWithValue("@PerguntasId", lbl_PgId.Text);
        Cmd.Parameters.AddWithValue("@Entradas", txt_entradas.Text);
        Cmd.Parameters.AddWithValue("@Saidas", txt_saidas.Text);

        try
        {
            MyConn.Open();

            Cmd.ExecuteNonQuery();

            MyConn.Close();

            GrdvList_SolucoesList.DataBind();

            lbl_erro.Text = "Dados introduzidos com sucesso!";
            lbl_erro.Visible = true;

            lbl_Pergunta.Visible = false;
            lbl_entradas.Visible = false;
            lbl_saidas.Visible = false;
            lbl_PgId.Visible = false;
            txt_entradas.Visible = false;
            txt_saidas.Visible = false;
            Bt_Gravar.Visible = false;
        }
        catch (Exception ex)
        {
            lbl_erro.Text = "Houve um erro na introdução dos dados";
            lbl_erro.Visible = true;
        }
    }

    protected void bt_Limpar(object sender, EventArgs e)
    {
        txt_entradas.Text = "";
        txt_saidas.Text = "";
        lbl_erro.Visible = false;
    }

    protected void bt_Solucao(object sender, EventArgs e)
    { 
        lbl_Pergunta.Visible = true;
        lbl_entradas.Visible = true;
        lbl_saidas.Visible = true;
        lbl_PgId.Visible = true;
        txt_entradas.Visible = true;
        txt_saidas.Visible = true;
        Bt_Gravar.Visible = true;

        lbl_erro.Text = "Não introduziu dados ";
        lbl_erro.Visible = true;


        string strConn_Access = ConfigurationManager.ConnectionStrings["ConnectionString_Listar"].ConnectionString;

        MySqlConnection MyConn = new MySqlConnection(strConn_Access);

        string sqlString = "INSERT INTO solucao " +
                "(Entradas, Saidas, PerguntasId) " +
                "VALUES (@Entradas, @Saidas, @PerguntasId);";

        MySqlCommand Cmd = new MySqlCommand(sqlString, MyConn);

        Cmd.Parameters.AddWithValue("@PerguntasId", lbl_PgId.Text);
        Cmd.Parameters.AddWithValue("@Entradas", txt_entradas.Text);
        Cmd.Parameters.AddWithValue("@Saidas", txt_saidas.Text);

        try
        {
            MyConn.Open();

            Cmd.ExecuteNonQuery();

            MyConn.Close();

            Response.Redirect("~/Resolucao/Listar.aspx");

        }
        catch (Exception ex)
        {
            lbl_erro.Text = "Não introduziu dados";
            lbl_erro.Visible = true;
        }
    }
}
