<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Inserir.aspx.cs" Inherits="Capitulo_InserirCap" Title="Painel Administração" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
    <table style="background-color:#F0F0F0;">
        <tr>
            <!--Título da tabela e respetivas formatações(cores,etc..)-->
            <td colspan="3" style="font-weight: bold; color:#ffffff; font-size: 14px; font-family: Verdana; background-color: #ca5100">Inserir Capítulos</td>
        </tr>
        <tr>
            <td colspan="2"></td>
        </tr>
        <tr> 
            <td style="width: 178px; text-align: right; height: 19px;">
                <!--Label com o nome do que se quer inserir na BD com as respetivas formatações(cores,etc..)-->
                <asp:Label ID="lbl_Nome" runat="server" Font-Names="Verdana" Font-Size="12px" Text="Nome"></asp:Label></td>
            <td style="width: 158px; text-align: left; height: 19px;"> 
                <!--Campo para inserir o nome do capítulo-->
                <asp:TextBox ID="txt_Nome" runat="server"></asp:TextBox></td>
            <td style="width: 20px; text-align: left; height: 19px;">
                <!--RequiredFieldValidator aparece quando o campo da textbox estiver vazio, ou seja, requer um preenchimento obrigatório-->
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_Nome" ErrorMessage="(*)"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 178px; text-align: right; height: 14px;">
                <!--Label com o nome do que se quer inserir na BD com as respetivas formatações(cores,etc..)-->
                <asp:Label ID="lbl_Descricao" runat="server" Font-Names="Verdana" Font-Size="12px" Text="Descrição"></asp:Label></td>
            <td style="width: 158px; text-align: left; height: 14px;">
                 <!--Campo para inserir a descrição do capítulo-->
                <asp:TextBox ID="txt_Descricao" runat="server" Height="66px" TextMode="MultiLine" Width="191px"></asp:TextBox></td>
            <td style="width: 20px; text-align: left; height: 14px;">
                <!--RequiredFieldValidator aparece quando o campo da textbox estiver vazio, ou seja, requer um preenchimento obrigatório-->
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_Descricao" ErrorMessage="(*)"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td colspan="3" style="height: 21px">
            </td>
        </tr>
        <tr>
            <td style="width: 178px; height: 23px">
            </td>
            <td style="width: 158px; height: 23px; text-align: right"> 
                <!--Botão com um evento para limpar as textbox que estiverem preenchidas -->
                <asp:Button ID="Bt_Limpar" runat="server" BackColor="Silver" Font-Names="Verdana" Font-Size="12px" OnClick="bt_Limpar" Text="Limpar" Width="58px" CausesValidation="false" /> 
                <!--Botão com um evento para inserir dados na BD, com os respetivos dados preenchidos nas textbox e com mensagem de confirmação de inserção de dados-->
                <asp:Button ID="Bt_Gravar" runat="server" BackColor="Silver" Font-Names="Verdana" Font-Size="12px" OnClick="bt_Gravar" Text="Gravar" Width="87px" OnClientClick="return confirm('Tem a certeza que quer gravar este registo?');"/></td>
            <td style="width: 20px; height: 23px; text-align: right">
            </td>
        </tr>
    </table>
     <!--label utilizada para mostrar mensagens de erro, quando os dados são introduzidos corretamente e quando não são introduzidos corretamente-->
    <asp:Label ID="lbl_erro" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="12px" ForeColor="#C00000" Text="Dados introduzidos com sucesso!" Visible="False"></asp:Label>
</asp:Content>

