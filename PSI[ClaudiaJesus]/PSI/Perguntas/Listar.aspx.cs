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
       GridViewRow  gvr = (GridViewRow)(((Control)sender).NamingContainer);
       DropDownList Drop_Capitulo = (DropDownList)gvr.FindControl("Drop_Capitulo");
       lbl.Text = Drop_Capitulo.SelectedItem.Value;       
    }

    protected void Drop_Tipo_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow gvr = (GridViewRow)(((Control)sender).NamingContainer);
        DropDownList Drop_Tipo = (DropDownList)gvr.FindControl("Drop_Tipo");
        lbl2.Text = Drop_Tipo.SelectedItem.Value;       
    }
    
    protected void SqlDataSource_IdCT(object sender, SqlDataSourceCommandEventArgs e)
    {
            e.Command.Parameters["@idCap"].Value = lbl.Text;
            e.Command.Parameters["@idTipo"].Value = lbl2.Text;
       
    }

    protected void Drop_CapID_SelectedIndexChanged(object sender, EventArgs e)
    {  
        lblteste.Text = Drop_CapID.SelectedItem.Value;


        string strConn_Access = ConfigurationManager.ConnectionStrings["ConnectionString_Listar"].ConnectionString;

        MySqlConnection MyConn = new MySqlConnection(strConn_Access);


        string sqlString = "SELECT * FROM perguntas WHERE CapituloId =" + lblteste.Text;

        SqlDataSource_PergList.SelectCommand = sqlString;


        MySqlCommand Cmd = new MySqlCommand(sqlString, MyConn);


        try
        {
            MyConn.Open();

            Cmd.ExecuteNonQuery();

            GrdvList_Perg.DataBind();

            MyConn.Close();


        }
        catch (Exception ex)
        {

        }
    }

    protected void Drop_Dificuldade_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblteste.Text = Drop_Dificuldade.SelectedItem.Value;


        string strConn_Access = ConfigurationManager.ConnectionStrings["ConnectionString_Listar"].ConnectionString;

        MySqlConnection MyConn = new MySqlConnection(strConn_Access);


        string sqlString = "SELECT * FROM perguntas WHERE Dificuldade =" + lblteste.Text;

        SqlDataSource_PergList.SelectCommand = sqlString;


        MySqlCommand Cmd = new MySqlCommand(sqlString, MyConn);


        try
        {
            MyConn.Open();

            Cmd.ExecuteNonQuery();

            GrdvList_Perg.DataBind();

            MyConn.Close();


        }
        catch (Exception ex)
        {

        }
    }
}
