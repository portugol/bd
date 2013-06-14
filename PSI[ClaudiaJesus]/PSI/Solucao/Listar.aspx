<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="Solucao_Listar" Title="Painel Administração" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td style="font-weight: bold; font-size: 14px; font-family: Verdana; color: #ffffff; background-color: #ca5100">Listagem das Soluções</td>
        </tr>
        <tr>
            <td>

                <asp:GridView ID="GrdvList_SolucoesList" runat="server" AllowPaging="True"
                    AllowSorting="True" AutoGenerateColumns="False"
                    DataSourceID="SqlDataSource_SolucoesList" CellPadding="4" ForeColor="Black"
                    GridLines="Vertical" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" DataKeyNames="Id" EnableModelValidation="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Id">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Id" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Entradas">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Entradas" runat="server" Text='<%# Bind("Entradas") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ControlToValidate="txt_Entradas"
                                    ErrorMessage="(*)"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_Entradas" runat="server" Text='<%# Bind("Entradas") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Saídas">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Saidas" runat="server" Text='<%# Bind("Saidas") %>' TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_Saidas"
                                    ErrorMessage="(*)"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_Saidas" runat="server" Text='<%# Bind("Saidas") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Id Perguntas">
                            <ItemTemplate>
                                <asp:Label ID="lbl_PerguntaId" runat="server" Text='<%# Bind("PerguntasId") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="Drop_Perguntaid" runat="server" DataSourceID="SqlDataSource_PerguntaID" DataTextField="Id" DataValueField="Id" AppendDataBoundItems="true" OnSelectedIndexChanged="Drop_Perguntaid_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="0" Selected="True">Escolha uma opção</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator InitialValue="0" ID="RequiredFieldValidator3" runat="server" ControlToValidate="Drop_Perguntaid"
                                    ErrorMessage="(*)"></asp:RequiredFieldValidator>
                                <asp:SqlDataSource ID="SqlDataSource_PerguntaID" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
                                    SelectCommand="SELECT Id FROM perguntas" ProviderName="MySql.Data.MySqlClient"></asp:SqlDataSource>
                            </EditItemTemplate>
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
                                <asp:Button ID="bt_eliminar" runat="server" Text="Eliminar" CommandName="Delete" OnClientClick="return confirm('Tem a certeza que quer eliminar este registo?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource_PerguntaID" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
                    SelectCommand="SELECT Id FROM perguntas"
                    ProviderName="MySql.Data.MySqlClient"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource_SolucoesList" runat="server"
                    OnUpdating="SqlDataSource_IdPg"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
                    SelectCommand="SELECT * FROM solucao"
                    DeleteCommand="DELETE FROM solucao WHERE Id = @original_Id"
                    UpdateCommand="UPDATE solucao SET Entradas = @Entradas, Saidas = @Saidas, PerguntasId = @idPg WHERE Id = @original_Id" ConflictDetection="CompareAllValues"
                    InsertCommand="INSERT INTO solucao (Entradas, Saidas, PerguntasId) VALUES (@Entradas, @Saidas, @PerguntasId)" OldValuesParameterFormatString="original_{0}"
                    ProviderName="MySql.Data.MySqlClient">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_Entradas" Type="String" />
                        <asp:Parameter Name="original_Saidas" Type="String" />
                        <asp:Parameter Name="original_PerguntasId" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Entradas" Type="String" />
                        <asp:Parameter Name="Saidas" Type="String" />
                        <asp:Parameter Name="idPg" Type="Int32" />
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_Entradas" Type="String" />
                        <asp:Parameter Name="original_Saidas" Type="String" />
                        <asp:Parameter Name="original_idPg" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:Label ID="lbl" runat="server" Visible="False" Text=""></asp:Label>
            </td>
            <td>
                <asp:Button ID="bt_Adicionar" runat="server" Text="Adicionar" OnClick="bt_Adicionar_Click" />
            </td>
            <td style="width: 155px; text-align: right">
                <div>
                    <asp:Label ID="lbl_Pergunta" runat="server" Font-Names="Verdana" Font-Size="12px" Text="Pergunta:" Visible="False" Style="font-weight: 700; font-size: medium"></asp:Label>
                    <asp:Label ID="lbl_PgId" runat="server" Font-Names="Verdana" Font-Size="12px" Visible="False"></asp:Label>
                </div>
                <br />
                <div>
                    <asp:Label ID="lbl_entradas" runat="server" Font-Names="Verdana" Font-Size="12px" Text="Entradas" Visible="False"></asp:Label>
                    <asp:TextBox ID="txt_entradas" runat="server" Visible="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_saidas"
                        ErrorMessage="(*)" Visible="False"></asp:RequiredFieldValidator>
                </div>
                <br />
                <div>
                    <asp:Label ID="lbl_saidas" runat="server" Font-Names="Verdana" Font-Size="12px" Text="Saidas" Visible="False"></asp:Label>
                    <asp:TextBox ID="txt_saidas" runat="server" Height="81px" TextMode="MultiLine" Width="193px" Visible="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_saidas"
                        ErrorMessage="(*)" Visible="False"></asp:RequiredFieldValidator>
                </div>
                <br />
                <div style="height: 50px; width: 194px"><asp:Button ID="Bt_Gravar" runat="server" Text="Gravar" BackColor="Silver" Font-Names="Verdana"
                        Font-Size="12px" OnClick="bt_Gravar" Width="87px" OnClientClick="return confirm('Tem a certeza que quer gravar este registo?');" Visible="False" />
                    <br />
                    <asp:Label ID="lbl_erro" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="12px"
                        ForeColor="#C00000" Text="Dados introduzidos com sucesso!" Visible="False"></asp:Label>
                </div>
                <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
                   <asp:Button ID="Bt_Solucao" runat="server" Text="Resolução >" BackColor="Silver" Font-Names="Verdana"
                    Font-Size="12px" OnClick="bt_Solucao" Width="87px" />
        </tr>
    </table>
</asp:Content>

