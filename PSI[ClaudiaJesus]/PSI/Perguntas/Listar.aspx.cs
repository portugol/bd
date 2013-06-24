using System;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;
using System.Web.UI;


public partial class Perguntas_Listar : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
         
    }

    protected void Drop_Capitulo_SelectedIndexChanged(object sender, EventArgs e)
    {
       //É retirado o valor seleccionado da Drop_Capitulo contido dentro de uma GridView para uma label (que está invisível)
       GridViewRow  gvr = (GridViewRow)(((Control)sender).NamingContainer);
       DropDownList Drop_Capitulo = (DropDownList)gvr.FindControl("Drop_Capitulo");
       lbl.Text = Drop_Capitulo.SelectedItem.Value;       
    }

    protected void Drop_Tipo_SelectedIndexChanged(object sender, EventArgs e)
    {
        //É retirado o valor seleccionado da Drop_Tipo contido dentro de uma GridView para uma label (que está invisível)
        GridViewRow gvr = (GridViewRow)(((Control)sender).NamingContainer);
        DropDownList Drop_Tipo = (DropDownList)gvr.FindControl("Drop_Tipo");
        lbl2.Text = Drop_Tipo.SelectedItem.Value;       
    }
    
    protected void SqlDataSource_IdCT(object sender, SqlDataSourceCommandEventArgs e)
    {
            //atribuir o valor recebido na label para um parametro, para se poder adicionar na BD através do comando em MySQL
            e.Command.Parameters["@idCap"].Value = lbl.Text;
            e.Command.Parameters["@idTipo"].Value = lbl2.Text;
       
    }

    protected void Drop_CapID_SelectedIndexChanged(object sender, EventArgs e)
    {  

        lblteste.Text = Drop_CapID.SelectedItem.Value;

        //Ligação à BD efetuada através de uma ConnectionString
        string strConn_Access = ConfigurationManager.ConnectionStrings["ConnectionString_Listar"].ConnectionString;

        MySqlConnection MyConn = new MySqlConnection(strConn_Access);


        string sqlString = "SELECT * FROM perguntas WHERE CapituloId =" + lblteste.Text;

        //edição do DataSource, com o comando efetuado na linha anterior
        SqlDataSource_PergList.SelectCommand = sqlString;

        //indica a connectionstring e o comando a serem realizados
        MySqlCommand Cmd = new MySqlCommand(sqlString, MyConn);


        try
        {   
            //conexão efetuada
            MyConn.Open();

            //É efetuado o comando em MySQL e inserido os dados
            Cmd.ExecuteNonQuery();

            //GridView Atualizada após os dados inseridos corretamente
            GrdvList_Perg.DataBind();

            //conexao fechada
            MyConn.Close();


        }
        catch (Exception ex)
        {

        }
    }

    protected void Drop_Dificuldade_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblteste.Text = Drop_Dificuldade.SelectedItem.Value;

        //Ligação à BD efetuada através de uma ConnectionString
        string strConn_Access = ConfigurationManager.ConnectionStrings["ConnectionString_Listar"].ConnectionString;

        MySqlConnection MyConn = new MySqlConnection(strConn_Access);


        string sqlString = "SELECT * FROM perguntas WHERE Dificuldade =" + lblteste.Text;

        //edição do DataSource, com o comando efetuado na linha anterior
        SqlDataSource_PergList.SelectCommand = sqlString;

        //indica a connectionstring e o comando a serem realizados
        MySqlCommand Cmd = new MySqlCommand(sqlString, MyConn);


        try
        {
            //Conexão efetuada
            MyConn.Open();

            //É efetuado o comando em MySQL e inserido os dados
            Cmd.ExecuteNonQuery();

            //Atualiza a GridView após os dados inseridos corretamente
            GrdvList_Perg.DataBind();

            //conexão fechada
            MyConn.Close();


        }
        catch (Exception ex)
        {

        }
    }
}
