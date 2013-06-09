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

public partial class Utilizadores_Listar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void Drop_TipoUtilizador_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow gvr = (GridViewRow)(((Control)sender).NamingContainer);
        DropDownList Drop_TipoUtilizador = (DropDownList)gvr.FindControl("Drop_TipoUtilizador");
        lbl.Text = Drop_TipoUtilizador.SelectedItem.Value;
    }

    protected void SqlDataSource_IdTipoUser(object sender, SqlDataSourceCommandEventArgs e)
    {
        e.Command.Parameters["@idTipoUtilizador"].Value = lbl.Text;
        e.Command.Parameters["@Active"].Value = Convert.ToBoolean(lbl2.Text);

    }

    protected void Drop_IsActive_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow gvr = (GridViewRow)(((Control)sender).NamingContainer);
        DropDownList Drop_IsActive = (DropDownList)gvr.FindControl("Drop_IsActive");
        lbl2.Text = Drop_IsActive.SelectedItem.Value;
    }
}
