<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Inserir.aspx.cs" Inherits="Lingua_Inserir" Title="Painel Administração" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
    <table style="background-color:#F0F0F0;">
        <tr>
            <td rowspan="5">
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
            <td rowspan="5" style="width: 50px"></td>
            <td colspan="3" style="font-weight: bold; color:#ffffff; font-size: 14px; font-family: Verdana; background-color: #356bb3">Inserir Línguas</td>
        </tr>
        <tr>
            <td style="width: 158px">
            </td>
            <td style="width: 20px">
            </td>
        </tr>
        <tr>
            <td style="width: 178px; text-align: right; height: 19px;">
                <asp:Label ID="lbl_Lingua" runat="server" Font-Names="Verdana" Font-Size="12px" Text="Lingua"></asp:Label></td>
            <td style="width: 158px; text-align: left; height: 19px;">
                <asp:TextBox ID="txt_Lingua" runat="server"></asp:TextBox></td>
            <td style="width: 20px; text-align: left; height: 19px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_Lingua"
                    ErrorMessage="(*)"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td colspan="3" style="height: 21px">
            </td>
        </tr>
        <tr>
            <td style="width: 178px; height: 23px">
            </td>
            <td style="width: 158px; height: 23px; text-align: right">
                &nbsp;<asp:Button ID="Bt_Limpar" runat="server" BackColor="Silver" Font-Names="Verdana" Font-Size="12px" OnClick="bt_Limpar" Text="Limpar" Width="58px" />
                <asp:Button ID="Bt_Inserir" runat="server" BackColor="Silver" Font-Names="Verdana" Font-Size="12px" OnClick="bt_Inserir" Text="Inserir" Width="87px" OnClientClick="return confirm('Tem a certeza que quer inserir este registo?');"/></td>
            <td style="width: 20px; height: 23px; text-align: right">
            </td>
        </tr>
    </table>
    &nbsp;
    <asp:Label ID="lbl_erro" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="12px" ForeColor="#C00000" Text="Dados introduzidos com sucesso!" Visible="False"></asp:Label>
</asp:Content>

