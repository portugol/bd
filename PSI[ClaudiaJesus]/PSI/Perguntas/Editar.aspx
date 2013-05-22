<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Editar.aspx.cs" Inherits="Perguntas_Editar" Title="Painel Administração" %>
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
                Editar Perguntas</td>
        </tr>
        <tr>
            <td>
               <asp:GridView ID="GrdvEdit_Perg" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource_PergEdit" DataKeyNames="Id" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowEditButton="True"></asp:CommandField>
                        <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="False" ReadOnly="True" />
                        <asp:TemplateField HeaderText="Pergunta">
                            <ItemTemplate>
                               <asp:Label ID="lbl_Pergunta" runat="server" Text='<%# Bind("Pergunta") %>' Font-Names="Verdana" Font-Size="12px"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Dificuldade" HeaderText="Dificuldade" 
                            SortExpression="Dificuldade" />
                        <asp:BoundField DataField="CapituloId" HeaderText="CapituloId" 
                            SortExpression="CapituloId" />
                        <asp:BoundField DataField="TipoPg" HeaderText="TipoPg" 
                            SortExpression="TipoPg" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource_PergEdit" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>" 
                    SelectCommand="SELECT Id, Pergunta, Dificuldade, CapituloId, TipoPg FROM perguntas" 
                    UpdateCommand="UPDATE perguntas SET Pergunta = @Pergunta, Dificuldade = @Dificuldade, CapituloId = @CapituloId WHERE Id = @original_Id AND Pergunta = @original_Pergunta AND Dificuldade = @original_Dificuldade AND CapituloId = @original_CapituloId" ConflictDetection="CompareAllValues" 
                    DeleteCommand="DELETE FROM perguntas WHERE Id = @original_Id AND Pergunta = @original_Pergunta AND Dificuldade = @original_Dificuldade AND CapituloId = @original_CapituloId" 
                    InsertCommand="INSERT INTO perguntas (Pergunta, Dificuldade, CapituloId) VALUES (@Pergunta, @Dificuldade, @CapituloId)" 
                    OldValuesParameterFormatString="original_{0}"
                    ProviderName="MySql.Data.MySqlClient">
                    <UpdateParameters>
                        <asp:Parameter Name="Pergunta" Type="String" />
                        <asp:Parameter Name="Dificuldade" Type="Int32" />
                        <asp:Parameter Name="CapituloId" Type="Int32" />
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_Pergunta" Type="String" />
                        <asp:Parameter Name="original_Dificuldade" Type="Int32" />
                        <asp:Parameter Name="original_CapituloId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>                 
            </td>
        </tr>
    </table>
</asp:Content>

