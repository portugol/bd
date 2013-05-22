 <%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Inserir.aspx.cs" Inherits="Perguntas_Inserir" Title="Painel Administração" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="background-color:#F0F0F0;">
        <tr>
            <td rowspan="12">
                 <asp:Menu ID="Menu1" runat="server" DataSourceID="XmlDataSource_PSI" StaticSubMenuIndent="10px" BackColor="#E3EAEB" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#666666">
                        <DataBindings>
                            <asp:MenuItemBinding DataMember="item" NavigateUrlField="url" TextField="textoParaEcra" />
                        </DataBindings>
                        <DynamicHoverStyle BackColor="#666666" ForeColor="White" />
                        <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                        <DynamicMenuStyle BackColor="#E3EAEB" />
                        <DynamicSelectedStyle BackColor="#1C5E55" />
                        <StaticHoverStyle BackColor="#666666" ForeColor="White" />
                        <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                        <StaticSelectedStyle BackColor="#1C5E55" />
                    </asp:Menu>
                    <asp:XmlDataSource ID="XmlDataSource_PSI" runat="server" DataFile="~/menu/menu_Admin.xml" XPath="/menu/*"></asp:XmlDataSource>
            </td>
            <td colspan="3" style="background-color:#356BB3; color:#ffffff; font-family:Verdana; font-size:14px; font-weight:bold;">
                Inserir Perguntas</td>
        </tr>
        <tr>
            <td style="width: 120px">
            </td>
            <td style="width: 913px">
            </td>
            <td style="width: 152px">
            </td>
        </tr>
        <tr>
            <td style="width: 120px; text-align: right; height: 167px;">
                <asp:Label ID="lbl_Pergunta" runat="server" Text="Pergunta" Font-Names="Verdana" Font-Size="12px"></asp:Label></td>
            <td style="width: 913px; text-align: left; height: 167px;">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <cc1:Editor ID="Editor" runat="server" width="740px" height="160px" />
                </td>
            <td style="width: 152px; text-align: left; height: 167px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Editor"
                    ErrorMessage="(*)"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 120px; text-align: right">
                &nbsp;</td>
            <td style="width: 913px; text-align: left">
                &nbsp;</td>
            <td style="width: 152px; text-align: left">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 120px; text-align: right">
                &nbsp;</td>
            <td style="width: 913px; text-align: left">
                &nbsp;</td>
            <td style="width: 152px; text-align: left">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 120px; text-align: right">
                &nbsp;</td>
            <td style="width: 913px; text-align: left">
                &nbsp;</td>
            <td style="width: 152px; text-align: left">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 120px; text-align: right">
                <asp:Label ID="lbl_Dificuldade" runat="server" Text="Dificuldade" Font-Names="Verdana" Font-Size="12px"></asp:Label></td>
            <td style="width: 913px; text-align: left">
                <asp:TextBox ID="txt_Dificuldade" runat="server" Width="25px"></asp:TextBox></td>
            <td style="width: 152px; text-align: left; height: auto;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_Dificuldade"
                    ErrorMessage="(*)"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 120px; text-align: right">
                <asp:Label ID="lbl_Capitulo" runat="server" Text="Capitulo" Font-Names="Verdana" Font-Size="12px"></asp:Label></td>
            <td style="width: 913px; text-align: left">
                <asp:DropDownList ID="Drop_Capitulo" runat="server" DataSourceID="SqlDataSource_CapituloID" DataTextField="Id" DataValueField="Id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource_CapituloID" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>" 
                    SelectCommand="SELECT Id FROM capitulo"  ProviderName="MySql.Data.MySqlClient"></asp:SqlDataSource>
                </td>
            <td style="width: 152px; text-align: left">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Drop_Capitulo"
                    ErrorMessage="(*)"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 120px; text-align: right">
                <asp:Label ID="lblFinalidade" runat="server" Text="Tipo" Font-Names="Verdana" Font-Size="12px"></asp:Label></td>
            <td style="width: 913px; text-align: left">
                <asp:DropDownList ID="Drop_Tipo" runat="server" DataSourceID="SqlDataSource_TipoPerg" DataTextField="Id" DataValueField="Id">
                </asp:DropDownList>
                 <asp:SqlDataSource ID="SqlDataSource_TipoPerg" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>" 
                    SelectCommand="SELECT Id FROM Tipo_Perg"  ProviderName="MySql.Data.MySqlClient"></asp:SqlDataSource>
            </td>
            <td style="width: 152px; text-align: left">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Drop_Tipo"
                    ErrorMessage="(*)"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td colspan="3">
                </td>
        </tr>
        <tr>
            <td style="width: 120px; height: 23px;">
            </td>
            <td style="width: 913px; height: 23px;">
                &nbsp;<asp:Button ID="Bt_Limpar" runat="server" BackColor="Silver" Font-Names="Verdana"
                    Font-Size="12px" OnClick="bt_Limpar" Text="Limpar" Width="58px" />
                <asp:Button ID="Bt_Inserir" runat="server" Text="Inserir" BackColor="Silver" Font-Names="Verdana" 
                    Font-Size="12px" OnClick="bt_Inserir" Width="87px" OnClientClick="return confirm('Tem a certeza que quer inserir este registo?');"/></td>
            <td style="width: 152px; height: 23px; text-align: right">
            </td>
        </tr>
        <tr>
            <td style="width: 120px; height: 23px;">
                &nbsp;</td>
            <td style="width: 913px; text-align: right; height: 23px;">
                &nbsp;</td>
            <td style="width: 152px; height: 23px; text-align: right">
                &nbsp;</td>
        </tr>
    </table>
    &nbsp;
    <asp:Label ID="lbl_erro" runat="server" Text="Dados introduzidos com sucesso!" Font-Bold="True" Font-Names="Verdana" Font-Size="12px" ForeColor="#C00000" Visible="False"></asp:Label>
</asp:Content>

