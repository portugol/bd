<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Teste.aspx.cs" Inherits="Teste" Title="Painel Administração" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 style="text-align: center"><strong>Testes</strong></h1>
    <div>
        <table style="width: 100%;">
            <tr>
                <td style="width: 141px">
                    <asp:Menu ID="Menu1" runat="server" DataSourceID="XmlDataSource_PSI" StaticSubMenuIndent="10px" BackColor="#636363" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#FFFFFF">
                        <DataBindings>
                            <asp:MenuItemBinding DataMember="item" NavigateUrlField="url" TextField="textoParaEcra" />
                        </DataBindings>
                        <DynamicHoverStyle BackColor="#C0C0C0" ForeColor="White" />
                        <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                        <DynamicMenuStyle BackColor="#636363" />
                        <DynamicSelectedStyle BackColor="#1C5E55" />
                        <StaticHoverStyle BackColor="#C0C0C0" ForeColor="White" />
                        <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                        <StaticSelectedStyle BackColor="#1C5E55" />
                    </asp:Menu>
                    <asp:XmlDataSource ID="XmlDataSource_PSI" runat="server" DataFile="~/menu/menu_Admin.xml" XPath="/menu/*"></asp:XmlDataSource>
                </td>
                <td>
                    <p style="text-align: center">
                        <asp:Label ID="lbl_Descricao" runat="server" Text="Descricao" Style="font-size: medium; color: #666666; font-weight: 700;"></asp:Label>
                        <asp:DropDownList ID="Drop_Descricao" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource_Descricao" DataTextField="Descricao" DataValueField="Id" AppendDataBoundItems="true" OnSelectedIndexChanged="Drop_Descricao_SelectedIndexChanged" EnableViewState="true">
                            <asp:ListItem Value="0" Selected="True">Escolha uma opção</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator InitialValue="0" ID="RequiredFieldValidator1" runat="server" ControlToValidate="Drop_Descricao"
                            ErrorMessage="(*)"></asp:RequiredFieldValidator>
                        <asp:SqlDataSource ID="SqlDataSource_Descricao" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
                            SelectCommand="SELECT Id, Descricao FROM tipo_teste"
                            ProviderName="MySql.Data.MySqlClient"></asp:SqlDataSource>
                        <br />
                        <asp:Label ID="lbl_idDescricao" runat="server" Visible="true"></asp:Label>
                        <br />
                        <span style="font-size: medium; color: #666666;"><strong>Data Inicio:</strong></span>&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lbl_DataInicio" runat="server" Text="" Style="font-weight: 700; color: #666666"></asp:Label>
                        <br />
                        <span style="font-size: medium"><span style="color: #666666"><strong>Data Fim:</strong></span>&nbsp;</span>&nbsp;&nbsp;
                        <asp:Label ID="lbl_DataFim" runat="server" Text="" Style="font-weight: 700; color: #666666"></asp:Label>
                        </p>
                        <p style="text-align: center">
                        <asp:Label ID="lbl_Capitulo" runat="server" Text="Capitulo" Style="font-size: medium; font-weight: 700; color: #666666;"></asp:Label>
                        <asp:DropDownList ID="Drop_Capitulo" runat="server" DataSourceID="SqlDataSource_CapList" DataTextField="Nome" DataValueField="Id" AppendDataBoundItems="true" AutoPostBack="true" EnableViewState="true" OnSelectedIndexChanged="Drop_Capitulo_SelectedIndexChanged">
                            <asp:ListItem Value="0" Selected="True">Escolha uma opção</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="lbl_cap" runat="server" Text="" Visible="true"></asp:Label>
                        <asp:RequiredFieldValidator InitialValue="0" ID="RequiredFieldValidator2" runat="server" ControlToValidate="Drop_Capitulo"
                            ErrorMessage="(*)"></asp:RequiredFieldValidator>
                        <asp:SqlDataSource ID="SqlDataSource_CapList" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
                            ProviderName="MySql.Data.MySqlClient"
                            SelectCommand="SELECT Nome, Id FROM capitulo"></asp:SqlDataSource>
                    </p>
                    <p style="text-align: center">
                        <asp:Label ID="lbl_Dificuldade" runat="server" Text="Dificuldade" Style="font-size: medium; font-weight: 700; color: #666666;"></asp:Label>
                        <asp:DropDownList ID="Drop_Dificuldade" runat="server" DataSourceID="SqlDataSource_Dificuldade" DataTextField="Dificuldade" DataValueField="Dificuldade" AppendDataBoundItems="true" OnSelectedIndexChanged="Drop_Dificuldade_SelectedIndexChanged" AutoPostBack="true" EnableViewState="true">
                            <asp:ListItem Value="0" Selected="True">Escolha uma opção</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator InitialValue="0" ID="RequiredFieldValidator3" runat="server" ControlToValidate="Drop_Dificuldade"
                            ErrorMessage="(*)"></asp:RequiredFieldValidator>
                        <asp:Label ID="lbl_dif" runat="server" Text="" Visible="true"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource_Dificuldade" runat="server"
                            ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
                            SelectCommand="SELECT DISTINCT Dificuldade FROM perguntas" ProviderName="MySql.Data.MySqlClient">
                        </asp:SqlDataSource>
                        <asp:Label ID="lbl_NumPerg" runat="server" Text="NºPerguntas" Style="font-size: medium; font-weight: 700; color: #666666;"></asp:Label>
                        <asp:TextBox ID="txt_nperg" runat="server"></asp:TextBox>
                    </p>
                    <asp:Label ID="lbl_erro" runat="server" Text="" Style="color: #FF0000"></asp:Label>
                    <br />
                    <br />
                    <p style="text-align: center">
                        <asp:Button ID="bt_Adicionar" runat="server" Text="Adicionar Mais" OnClick="bt_Adicionar_Click"></asp:Button>
                    </p>
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
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource_Enunciado" runat="server"
                        ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
                        SelectCommand="SELECT * FROM enunciados" ProviderName="MySql.Data.MySqlClient"></asp:SqlDataSource>
                    <br />
                    <asp:Label ID="lbl_Numtestes" runat="server" Text="Número Testes Gerar:" Style="font-weight: 700; color: #666666; font-size: medium;"></asp:Label>
                    <asp:TextBox ID="txt_Numtestes" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator InitialValue="0" ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_Numtestes"
                        ErrorMessage="(*)"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="lbl" runat="server" Text=""></asp:Label>
                    <br />
                    <p style="text-align: right">
                        <asp:Button ID="bt_GeraTeste" runat="server" Text="Gerar Teste" Width="102px" OnClick="bt_GeraTeste_Click" Style="text-align: right" />
                    </p>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>