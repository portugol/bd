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
        //� retirado o valor seleccionado da Drop_Perguntaid contido dentro de uma GridView para uma label (que est� invis�vel)
        GridViewRow gvr = (GridViewRow)(((Control)sender).NamingContainer);
        DropDownList Drop_Perguntaid = (DropDownList)gvr.FindControl("Drop_Perguntaid");
        lbl.Text = Drop_Perguntaid.SelectedItem.Value;
    }

    protected void SqlDataSource_IdPg(object sender, SqlDataSourceCommandEventArgs e)
    {
        //atribuir o valor recebido na label para um parametro, para se poder adicionar na BD atrav�s do comando em MySQL
        e.Command.Parameters["@idPg"].Value = lbl.Text;
    }

    protected void bt_Adicionar_Click(object sender, EventArgs e)
    {
        //Colocar labels e textbox visiveis
        lbl_Pergunta.Visible = true;
        lbl_entradas.Visible = true;
        lbl_saidas.Visible = true;
        lbl_PgId.Visible = true;
        txt_entradas.Visible = true;
        txt_saidas.Visible = true;
        Bt_Gravar.Visible = true;

        //Liga��o � BD efetuada atrav�s de uma ConnectionString
        string strConn_Access = ConfigurationManager.ConnectionStrings["ConnectionString_Listar"].ConnectionString;

        MySqlConnection MyConn = new MySqlConnection(strConn_Access);

        //Comando em MySQl para pesquisar o m�ximo de perguntas existentes da tabela das perguntas
        string sqlString = "SELECT Max(Id) FROM perguntas";

        //indica a connectionstring e o comando a serem realizados
        MySqlCommand Cmd = new MySqlCommand(sqlString, MyConn);

        try
        {
            //Conex�o efetuada
            MyConn.Open();

            MySqlDataReader reader = Cmd.ExecuteReader();

            while (reader.Read())
            {

                lbl_PgId.Text = reader.GetInt32(0) + "";
            }

            //Conex�o fechada
            reader.Close();
            MyConn.Close();


        }
        catch (Exception ex)
        {

        }
    }

    //bot�o Gravar
    protected void bt_Gravar(object sender, EventArgs e)
    {
        //Liga��o � BD efetuada atrav�s de uma ConnectionString
        string strConn_Access = ConfigurationManager.ConnectionStrings["ConnectionString_Listar"].ConnectionString;

        MySqlConnection MyConn = new MySqlConnection(strConn_Access);

        //Comando em MySQl para inserir dados na BD
        string sqlString = "INSERT INTO solucao " +
                "(Entradas, Saidas, PerguntasId) " +
                "VALUES (@Entradas, @Saidas, @PerguntasId);";

        //indica a connectionstring e o comando a serem realizados
        MySqlCommand Cmd = new MySqlCommand(sqlString, MyConn);

        //Campos a serem inseridos na BD
        Cmd.Parameters.AddWithValue("@PerguntasId", lbl_PgId.Text);
        Cmd.Parameters.AddWithValue("@Entradas", txt_entradas.Text);
        Cmd.Parameters.AddWithValue("@Saidas", txt_saidas.Text);

        try
        {
            //Conex�o efetuada
            MyConn.Open();

            //� efetuado o comando em MySQL e inserido os dados
            Cmd.ExecuteNonQuery();

            //Conex�o fechada
            MyConn.Close();

            //atualiza��o da GridView ap�s a inser��o dos dados
            GrdvList_SolucoesList.DataBind();

            //no caso dos campos estarem bem preenchidos ir� aparecer a seguinte mensagem
            lbl_erro.Text = "Dados introduzidos com sucesso!";
            lbl_erro.Visible = true;

            //esconder novamente todas as textbox e labels
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
            //no caso dos campos n�o estarem bem preenchidos � mostrada esta mensagem de erro
            lbl_erro.Text = "Houve um erro na introdu��o dos dados";
            lbl_erro.Visible = true;
        }
    }

    //bot�o Limpar
    protected void bt_Limpar(object sender, EventArgs e)
    {
        //todos as textbox v�o ser limpas / deixadas vazias
        txt_entradas.Text = "";
        txt_saidas.Text = "";
        lbl_erro.Visible = false;
    }

    protected void bt_Resolucao(object sender, EventArgs e)
    {
        //Colocar labels e textbox visiveis
        lbl_Pergunta.Visible = true;
        lbl_entradas.Visible = true;
        lbl_saidas.Visible = true;
        lbl_PgId.Visible = true;
        txt_entradas.Visible = true;
        txt_saidas.Visible = true;
        Bt_Gravar.Visible = true;


        //mensagem de erro
        lbl_erro.Text = "N�o introduziu dados ";
        lbl_erro.Visible = true;

        //Liga��o � BD efetuada atrav�s de uma ConnectionString
        string strConn_Access = ConfigurationManager.ConnectionStrings["ConnectionString_Listar"].ConnectionString;

        MySqlConnection MyConn = new MySqlConnection(strConn_Access);

        //Comando em MySQl para inserir dados na BD
        string sqlString = "INSERT INTO solucao " +
                "(Entradas, Saidas, PerguntasId) " +
                "VALUES (@Entradas, @Saidas, @PerguntasId);";

        //indica a connectionstring e o comando a serem realizados
        MySqlCommand Cmd = new MySqlCommand(sqlString, MyConn);

        //Campos a serem inseridos na BD
        Cmd.Parameters.AddWithValue("@PerguntasId", lbl_PgId.Text);
        Cmd.Parameters.AddWithValue("@Entradas", txt_entradas.Text);
        Cmd.Parameters.AddWithValue("@Saidas", txt_saidas.Text);

        try
        {
            //Conex�o efetuada
            MyConn.Open();

            //� efetuado o comando em MySQL e inserido os dados
            Cmd.ExecuteNonQuery();

            //Conex�o fechada
            MyConn.Close();

            //ap�s introduzir corretamente os dados a p�gina � redirecionada para a p�gina das resolu��es
            Response.Redirect("~/Resolucao/Listar.aspx");

        }
        catch (Exception ex)
        {
            //no caso dos campos n�o estarem bem preenchidos � mostrada esta mensagem de erro
            lbl_erro.Text = "N�o introduziu dados";
            lbl_erro.Visible = true;
        }
    }
}
