<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="Lingua_Listar" Title="Painel Administração" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="text-align:center">
        <tr>
            <!--Título da tabela e respetivas formatações(cores,etc..)-->              
            <td style="font-weight: bold; font-size: 14px; font-family: Verdana; height: 19px; color:#ffffff; background-color: #ca5100; width: 439px;">Listagem Línguas</td> 
        </tr>
        <tr>
            <td style="width: 439px">
                <!--GridView: Mostra toda a informação da tabela lingua existente na BD 
                              (através de um DATASOURCE que contém um comando Select em MySQL) 
                    
                    ItemTemplate: São os campos que pretendemos mostrar na GridView, mas com impossibilidade 
                                  de serem alterados/editados/modificados, estão estáticos
                    EditItemTemplate: São os campos que pretendemos mostrar na GridView, mas agora com possibilidade 
                                      para serem alterados/editados/modificados, após ter-se clicado no botão de "Editar"-->
                <asp:GridView ID="GrdvList_Lingua" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource_LinguaList" CellPadding="4" ForeColor="Black" 
                    GridLines="Vertical" DataKeyNames="IdLingua" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" EnableModelValidation="True" Width="406px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Id">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Id" runat="server" Text='<%# Bind("IdLingua") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Língua">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Lingua" runat="server" Text='<%# Bind("Lingua") %>'></asp:TextBox>
                                <!--RequiredFieldValidator aparece quando o campo da textbox estiver vazio, ou seja, requer um preenchimento obrigatório-->
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ControlToValidate="txt_Lingua" ErrorMessage="(*)"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_Lingua" runat="server" Text='<%# Bind("Lingua") %>'></asp:Label>
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
                
                    SelectCommand: Comando em MySQL para efetuar a listagem das línguas existentes
                    UpdateCommand: Comando em MySQL chamado pelo botão editar, e que vai fazer o update na BD da tabela lingua
                                   e dos campos modificados
                    DeleteCommand: Comando em MySQL chamado pelo botão eliminar, para eliminar dados da tabela lingua
                    
                    DeleteParameters: São os campos a eliminar depois de efetuado o Deletecommand
                    UpdateParameters: São os campos aos quais vamos fazer update (editar)-->
                <asp:SqlDataSource ID="SqlDataSource_LinguaList" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>" 
                    SelectCommand="SELECT * FROM lingua"
                    DeleteCommand="DELETE FROM lingua WHERE IdLingua = @original_IdLingua" ConflictDetection="CompareAllValues"
                    UpdateCommand="UPDATE lingua SET Lingua = @Lingua WHERE IdLingua = @original_IdLingua"                    
                    InsertCommand="INSERT INTO lingua (Lingua) VALUES (@Lingua)" OldValuesParameterFormatString="original_{0}"
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
</asp:Content>