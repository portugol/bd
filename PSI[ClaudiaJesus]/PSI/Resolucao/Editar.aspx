<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Editar.aspx.cs" Inherits="Resolucao_Editar" Title="Painel Administração" %>
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
                Editar Resoluções</td>
        </tr>
        <tr>
            <td>
               <asp:GridView ID="GrdvEdit_Resolucao" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource_ResolucaoEdit" DataKeyNames="Id" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowEditButton="True"></asp:CommandField>
                        <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="Id_Pergunta" HeaderText="Id_Pergunta" SortExpression="Id_Pergunta" />
                        <asp:BoundField DataField="Id_Linguagem" HeaderText="Id_Linguagem" SortExpression="Id_Linguagem" />
                        <asp:TemplateField HeaderText="Resolucao">
                            <ItemTemplate>
                               <asp:Textbox ID="lbl_Resolucao" runat="server" Text='<%# Bind("Resolucao") %>' Font-Names="Verdana" Font-Size="12px"></asp:Textbox>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource_ResolucaoEdit" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>" 
                    SelectCommand="SELECT * FROM resolucoes" 
                    UpdateCommand="UPDATE resolucoes SET Id_Pergunta = @Id_Pergunta, Id_Linguagem = @Id_Linguagem, Resolucao = @Resolucao WHERE Id = @original_Id AND Id_Pergunta = @original_Id_Pergunta AND Id_Linguagem = @original_Id_Linguagem AND Resolucao = @original_Resolucao" ConflictDetection="CompareAllValues" 
                    DeleteCommand="DELETE FROM resolucoes WHERE Id = @original_Id AND _Id_Pergunta = @original_Id_Pergunta AND Id_Linguagem = @original_Id_Linguagem AND Resolucao = @original_Resolucao" 
                    InsertCommand="INSERT INTO resolucoes (Id_Pergunta, Id_Linguagem, Resolucao) VALUES (@Id_Pergunta, @Id_Linguagem, @Resolucao)" 
                    OldValuesParameterFormatString="original_{0}"
                    ProviderName="MySql.Data.MySqlClient">
                    <UpdateParameters>
                        <asp:Parameter Name="Id_Pergunta" Type="Int32" />
                        <asp:Parameter Name="Id_Linguagem" Type="Int32" />
                        <asp:Parameter Name="Resolucao" Type="String" />
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_Id_Pergunta" Type="Int32" />
                        <asp:Parameter Name="original_Id_Linguagem" Type="Int32" />
                        <asp:Parameter Name="original_Resolucao" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>                 
            </td>
        </tr>
    </table>
</asp:Content>

