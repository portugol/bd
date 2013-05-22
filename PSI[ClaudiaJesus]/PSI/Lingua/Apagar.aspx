<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Apagar.aspx.cs" Inherits="Lingua_Apagar" Title="Painel Administração" %>
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
                Apagar Línguas</td>
        </tr>
        <tr>
            <td>                              
                <asp:GridView ID ="GrdvApagar_Lingua" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource_LinguaApagar" DataKeyNames="IdLingua" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="bt_delete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Tem a certeza que quer eliminar este registo?');"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="IdLingua" HeaderText="IdLingua" 
                            SortExpression="IdLingua" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="Lingua" HeaderText="Lingua" 
                            SortExpression="Lingua" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource_LinguaApagar" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>" 
                    SelectCommand="SELECT * FROM lingua" 
                    DeleteCommand="DELETE FROM lingua WHERE IdLingua = @original_IdLingua" ConflictDetection="CompareAllValues" 
                    InsertCommand="INSERT INTO lingua (Lingua) VALUES (@Lingua)" OldValuesParameterFormatString="original_{0}" 
                    UpdateCommand="UPDATE lingua SET Lingua = @Lingua WHERE IdLingua = @original_IdLingua))" 
                    ProviderName="MySql.Data.MySqlClient">
                    <DeleteParameters>
                        <asp:Parameter Name="original_IdLingua" Type="String" />
                        <asp:Parameter Name="original_Lingua" Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="original_Lingua" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>              
            </td>
        </tr>
    </table>
    <br />
</asp:Content>

