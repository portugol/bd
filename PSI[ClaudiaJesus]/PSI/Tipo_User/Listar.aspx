<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="TipoUser_Listar" Title="Painel Administração"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <!--Título da tabela e respetivas formatações(cores,etc..)-->
            <td style="font-weight: bold; font-size: 14px; font-family: Verdana; color:#ffffff; background-color: #ca5100">Listagem dos Tipos de Utilizadores</td>
        </tr>
        <tr>
            <td>
                <!--GridView: Mostra toda a informação da tabela tipo teste existente na BD 
                              (através de um DATASOURCE que contém um comando Select em MySQL) 
                    
                    ItemTemplate: São os campos que pretendemos mostrar na GridView, mas com impossibilidade 
                                  de serem alterados/editados/modificados, estão estáticos
                    EditItemTemplate: São os campos que pretendemos mostrar na GridView, mas agora com possibilidade 
                                      para serem alterados/editados/modificados, após ter-se clicado no botão de "Editar"-->              
                <asp:GridView ID="GrdvList_TipoUser" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource_TipoUserList" CellPadding="4" ForeColor="Black" 
                    GridLines="Vertical" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" DataKeyNames="Id" EnableModelValidation="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Id">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Id" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tipo">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Tipo" runat="server" Text='<%# Bind("Tipo") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_Tipo" ErrorMessage="(*)"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_Tipo" runat="server" Text='<%# Bind("Tipo") %>'></asp:Label>
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
                                <asp:Button ID="bt_eliminar" runat="server" Text="Eliminar" CommandName="Delete" OnClientClick="return confirm('Tem a certeza que quer eliminar este registo?');"/>
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
                
                    SelectCommand: Comando em MySQL para efetuar a listagem dos tipos de utilizadores existentes
                    UpdateCommand: Comando em MySQL chamado pelo botão editar, e que vai fazer o update na BD da tabela Tipo User
                                   e dos campos modificados
                    DeleteCommand: Comando em MySQL chamado pelo botão eliminar, para eliminar dados da tabela Tipo User
                    
                    DeleteParameters: São os campos a eliminar depois de efetuado o Deletecommand
                    UpdateParameters: São os campos aos quais vamos fazer update (editar)-->
                <asp:SqlDataSource ID="SqlDataSource_TipoUserList" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>" 
                    SelectCommand="SELECT * FROM Tipo_User" 
                    DeleteCommand="DELETE FROM Tipo_User WHERE Id = @original_Id AND Tipo = @original_Tipo" 
                    UpdateCommand="UPDATE Tipo_User SET Tipo = @Tipo WHERE Id = @original_Id AND Tipo = @original_Tipo" ConflictDetection="CompareAllValues" 
                    InsertCommand="INSERT INTO Tipo_User (Tipo) VALUES (@Tipo)" OldValuesParameterFormatString="original_{0}"
                    ProviderName="MySql.Data.MySqlClient">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_Tipo" Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Tipo" Type="String" />
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_Tipo" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>