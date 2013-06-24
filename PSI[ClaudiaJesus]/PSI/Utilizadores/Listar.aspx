<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="Utilizadores_Listar" Title="Painel Administração" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <!--Título da tabela e respetivas formatações(cores,etc..)-->
            <td style="font-weight: bold; font-size: 14px; font-family: Verdana; color: #ffffff; background-color: #ca5100">Listagem dos Utilizadores</td>
        </tr>
        <tr>
            <td>
                <!--GridView: Mostra toda a informação da tabela utilizadores existente na BD 
                              (através de um DATASOURCE que contém um comando Select em MySQL) 
                    
                    ItemTemplate: São os campos que pretendemos mostrar na GridView, mas com impossibilidade 
                                  de serem alterados/editados/modificados, estão estáticos
                    EditItemTemplate: São os campos que pretendemos mostrar na GridView, mas agora com possibilidade 
                                      para serem alterados/editados/modificados, após ter-se clicado no botão de "Editar"-->
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
                                <!--Campo para seleção e inserção do novo número do tipo utilizador ao qual o utilizador vai pertencer-->
                                <asp:DropDownList ID="Drop_TipoUtilizador" runat="server" DataSourceID="SqlDataSource_TipoUtilizador" DataTextField="Tipo" DataValueField="Id" AppendDataBoundItems="true" OnSelectedIndexChanged="Drop_TipoUtilizador_SelectedIndexChanged" AutoPostBack="true" EnableViewState="true">
                                    <asp:ListItem Value="0" Selected="True">Escolha uma opção</asp:ListItem>
                                </asp:DropDownList>
                                <!--RequiredFieldValidator aparece quando o campo da textbox estiver vazio, ou seja, requer um preenchimento obrigatório-->
                                <asp:RequiredFieldValidator InitialValue="0" ID="RequiredFieldValidator" runat="server" ControlToValidate="Drop_TipoUtilizador" ErrorMessage="(*)"></asp:RequiredFieldValidator>
                                <!--SqlDataSource, onde são feitos os comandos em MySQL                
                                                   SelectCommand: Comando em MySQL para efetuar a listagem dos tipos de utilizadores existentes-->
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
                                <!--Campo para edição de estado do utilizador (ativo; inativo)-->
                                <asp:DropDownList ID="Drop_IsActive" runat="server" AppendDataBoundItems="true" OnSelectedIndexChanged="Drop_IsActive_SelectedIndexChanged" AutoPostBack="true" EnableViewState="true">
                                    <asp:ListItem Value="-1" Selected="True">Escolha uma opção</asp:ListItem>
                                    <asp:ListItem Value="false">Desativo</asp:ListItem>
                                    <asp:ListItem Value="true">Ativo</asp:ListItem>
                                </asp:DropDownList>
                                <!--RequiredFieldValidator aparece quando o campo da textbox estiver vazio, ou seja, requer um preenchimento obrigatório-->
                                <asp:RequiredFieldValidator InitialValue="0" ID="RequiredFieldValidator2" runat="server" ControlToValidate="Drop_IsActive" ErrorMessage="(*)"></asp:RequiredFieldValidator>
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

                <!--SqlDataSource, onde são feitos os comandos em MySQL, para podermos editar 
                                    (fazer update) informação contida na tabela assim como eliminar informação da mesma
                    OnUpdating: codigo feito em code behind, recebe um valor e é atribuido a um parametro

                    SelectCommand: Comando em MySQL para efetuar a listagem dos utilizadores existentes
                    UpdateCommand: Comando em MySQL chamado pelo botão editar, e que vai fazer o update na BD da tabela utilizadores
                                   e dos campos modificados
                    
                    UpdateParameters: São os campos aos quais vamos fazer update (editar)-->
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
                <!--label utilizada para guardar o valor retirado na drop do tipo de utilizador-->
                <asp:Label ID="lbl" runat="server" Visible="False" Text=""></asp:Label>
                <!--label utilizada para guardar o valor retirado na drop do Is Active-->
                <asp:Label ID="lbl2" runat="server" Visible="False" Text=""></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>