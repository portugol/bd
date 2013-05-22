<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Apagar.aspx.cs" Inherits="Capitulo_Apagar" Title="Painel Administração" %>
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
            <td style="font-weight: bold; font-size: 14px; font-family: Verdana; color:#ffffff; background-color:#356bb3">
                Apagar Capitulos</td>
        </tr>
        <tr>
            <td>                              
                <asp:GridView ID ="GrdvApagar_Cap" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource_CapApagar" DataKeyNames="Id" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="bt_delete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Tem a certeza que quer eliminar este registo?');"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Id" HeaderText="Id" 
                            SortExpression="Id" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="Nome" HeaderText="Nome" 
                            SortExpression="Nome" />
                        <asp:BoundField DataField="Descricao" HeaderText="Descricao" 
                            SortExpression="Descricao" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource_CapApagar" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>" 
                    SelectCommand="SELECT * FROM capitulo" 
                    DeleteCommand="DELETE FROM capitulo WHERE Id = @original_Id" ConflictDetection="CompareAllValues" 
                    InsertCommand="INSERT INTO capitulo (Nome, Descricao) VALUES (@Nome, @Descricao)" OldValuesParameterFormatString="original_{0}" 
                    UpdateCommand="UPDATE capitulo SET Nome = @Nome, Descricao = @Descricao WHERE Id = @original_Id AND ((Nome = @original_Nome) OR (Nome IS NULL AND @original_Nome IS NULL)) AND ((Descricao = @original_Descricao) OR (Descricao IS NULL AND @original_Descricao IS NULL))" 
                    ProviderName="MySql.Data.MySqlClient">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_Nome" Type="String" />
                        <asp:Parameter Name="original_Descricao" Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Nome" Type="String" />
                        <asp:Parameter Name="Descricao" Type="String" />
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_Nome" Type="String" />
                        <asp:Parameter Name="original_Descricao" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>              
            </td>
        </tr>
    </table>
    <br />
</asp:Content>

