<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="TipoTeste_Listar" Title="Painel Administração" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <table>
        <tr>
            <td rowspan="2">
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
            <td style="font-weight: bold; font-size: 14px; font-family: Verdana; color:#ffffff; background-color: #ca5100">
                Listagem do Tipo de Testes</td>
        </tr>
        <tr>
            <td>             
                <asp:GridView ID="GrdvList_TipoTeste" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource_TipoTeste" CellPadding="4" ForeColor="Black" 
                    GridLines="Vertical" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" DataKeyNames="Id" EnableModelValidation="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                         <asp:TemplateField HeaderText="Id">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Id" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Data Início">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_DataInicio" runat="server" Text='<%# Bind("Data_Inicio") %>'></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CalendarExt_Inicio" runat="server" TargetControlID="txt_DataInicio" Format="yyyy-MM-d"></ajaxToolkit:CalendarExtender>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_DataInicio" runat="server" Text='<%# Bind("Data_Inicio") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Data Fim">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_DataFim" runat="server" Text='<%# Bind("Data_Fim") %>'></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CalendarExt_Fim" runat="server" TargetControlID="txt_DataFim" Format="yyyy-MM-d"></ajaxToolkit:CalendarExtender>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_DataFim" runat="server" Text='<%# Bind("Data_Fim") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Duração">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Duracao" runat="server" Text='<%# Bind("Duracao") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_Duracao"
                                    ErrorMessage="(*)"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_Duracao" runat="server" Text='<%# Bind("Duracao") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descrição">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Descricao" runat="server" Text='<%# Bind("Descricao") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_Descricao"
                                    ErrorMessage="(*)"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_Descricao" runat="server" Text='<%# Bind("Descricao") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>                      
                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:Button ID="bt_guardar" runat="server" Text="Guardar" CommandName="Update"/>
                                <asp:Button ID="bt_cancelar" runat="server" Text="Cancelar" CommandName="Cancel"/>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="bt_editar" runat="server" Text="Editar" CommandName="Edit"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource_TipoTeste" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>" 
                    SelectCommand="SELECT * FROM tipo_teste" 
                    UpdateCommand="UPDATE tipo_teste SET Data_Inicio = @Data_Inicio, Data_Fim = @Data_Fim, Duracao = @Duracao, Descricao = @Descricao WHERE Id = @original_Id"
                    InsertCommand="INSERT INTO tipo_teste (Data_Inicio, Data_Fim, Duracao, Descricao) VALUES (@Data_Inicio, @Data_Fim, @Duracao, @Descricao)" OldValuesParameterFormatString="original_{0}"
                    ProviderName="MySql.Data.MySqlClient">
                    <UpdateParameters>
                        <asp:Parameter Name="Data_Inicio" Type="DateTime" />
                        <asp:Parameter Name="Data_Fim" Type="DateTime" />
                        <asp:Parameter Name="Duracao" Type="String" />
                        <asp:Parameter Name="Descricao" Type="String" />
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_Data_Inicio" Type="DateTime" />
                        <asp:Parameter Name="original_Data_Fim" Type="DateTime" />
                        <asp:Parameter Name="original_Duracao" Type="String" />
                        <asp:Parameter Name="original_Descricao" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

