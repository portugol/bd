<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Inserir.aspx.cs" Inherits="TipoUser_Inserir" Title="Painel Administração" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="background-color:#F0F0F0;">
        <tr>
            <!--Título da tabela e respetivas formatações(cores,etc..)-->
            <td colspan="3" style="font-weight: bold; font-size: 14px; font-family: Verdana; color:#ffffff; background-color:#ca5100"> Inserir Tipo de Utilizadores</td>
        </tr>
        <tr>
            <td style="width: 155px">
            </td>
            <td style="width: 158px">
            </td>
            <td style="width: 20px">
            </td>
        </tr>
        <tr>
            <td style="width: 155px; text-align: right">
                <!--Label com o nome do que se quer inserir na BD com as respetivas formatações(cores,etc..)-->
                <asp:Label ID="lbl_Tipo" runat="server" Font-Names="Verdana" Font-Size="12px" Text="Tipo"></asp:Label></td>
            <td style="width: 158px; text-align: left">
                <!--Campo para inserir o tipo de utilizador-->
                <asp:TextBox ID="txt_Tipo" runat="server"></asp:TextBox></td>
            <td style="width: 20px; text-align: left">
                <!--RequiredFieldValidator aparece quando o campo da textbox estiver vazio, ou seja, requer um preenchimento obrigatório-->
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_Tipo" ErrorMessage="(*)"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td colspan="3">
            </td>
        </tr>
        <tr>
            <td style="width: 155px; height: 23px">
            </td>
            <td style="width: 158px; height: 23px; text-align: right">
                <!--Botão com um evento para limpar as textbox que estiverem preenchidas -->
                <asp:Button ID="Bt_Limpar" runat="server" BackColor="Silver" Font-Names="Verdana" Font-Size="12px" OnClick="bt_Limpar" Text="Limpar" Width="58px" CausesValidation="false"/>
                <!--Botão com um evento para inserir dados na BD, com os respetivos dados preenchidos nas textbox e com mensagem de confirmação de inserção de dados-->
                <asp:Button ID="Bt_Gravar" runat="server" BackColor="Silver" Font-Names="Verdana" Font-Size="12px" OnClick="bt_Gravar" Text="Gravar" Width="87px" OnClientClick="return confirm('Tem a certeza que quer gravar este registo?');"/></td>
            <td style="width: 20px; height: 23px; text-align: right">
            </td>
        </tr>
    </table>
    <!--label utilizada para mostrar mensagens de erro, quando os dados são introduzidos corretamente e quando não são introduzidos corretamente-->
    <asp:Label ID="lbl_erro" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="12px" ForeColor="#C00000" Text="Dados introduzidos com sucesso!" Visible="False"></asp:Label>
</asp:Content>