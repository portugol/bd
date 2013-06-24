using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Utilizadores_Listar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void Drop_TipoUtilizador_SelectedIndexChanged(object sender, EventArgs e)
    {
        //É retirado o valor seleccionado da Drop_TipoUtilizador contido dentro de uma GridView para uma label (que está invisível)
        GridViewRow gvr = (GridViewRow)(((Control)sender).NamingContainer);
        DropDownList Drop_TipoUtilizador = (DropDownList)gvr.FindControl("Drop_TipoUtilizador");
        lbl.Text = Drop_TipoUtilizador.SelectedItem.Value;
    }

    protected void SqlDataSource_IdTipoUser(object sender, SqlDataSourceCommandEventArgs e)
    {
        //atribuir o valor recebido na label para um parametro, para se poder adicionar na BD através do comando em MySQL
        e.Command.Parameters["@idTipoUtilizador"].Value = lbl.Text;
        e.Command.Parameters["@Active"].Value = Convert.ToBoolean(lbl2.Text);

    }

    protected void Drop_IsActive_SelectedIndexChanged(object sender, EventArgs e)
    {
        //É retirado o valor seleccionado da Drop_IsActive contido dentro de uma GridView para uma label (que está invisível)
        GridViewRow gvr = (GridViewRow)(((Control)sender).NamingContainer);
        DropDownList Drop_IsActive = (DropDownList)gvr.FindControl("Drop_IsActive");
        lbl2.Text = Drop_IsActive.SelectedItem.Value;
    }
}
