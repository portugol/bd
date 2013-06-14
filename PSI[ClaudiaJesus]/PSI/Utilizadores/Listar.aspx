<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="Utilizadores_Listar" Title="Painel Administração" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td style="font-weight: bold; font-size: 14px; font-family: Verdana; color: #ffffff; background-color: #ca5100">Listagem dos Utilizadores</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GrdvList_utilizadores" runat="server" AllowPaging="True"
                    AllowSorting="True" AutoGenerateColumns="False"
                    DataSourceID="SqlDataSource_utilizList" CellPadding="4" ForeColor="Black"
                    GridLines="Vertical" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" DataKeyNames="Id" EnableModelValidation="True" Width="721px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Id">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Id" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nome">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Nome" runat="server" Text='<%# Bind("Nome") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Morada">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Morada" runat="server" Text='<%# Bind("Morada") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contacto">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Contacto" runat="server" Text='<%# Bind("Contacto") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Email" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Lingua">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Lingua" runat="server" Text='<%# Bind("Lingua") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email Moodle">
                            <ItemTemplate>
                                <asp:Label ID="lbl_EmailMoodle" runat="server" Text='<%# Bind("EmailMoodle") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tipo Utilizador">
                            <EditItemTemplate>
                                <asp:DropDownList ID="Drop_TipoUtilizador" runat="server" DataSourceID="SqlDataSource_TipoUtilizador" DataTextField="Tipo" DataValueField="Id" AppendDataBoundItems="true" OnSelectedIndexChanged="Drop_TipoUtilizador_SelectedIndexChanged" AutoPostBack="true" EnableViewState="true">
                                    <asp:ListItem Value="0" Selected="True">Escolha uma opção</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator InitialValue="0" ID="RequiredFieldValidator" runat="server" ControlToValidate="Drop_TipoUtilizador"
                                    ErrorMessage="(*)"></asp:RequiredFieldValidator>
                                <asp:SqlDataSource ID="SqlDataSource_TipoUtilizador" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
                                    SelectCommand="SELECT Id, Tipo FROM Tipo_User" ProviderName="MySql.Data.MySqlClient"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_TipoUtilizador" runat="server" Text='<%# Bind("TipoUtilizador") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Username">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Username" runat="server" Text='<%# Bind("Username") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="IsActive">
                            <EditItemTemplate>
                                <asp:DropDownList ID="Drop_IsActive" runat="server" AppendDataBoundItems="true" OnSelectedIndexChanged="Drop_IsActive_SelectedIndexChanged" AutoPostBack="true" EnableViewState="true">
                                    <asp:ListItem Value="-1" Selected="True">Escolha uma opção</asp:ListItem>
                                    <asp:ListItem Value="false">Desativo</asp:ListItem>
                                    <asp:ListItem Value="true">Ativo</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator InitialValue="0" ID="RequiredFieldValidator2" runat="server" ControlToValidate="Drop_IsActive"
                                    ErrorMessage="(*)"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_IsActive" runat="server" Text='<%# Bind("IsActive") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:Button ID="bt_guardar" runat="server" Text="Guardar" CommandName="Update" />
                                <asp:Button ID="bt_cancelar" runat="server" Text="Cancelar" CommandName="Cancel" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="bt_editar" runat="server" Text="Editar" CommandName="Edit" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource_utilizList" runat="server"
                    OnUpdating="SqlDataSource_IdTipoUser"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
                    SelectCommand="SELECT * FROM utilizadores"
                    UpdateCommand="UPDATE utilizadores SET TipoUtilizador = @idTipoUtilizador, IsActive=@Active WHERE Id = @original_Id" ConflictDetection="CompareAllValues"
                    InsertCommand="INSERT INTO utilizadores (TipoUtilizador, IsActive) VALUES (@TipoUtilizador, @IsActive)" OldValuesParameterFormatString="original_{0}"
                    ProviderName="MySql.Data.MySqlClient">
                    <UpdateParameters>
                        <asp:Parameter Name="idTipoUtilizador" Type="Int32" />
                        <asp:Parameter Name="original_idTipoUtilizador" Type="Int32" />
                        <asp:Parameter Name="Active" Type="Boolean" />
                        <asp:Parameter Name="original_Active" Type="Boolean" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:Label ID="lbl" runat="server" Visible="False" Text=""></asp:Label>
                <asp:Label ID="lbl2" runat="server" Visible="False" Text=""></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
