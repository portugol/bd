<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="LingProg_Listar" Title="Painel Administração" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <!--Título da tabela e respetivas formatações(cores,etc..)-->
            <td style="width: 100%; font-weight: bold; font-size: 14px; font-family: Verdana; color:#ffffff; background-color: #ca5100">Listagem Linguagens Programação</td>
        </tr>
        <tr>
            <td >
                <!--GridView: Mostra toda a informação da tabela linguagens prog existente na BD 
                              (através de um DATASOURCE que contém um comando Select em MySQL) 
                    
                    ItemTemplate: São os campos que pretendemos mostrar na GridView, mas com impossibilidade 
                                  de serem alterados/editados/modificados, estão estáticos
                    EditItemTemplate: São os campos que pretendemos mostrar na GridView, mas agora com possibilidade 
                                      para serem alterados/editados/modificados, após ter-se clicado no botão de "Editar"-->
                <asp:GridView ID="GrdvList_LingProgList" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataSourceID="SqlDataSource_LingProgList" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" DataKeyNames="Id" EnableModelValidation="True" Width="386px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Id">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Id" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nome">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Nome" runat="server" Text='<%# Bind("Nome") %>'></asp:TextBox>
                                <!--RequiredFieldValidator aparece quando o campo da textbox estiver vazio, ou seja, requer um preenchimento obrigatório-->
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ControlToValidate="txt_Nome" ErrorMessage="(*)"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_Nome" runat="server" Text='<%# Bind("Nome") %>'></asp:Label>
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
                
                    SelectCommand: Comando em MySQL para efetuar a listagem das linguagens de programação existentes
                    UpdateCommand: Comando em MySQL chamado pelo botão editar, e que vai fazer o update na BD da tabela 
                                   linguagens de prog e dos campos modificados
                    DeleteCommand: Comando em MySQL chamado pelo botão eliminar, para eliminar dados da tabela linguagens de prog
                    
                    DeleteParameters: São os campos a eliminar depois de efetuado o Deletecommand 
                    UpdateParameters: São os campos aos quais vamos fazer update (editar)-->
                <asp:SqlDataSource ID="SqlDataSource_LingProgList" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>" 
                    SelectCommand="SELECT * FROM linguagens_prog"
                    DeleteCommand="DELETE FROM linguagens_prog WHERE Id = @original_Id"
                    UpdateCommand="UPDATE linguagens_prog SET Nome = @Nome WHERE Id = @original_Id AND Nome = @original_Nome" ConflictDetection="CompareAllValues" 
                    InsertCommand="INSERT INTO linguagens_prog (Nome) VALUES (@Nome)" OldValuesParameterFormatString="original_{0}"
                    ProviderName="MySql.Data.MySqlClient">
                   <UpdateParameters>
                        <asp:Parameter Name="Nome" Type="String" />
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_Nome" Type="String" />
                    </UpdateParameters>
                     <DeleteParameters>
                         <asp:Parameter Name="original_Id" Type="Int32"  />
                         <asp:Parameter Name="original_Nome" Type="String" />
                     </DeleteParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>