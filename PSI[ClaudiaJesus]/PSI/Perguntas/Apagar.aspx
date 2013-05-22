<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Apagar.aspx.cs" Inherits="Perguntas_Apagar" Title="Painel Administração" %>
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
                Apagar Perguntas</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GrdvApagar_Perg" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource_PergApag" DataKeyNames="Id" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="bt_delete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Tem a certeza que quer eliminar este registo?');"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="False" ReadOnly="True" />
                        <asp:TemplateField HeaderText="Pergunta">
                            <ItemTemplate>
                               <asp:Label ID="lbl_Pergunta" runat="server" Text='<%# Eval("Pergunta") %>' Font-Names="Verdana" Font-Size="12px"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Dificuldade" HeaderText="Dificuldade" SortExpression="Dificuldade" />
                        <asp:BoundField DataField="CapituloId" HeaderText="CapituloId" SortExpression="CapituloId" />
                        <asp:BoundField DataField="TipoPg" HeaderText="Tipo" SortExpression="TipoPg" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                </asp:GridView> 
                 <asp:SqlDataSource ID="SqlDataSource_PergApag" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>" 
                    SelectCommand="SELECT Id, Pergunta, Dificuldade, CapituloId, TipoPg FROM perguntas" ConflictDetection="CompareAllValues" 
                    DeleteCommand="DELETE FROM perguntas WHERE Id = @original_Id AND Pergunta = @original_Pergunta AND Dificuldade = @original_Dificuldade AND CapituloId = @original_CapituloId AND TipoPg = @original_TipoPg" 
                    InsertCommand="INSERT INTO perguntas (Pergunta, Dificuldade, CapituloId, Tipo) VALUES (@Pergunta, @Dificuldade, @CapituloId, @TipoPg)" OldValuesParameterFormatString="original_{0}" 
                    UpdateCommand="UPDATE perguntas SET Pergunta = @Pergunta, Dificuldade = @Dificuldade, CapituloId = @CapituloId, Tipo = @Tipo WHERE Id = @original_Id AND Pergunta = @original_Pergunta AND Dificuldade = @original_Dificuldade AND CapituloId = @original_CapituloId AND TipoPg = @original_TipoPg" 
                    ProviderName="MySql.Data.MySqlClient">
                     <DeleteParameters>
                         <asp:Parameter Name="original_Id" Type="Int32"  />
                         <asp:Parameter Name="original_Pergunta" Type="String" />
                         <asp:Parameter Name="original_Dificuldade" Type="Int32" />
                         <asp:Parameter Name="original_CapituloId" Type="Int32" />
                         <asp:Parameter Name="original_TipoPg" Type="String" />
                     </DeleteParameters>
                     <UpdateParameters>
                         <asp:Parameter Name="Pergunta" Type="String" />
                         <asp:Parameter Name="Dificuldade" Type="Int32" />
                         <asp:Parameter Name="CapituloId" Type="Int32" />
                         <asp:Parameter Name="TipoPg" Type="String" />
                         <asp:Parameter Name="original_Id" Type="Int32" />
                         <asp:Parameter Name="original_Pergunta" Type="String" />
                         <asp:Parameter Name="original_Dificuldade" Type="Int32" />
                         <asp:Parameter Name="original_CapituloId" Type="Int32" />
                         <asp:Parameter Name="original_TipoPg" Type="String" />
                     </UpdateParameters>
                </asp:SqlDataSource>            
            </td>
        </tr>
    </table>
</asp:Content>

