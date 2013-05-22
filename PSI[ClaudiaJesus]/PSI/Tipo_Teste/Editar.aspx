<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Editar.aspx.cs" Inherits="TipoTeste_Editar" Title="Painel Administração" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
                        <td rowspan="2">
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
            <td style="font-weight: bold; font-size: 14px; font-family: Verdana; height: 19px; color:#ffffff; background-color: #356bb3">
                Editar Tipo Teste</td>
        </tr>
        <tr>
            <td>                
                <asp:GridView ID="GrdvEdit_TipoTeste" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource_TipoTesteEdit" DataKeyNames="Id" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                     <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="Data_Inicio" HeaderText="Data_Inicio" SortExpression="Data_Inicio" />
                        <asp:BoundField DataField="Data_Fim" HeaderText="Data_Fim" SortExpression="Data_Fim" />
                        <asp:BoundField DataField="Duracao" HeaderText="Duracao" SortExpression="Duracao" />
                        <asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
                        <asp:BoundField DataField="Max_Perguntas" HeaderText="Max_Perguntas" SortExpression="Max_Perguntas" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource_TipoTesteEdit" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>" 
                    SelectCommand="SELECT * FROM tipo_teste"
                    UpdateCommand="UPDATE tipo_teste SET Data_Inicio = @Data_Inicio, Data_Fim = @Data_Fim, Duracao = @Duracao, Descricao = @Descricao, Max_Perguntas = @Max_Perguntas WHERE Id = @original_Id"
                    DeleteCommand="DELETE FROM tipo_teste WHERE Id = @original_Id"
                    InsertCommand="INSERT INTO tipo_teste (Data_Inicio, Data_Fim, Duracao, Descricao, Max_Perguntas) VALUES (@Data_Inicio, @Data_Fim, @Duracao, @Descricao, @Max_Perguntas)" OldValuesParameterFormatString="original_{0}" 
                    ProviderName="MySql.Data.MySqlClient">
                    <UpdateParameters>
                        <asp:Parameter Name="Data_Inicio" Type="DateTime" />
                        <asp:Parameter Name="Data_Fim" Type="DateTime" />
                        <asp:Parameter Name="Duracao" Type="String" />
                        <asp:Parameter Name="Descricao" Type="String" />
                        <asp:Parameter Name="Max_Perguntas" Type="Int32" />
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_Data_Inicio" Type="DateTime" />
                        <asp:Parameter Name="original_Data_Fim" Type="DateTime" />
                        <asp:Parameter Name="original_Duracao" Type="String" />
                        <asp:Parameter Name="original_Descricao" Type="String" />
                        <asp:Parameter Name="original_Max_Perguntas" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>             
            </td>
        </tr>
    </table>
</asp:Content>

