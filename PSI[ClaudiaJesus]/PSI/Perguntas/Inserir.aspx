<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Inserir.aspx.cs" Inherits="Perguntas_Inserir" Title="Painel Administração" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="background-color: #F0F0F0;">
        <tr>
            <!--Título da tabela e respetivas formatações(cores,etc..)-->
            <td colspan="3" style="background-color: #ca5100; color: #ffffff; font-family: Verdana; font-size: 14px; font-weight: bold;">Inserir Perguntas</td>
        </tr>
        <tr>
            <td style="width: 120px"></td>
            <td style="width: 913px"></td>
            <td style="width: 152px"></td>
        </tr>
        <tr>
            <td style="width: 120px; text-align: right; height: 167px;">
                <!--Label com o nome do que se quer inserir na BD com as respetivas formatações(cores,etc..)-->
                <asp:Label ID="lbl_Pergunta" runat="server" Text="Pergunta" Font-Names="Verdana" Font-Size="12px"></asp:Label></td>
            <td style="width: 913px; text-align: left; height: 167px;">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <!--Campo para inserir a pergunta em HTML, através de um editor de html do AjaxToolkit-->
                <cc1:Editor ID="Editor" runat="server" Width="740px" Height="160px" NoUnicode="True" />
                <!--RequiredFieldValidator aparece quando o campo da textbox estiver vazio, ou seja, requer um preenchimento obrigatório-->
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Editor" ErrorMessage="(*)"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 120px; text-align: right">&nbsp;</td>
            <td style="width: 913px; text-align: left">&nbsp;</td>
            <td style="width: 152px; text-align: left">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 120px; text-align: right">&nbsp;</td>
            <td style="width: 913px; text-align: left">&nbsp;</td>
            <td style="width: 152px; text-align: left">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 120px; text-align: right">&nbsp;</td>
            <td style="width: 913px; text-align: left">&nbsp;</td>
            <td style="width: 152px; text-align: left">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 120px; text-align: right">
                <!--Label com o nome do que se quer inserir na BD com as respetivas formatações(cores,etc..)-->
                <asp:Label ID="lbl_Dificuldade" runat="server" Text="Dificuldade" Font-Names="Verdana" Font-Size="12px"></asp:Label></td>
            <td style="width: 913px; text-align: left">
                <!--Campo para inserir a dificuldade da pergunta-->
                <asp:TextBox ID="txt_Dificuldade" runat="server" Width="25px"></asp:TextBox>
                <!--RequiredFieldValidator aparece quando o campo da textbox estiver vazio, ou seja, requer um preenchimento obrigatório-->
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_Dificuldade" ErrorMessage="(*)"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 120px; text-align: right">
                <!--Label com o nome do que se quer inserir na BD com as respetivas formatações(cores,etc..)-->
                <asp:Label ID="lbl_Capitulo" runat="server" Text="Capitulo" Font-Names="Verdana" Font-Size="12px"></asp:Label></td>
            <td style="width: 913px; text-align: left">
                <!--Campo para seleção e inserção do número do capitulo a que a pergunta vai pertencer-->
                <asp:DropDownList ID="Drop_Capitulo" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSource_CapituloID" DataTextField="Nome" DataValueField="Id">
                    <asp:ListItem Value="0" Selected="True">Escolha uma opção</asp:ListItem>
                </asp:DropDownList>
                <!--RequiredFieldValidator aparece quando o campo da textbox estiver vazio, ou seja, requer um preenchimento obrigatório-->
                <asp:RequiredFieldValidator InitialValue="0" ID="RequiredFieldValidator3" runat="server" ControlToValidate="Drop_Capitulo" ErrorMessage="(*)"></asp:RequiredFieldValidator>
                <!--SqlDataSource, onde são feitos os comandos em MySQL                
                                   SelectCommand: Comando em MySQL para efetuar a listagem dos capitulos existentes-->
                <asp:SqlDataSource ID="SqlDataSource_CapituloID" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
                    SelectCommand="SELECT Id, Nome FROM capitulo" ProviderName="MySql.Data.MySqlClient"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 120px; text-align: right">
                <!--Label com o nome do que se quer inserir na BD com as respetivas formatações(cores,etc..)-->
                <asp:Label ID="lbl_TipoPerg" runat="server" Text="Tipo Pergunta" Font-Names="Verdana" Font-Size="12px"></asp:Label></td>
            <td style="width: 913px; text-align: left">
                <!--Campo para seleção e inserção do número do tipo de pergunta à qual a pergunta vai pertencer-->
                <asp:DropDownList ID="Drop_Tipo" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSource_TipoPerg" DataTextField="Tipo" DataValueField="Id">
                    <asp:ListItem Value="0" Selected="True">Escolha uma opção</asp:ListItem>
                </asp:DropDownList>
                <!--RequiredFieldValidator aparece quando o campo da textbox estiver vazio, ou seja, requer um preenchimento obrigatório-->
                <asp:RequiredFieldValidator InitialValue="0" ID="RequiredFieldValidator4" runat="server" ControlToValidate="Drop_Tipo" ErrorMessage="(*)"></asp:RequiredFieldValidator>
                <!--SqlDataSource, onde são feitos os comandos em MySQL                
                                   SelectCommand: Comando em MySQL para efetuar a listagem dos tipos de pergunta existentes-->
                <asp:SqlDataSource ID="SqlDataSource_TipoPerg" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
                    SelectCommand="SELECT Id, Tipo FROM Tipo_Perg" ProviderName="MySql.Data.MySqlClient"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="3"></td>
        </tr>
        <tr>
            <td style="width: 120px; height: 23px;"></td>
            <td style="width: 913px; height: 23px;">
                <!--Botão com um evento para limpar as textbox que estiverem preenchidas -->
                <asp:Button ID="Bt_Limpar" runat="server" BackColor="Silver" Font-Names="Verdana" Font-Size="12px" OnClick="bt_Limpar" Text="Limpar" Width="58px" CausesValidation="false"/>
                </td>
            <td style="width: 152px; height: 23px; text-align: right"></td>
        </tr>
        <tr>
            <td style="width: 120px; height: 23px;">&nbsp;</td>
            <td style="width: 913px; text-align: right; height: 23px;">
                <!--Botão que tem um evento que vai redireccionar para a página das Soluções-->
                <asp:Button ID="Bt_Solucao" runat="server" Text="Solução >" BackColor="Silver" Font-Names="Verdana" Font-Size="12px" OnClick="bt_Solucao" Width="87px" /></td>
            <td style="width: 152px; height: 23px; text-align: right">&nbsp;</td>
        </tr>
    </table>
     <!--label utilizada para mostrar mensagens de erro, quando os dados são introduzidos corretamente e quando não são introduzidos corretamente-->
    <asp:Label ID="lbl_erro" runat="server" Text="Dados introduzidos com sucesso!" Font-Bold="True" Font-Names="Verdana" Font-Size="12px" ForeColor="#C00000" Visible="False"></asp:Label>
</asp:Content>