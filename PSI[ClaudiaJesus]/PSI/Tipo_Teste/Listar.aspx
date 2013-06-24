<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="TipoTeste_Listar" Title="Painel Administração" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <table>
        <tr>
            <!--Título da tabela e respetivas formatações(cores,etc..)-->
            <td style="font-weight: bold; font-size: 14px; font-family: Verdana; color:#ffffff; background-color: #ca5100">Listagem do Tipo de Testes</td>
        </tr>
        <tr>
            <td> 
                <!--GridView: Mostra toda a informação da tabela tipo teste existente na BD 
                              (através de um DATASOURCE que contém um comando Select em MySQL) 
                    
                    ItemTemplate: São os campos que pretendemos mostrar na GridView, mas com impossibilidade 
                                  de serem alterados/editados/modificados, estão estáticos
                    EditItemTemplate: São os campos que pretendemos mostrar na GridView, mas agora com possibilidade 
                                      para serem alterados/editados/modificados, após ter-se clicado no botão de "Editar"-->            
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
                                <!--Campo para inserir a data de início do teste, através de um calendário do AjaxToolkit-->
                                <ajaxToolkit:CalendarExtender ID="CalendarExt_Inicio" runat="server" TargetControlID="txt_DataInicio" Format="yyyy-MM-d"></ajaxToolkit:CalendarExtender>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_DataInicio" runat="server" Text='<%# Bind("Data_Inicio") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Data Fim">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_DataFim" runat="server" Text='<%# Bind("Data_Fim") %>'></asp:TextBox>
                                <!--Campo para inserir a data de fim do teste, através de um calendário do AjaxToolkit-->
                                <ajaxToolkit:CalendarExtender ID="CalendarExt_Fim" runat="server" TargetControlID="txt_DataFim" Format="yyyy-MM-d"></ajaxToolkit:CalendarExtender>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_DataFim" runat="server" Text='<%# Bind("Data_Fim") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Duração">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Duracao" runat="server" Text='<%# Bind("Duracao") %>'></asp:TextBox>
                                <!--RequiredFieldValidator aparece quando o campo da textbox estiver vazio, ou seja, requer um preenchimento obrigatório-->
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_Duracao" ErrorMessage="(*)"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_Duracao" runat="server" Text='<%# Bind("Duracao") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descrição">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Descricao" runat="server" Text='<%# Bind("Descricao") %>'></asp:TextBox>
                                <!--RequiredFieldValidator aparece quando o campo da textbox estiver vazio, ou seja, requer um preenchimento obrigatório-->
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_Descricao" ErrorMessage="(*)"></asp:RequiredFieldValidator>
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

                <!--SqlDataSource, onde são feitos os comandos em MySQL, para podermos editar 
                                    (fazer update) informação contida na tabela assim como eliminar informação da mesma
                
                    SelectCommand: Comando em MySQL para efetuar a listagem dos tipos de teste existentes
                    UpdateCommand: Comando em MySQL chamado pelo botão editar, e que vai fazer o update na BD da tabela tipo teste
                                   e dos campos modificados
                    DeleteCommand: Comando em MySQL chamado pelo botão eliminar, para eliminar dados da tabela tipo teste
                    
                    UpdateParameters: São os campos aos quais vamos fazer update (editar)-->
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