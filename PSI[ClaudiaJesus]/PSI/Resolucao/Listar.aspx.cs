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
        //� retirado o valor seleccionado da Drop_IdPergunta contido dentro de uma GridView para uma label (que est� invis�vel)
        GridViewRow gvr = (GridViewRow)(((Control)sender).NamingContainer);
        DropDownList Drop_IdPergunta = (DropDownList)gvr.FindControl("Drop_IdPergunta");
        lbl.Text = Drop_IdPergunta.SelectedItem.Value;
    }
    
    protected void Drop_IdLinguagem_SelectedIndexChanged(object sender, EventArgs e)
    {
        //� retirado o valor seleccionado da Drop_IdLinguagem contido dentro de uma GridView para uma label (que est� invis�vel)
        GridViewRow gvr = (GridViewRow)(((Control)sender).NamingContainer);
        DropDownList Drop_IdLinguagem = (DropDownList)gvr.FindControl("Drop_IdLinguagem");
        lbl2.Text = Drop_IdLinguagem.SelectedItem.Value;
    }


    protected void SqlDataSource_IdPL(object sender, SqlDataSourceCommandEventArgs e)
    {
        //atribuir o valor recebido na label para um parametro, para se poder adicionar na BD atrav�s do comando em MySQL
        e.Command.Parameters["@idPerg"].Value = lbl.Text;
        e.Command.Parameters["@idLinguagem"].Value = lbl2.Text;        
    }

    protected void bt_Adicionar_Click(object sender, EventArgs e)
    {
        //Todas as labels e textbox s�o colocadas vis�veis
        lbl_PgId.Visible = true;
        lbl_Pergunta.Visible = true;
        lbl_Resolucao.Visible = true;
        Editor.Visible = true;
        lbl_LinguagemId.Visible = true;
        Drop_LinguagemId.Visible = true;
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
        string sqlString = "INSERT INTO resolucoes " +
                "(Id_Pergunta, Id_Linguagem, Resolucao) " +
                "VALUES (@Id_Pergunta, @Id_Linguagem, @Resolucao);";

        //indica a connectionstring e o comando a serem realizados
        MySqlCommand Cmd = new MySqlCommand(sqlString, MyConn);

        //Campos a serem inseridos na BD
        Cmd.Parameters.AddWithValue("@Id_Pergunta", lbl_PgId.Text);
        Cmd.Parameters.AddWithValue("@Id_Linguagem", Drop_LinguagemId.Text);
        Cmd.Parameters.AddWithValue("@Resolucao", Editor.Content);

        try
        {
            //conex�o efetuada
            MyConn.Open();

            //� efetuado o comando em MySQL e inserido os dados
            Cmd.ExecuteNonQuery();

            //conex�o fechada
            MyConn.Close();

            //GridView atualizada p�s dados inseridos corretamente
            GrdvList_resolucao.DataBind();

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
}
