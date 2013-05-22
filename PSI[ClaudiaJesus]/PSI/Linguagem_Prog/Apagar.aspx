<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Apagar.aspx.cs" Inherits="LingProg_Apagar" Title="Painel Administração" %>
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
            <td style="font-weight: bold; font-size: 14px; font-family: Verdana; color:#ffffff; background-color: #356bb3">
                Apagar Linguagens Programação</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GrdvApagar_LingProg" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource_LingProgApag" DataKeyNames="Id" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="bt_delete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Tem a certeza que quer eliminar este registo?');"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                </asp:GridView> 
                 <asp:SqlDataSource ID="SqlDataSource_LingProgApag" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>" 
                    SelectCommand="SELECT Id, Nome FROM linguagens_prog" ConflictDetection="CompareAllValues" 
                    DeleteCommand="DELETE FROM linguagens_prog WHERE Id = @original_Id AND Nome = @original_Nome"
                    InsertCommand="INSERT INTO linguagens_prog (Id, Nome) VALUES (@Id, @Nome)" OldValuesParameterFormatString="original_{0}" 
                    UpdateCommand="UPDATE linguagens_prog SET Nome = @Nome" 
                    ProviderName="MySql.Data.MySqlClient">
                     <DeleteParameters>
                         <asp:Parameter Name="original_Id" Type="Int32"  />
                         <asp:Parameter Name="original_Nome" Type="String" />
                     </DeleteParameters>
                     <UpdateParameters>
                         <asp:Parameter Name="Nome" Type="String" />
                         <asp:Parameter Name="original_Id" Type="Int32" />
                         <asp:Parameter Name="original_Nome" Type="String" />
                     </UpdateParameters>
                </asp:SqlDataSource>            
            </td>
        </tr>
    </table>
</asp:Content>

