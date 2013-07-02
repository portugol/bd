<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Teste.aspx.cs" Inherits="Teste" Title="Painel Administração" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <!--Título da Página-->
    <h1 style="text-align: center"><strong>Testes</strong></h1>
    <div>
        <table style="width: 100%;">
                <tr><td>     
                     <!--Label com o nome de Cabeçalho com as respetivas formatações(cores,etc..)-->             
                     <asp:Label ID="lbl_cabecalho" runat="server" Text="Cabeçalho" Style="font-size: medium; color: #666666; font-weight: 700; text-align: left;"></asp:Label>
                     <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
                     <!--Campo para inserir o cabeçalho do teste em HTML, através de um editor de html do AjaxToolkit-->
                     <cc1:Editor ID="Editor" runat="server" Width="740px" Height="160px" NoUnicode="True"/>
                </td></tr>
            <tr>
                <td style="width: 633px">
                    <!--Label com o título do teste que se quer realizar no PDF com as respetivas formatações(cores,etc..)--> 
                    <asp:Label ID="lbl_Descricao" runat="server" Text="Descricao" Style="font-size: medium; color: #666666; font-weight: 700;"></asp:Label>
                    <!--Campo de seleção do teste que deseja realizar-->
                    <asp:DropDownList ID="Drop_Descricao" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource_Descricao" DataTextField="Descricao" DataValueField="Id" AppendDataBoundItems="true" OnSelectedIndexChanged="Drop_Descricao_SelectedIndexChanged" EnableViewState="true">
                        <asp:ListItem Value="0" Selected="True">Escolha uma opção</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource_Descricao" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
                        SelectCommand="SELECT Id, Descricao FROM tipo_teste"
                        ProviderName="MySql.Data.MySqlClient"></asp:SqlDataSource>
                    <!--label utilizada para guardar o valor retirado na drop da descrição-->
                    <asp:Label ID="lbl_idDescricao" runat="server" Visible="false"></asp:Label>
                    <br />
                    <br />

                    <asp:Label ID="lbl_Lingua" runat="server" Text="Lingua" Style="font-size: medium; font-weight: 700; color: #666666;"></asp:Label>
                    <!--Seleção do capitulo que se deseja inserir na tabela enunciados-->
                    <asp:DropDownList ID="Drop_Lingua" runat="server" DataSourceID="SqlDataSource_Lingua" DataTextField="Lingua" DataValueField="IdLingua" AppendDataBoundItems="true" AutoPostBack="true" EnableViewState="true" OnSelectedIndexChanged="Drop_Lingua_SelectedIndexChanged">
                        <asp:ListItem Value="0" Selected="True">Escolha uma opção</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Drop_Lingua" ErrorMessage="(*)" InitialValue="0"></asp:RequiredFieldValidator>
                    <br />
                    <!--label utilizada para guardar o valor retirado na drop do Id do Lingua-->
                    <asp:Label ID="lbl_idLingua" runat="server" Text="" Visible="true"></asp:Label>
                    <asp:SqlDataSource ID="SqlDataSource_Lingua" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
                        ProviderName="MySql.Data.MySqlClient"
                        SelectCommand="SELECT IdLingua, Lingua FROM lingua"></asp:SqlDataSource>
                     <br />
                     <br />
                    <span style="font-size: medium; color: #666666;"><strong>Data Inicio:</strong></span>&nbsp;&nbsp;&nbsp;&nbsp;
                    <!--label utilizada para mostrar a data de inicio do teste selecionado-->
                        <asp:Label ID="lbl_DataInicio" runat="server" Text="" Style="font-weight: 700; color: #666666"></asp:Label>
                    <br />
                    <span style="font-size: medium"><span style="color: #666666"><strong>Data Fim:</strong></span>&nbsp;</span>&nbsp;&nbsp;
                    <!--label utilizada para mostrar a data de fim do teste selecionado-->
                        <asp:Label ID="lbl_DataFim" runat="server" Text="" Style="font-weight: 700; color: #666666"></asp:Label>                    
                </td>
            </tr>
            <tr>
                <td style="width: 633px">
                    <asp:Label ID="lbl_Capitulo" runat="server" Text="Capitulo" Style="font-size: medium; font-weight: 700; color: #666666;"></asp:Label>
                    <!--Seleção do capitulo que se deseja inserir na tabela enunciados-->
                    <asp:DropDownList ID="Drop_Capitulo" runat="server" DataSourceID="SqlDataSource_CapList" DataTextField="Nome" DataValueField="Id" AppendDataBoundItems="true" AutoPostBack="true" EnableViewState="true" OnSelectedIndexChanged="Drop_Capitulo_SelectedIndexChanged">
                        <asp:ListItem Value="0" Selected="True">Escolha uma opção</asp:ListItem>
                    </asp:DropDownList>
                    <!--label utilizada para guardar o valor retirado na drop do Id do Capitulo-->
                    <asp:Label ID="lbl_cap" runat="server" Text="" Visible="false"></asp:Label>
                    <asp:SqlDataSource ID="SqlDataSource_CapList" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
                        ProviderName="MySql.Data.MySqlClient"
                        SelectCommand="SELECT Nome, Id FROM capitulo"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 633px">
                    <asp:Label ID="lbl_Dificuldade" runat="server" Text="Dificuldade" Style="font-size: medium; font-weight: 700; color: #666666;"></asp:Label>
                    <!--Seleção da dificuldade que se deseja inserir na tabela enunciados-->
                    <asp:DropDownList ID="Drop_Dificuldade" runat="server" DataSourceID="SqlDataSource_Dificuldade" DataTextField="Dificuldade" DataValueField="Dificuldade" AppendDataBoundItems="true" OnSelectedIndexChanged="Drop_Dificuldade_SelectedIndexChanged" AutoPostBack="true" EnableViewState="true">
                        <asp:ListItem Value="0" Selected="True">Escolha uma opção</asp:ListItem>
                    </asp:DropDownList>
                    <!--label utilizada para guardar o valor retirado na drop da Dificuldade-->
                    <asp:Label ID="lbl_dif" runat="server" Text="" Visible="false"></asp:Label>
                    <asp:SqlDataSource ID="SqlDataSource_Dificuldade" runat="server"
                        ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
                        SelectCommand="SELECT DISTINCT Dificuldade FROM perguntas" ProviderName="MySql.Data.MySqlClient"></asp:SqlDataSource><p></p>
                    <asp:Label ID="lbl_NumPerg" runat="server" Text="Nº Perguntas" Style="font-size: medium; font-weight: 700; color: #666666;"></asp:Label>
                    <!--campo utilizado para indicar o número de perguntas que deseja inserir na tabela enunciados-->
                    <asp:TextBox ID="txt_nperg" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 633px">
                    <!--Botão que limpa as textbox para que se possa inserir mais perguntas à tabela enunciados-->
                    <asp:Button ID="bt_Adicionar" runat="server" Text="Adicionar Mais" OnClick="bt_Adicionar_Click"></asp:Button>
                    <br />
            <!--label utilizada para mostrar mensagens de erro, quando os dados são introduzidos corretamente e quando não são introduzidos corretamente-->
            <asp:Label ID="lbl_erro" runat="server" Text="" Style="color: #FF0000"></asp:Label>
                    <p style="text-align: center; font-size: medium; color: #000000;"><strong>----------------------------------------------------------</strong></p>
                </td>
            </tr>
            <tr><td style="width: 633px">
                <!--GridView: Mostra toda a informação da tabela enunciados existente na BD 
                              (através de um DATASOURCE que contém um comando Select em MySQL)-->
        <asp:GridView ID="Grdv_Enunciado" runat="server" AllowPaging="True"
            Visible="false" AllowSorting="True" AutoGenerateColumns="False" HorizontalAlign="center"
            DataSourceID="SqlDataSource_Enunciado" CellPadding="4" ForeColor="Black"
            GridLines="Vertical" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" DataKeyNames="Id_Configuracao" EnableModelValidation="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Id_Configuracao" HeaderText="Id" SortExpression="Id_Configuracao" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Capitulo" HeaderText="Id Capítulo" SortExpression="Capitulo" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Dificuldade" HeaderText="Dificuldade" SortExpression="Dificuldade" />
                <asp:BoundField DataField="Num_Perguntas" HeaderText="Numero Perguntas" SortExpression="Num_Perguntas" />
                <asp:BoundField DataField="Id_Tipoteste" HeaderText="Id Tipo Teste" SortExpression="Id_Tipoteste" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="bt_eliminar" runat="server" Text="Eliminar" CommandName="Delete" OnClientClick="return confirm('Tem a certeza que quer eliminar este registo?');" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
                <!--SqlDataSource, onde são feitos os comandos em MySQL, para podermos editar 
                                    (fazer update) informação contida na tabela assim como eliminar informação da mesma
                
                    SelectCommand: Comando em MySQL para efetuar a listagem dos capitulos existentes
                    UpdateCommand: Comando em MySQL chamado pelo botão editar, e que vai fazer o update na BD da tabela capitulo
                                   e dos campos modificados
                    DeleteCommand: Comando em MySQL chamado pelo botão eliminar, para eliminar dados da tabela capitulo
                    
                    DeleteParameters: São os campos a eliminar depois de efetuado o Deletecommand-->
        <asp:SqlDataSource ID="SqlDataSource_Enunciado" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
            SelectCommand="SELECT * FROM enunciados"
            DeleteCommand="DELETE FROM enunciados WHERE Id_Configuracao = @original_Id_Configuracao" OldValuesParameterFormatString="original_{0}"
            ProviderName="MySql.Data.MySqlClient">
            <DeleteParameters>
                <asp:Parameter Name="original_Id_Configuracao" Type="Int32" />
                <asp:Parameter Name="original_Capitulo" Type="Int32" />
                <asp:Parameter Name="original_Dificuldade" Type="Int32" />
                <asp:Parameter Name="original_Num_Perguntas" Type="Int32" />
                <asp:Parameter Name="original_Id_Tipoteste" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>
        <br />
        <!--Label com o nome do que se quer inserir na BD com as respetivas formatações(cores,etc..)-->
        <asp:Label ID="lbl_Numtestes" runat="server" Text="Número Testes Gerar:" Style="font-weight: 700; color: #666666; font-size: medium;"></asp:Label>
        <!--Campo para inserir o número de testes que deseja gerar-->
        <asp:TextBox ID="txt_Numtestes" runat="server"></asp:TextBox>
        <!--RequiredFieldValidator aparece quando o campo da textbox estiver vazio, ou seja, requer um preenchimento obrigatório-->
        <asp:RequiredFieldValidator InitialValue="0" ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_Numtestes" ErrorMessage="(*)"></asp:RequiredFieldValidator>
        <br />
        <br />
        <br />
        <br />
        <p style="text-align: right">
            <!--Botão com um evento para gerar os testes em PDF-->
            <asp:Button ID="bt_GeraTeste" runat="server" Text="Gerar Teste" Width="102px" OnClick="bt_GeraTeste_Click" Style="text-align: right" />
        </p>
        </td>
             </tr>
        </table>
    </div>
    </asp:Content>