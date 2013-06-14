<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="Resolucao_Listar" Title="Painel Administração" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>
    <table>
        <tr>
            <td style="width: 100%; font-weight: bold; font-size: 14px; font-family: Verdana; color:#ffffff; background-color: #ca5100">
                Listagem das Resoluções</td>
        </tr>
        <tr>
            <td >
                
                <asp:GridView ID="GrdvList_resolucao" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataSourceID="SqlDataSource_resolucaoList" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" DataKeyNames="Id" EnableModelValidation="True" Width="549px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                         <asp:TemplateField HeaderText="Id">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Id" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Id Pergunta">
                            <EditItemTemplate>
                                <asp:DropDownList ID="Drop_IdPergunta" runat="server" DataSourceID="SqlDataSource_PerguntaID" DataTextField="Id" DataValueField="Id" AppendDataBoundItems="true" OnSelectedIndexChanged="Drop_IdPergunta_SelectedIndexChanged" AutoPostBack="true" EnableViewState="true">
                                    <asp:ListItem Value="0" Selected="True">Escolha uma opção</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator InitialValue="0" ID="RequiredFieldValidator" runat="server" ControlToValidate="Drop_IdPergunta"
                                                    ErrorMessage="(*)"></asp:RequiredFieldValidator>
                                <asp:SqlDataSource ID="SqlDataSource_PerguntaID" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
                                    SelectCommand="SELECT Id FROM perguntas" ProviderName="MySql.Data.MySqlClient"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_IdPergunta" runat="server" Text='<%# Bind("Id_Pergunta") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Id Linguagem">
                            <EditItemTemplate>
                                <asp:DropDownList ID="Drop_IdLinguagem" runat="server" DataSourceID="SqlDataSource_LinguagemID" DataTextField="Id" DataValueField="Id" AppendDataBoundItems="true" OnSelectedIndexChanged="Drop_IdLinguagem_SelectedIndexChanged" AutoPostBack="true" EnableViewState="true">
                                    <asp:ListItem Value="0" Selected="True">Escolha uma opção</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator InitialValue="0" ID="RequiredFieldValidator2" runat="server" ControlToValidate="Drop_IdLinguagem"
                                                    ErrorMessage="(*)"></asp:RequiredFieldValidator>
                                <asp:SqlDataSource ID="SqlDataSource_LinguagemID" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
                                    SelectCommand="SELECT Id FROM linguagens_prog" ProviderName="MySql.Data.MySqlClient"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_IdLinguagens" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Resolução">
                            <EditItemTemplate>
                                <cc1:Editor ID="Editor" runat="server" Content='<%# Bind("Resolucao") %>' Width="500px" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Editor"
                                    ErrorMessage="(*)"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                               <asp:Label ID="lbl_Resolucao" runat="server" Text='<%# Eval("Resolucao") %>' Font-Names="Verdana" Font-Size="12px"></asp:Label>
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
                <asp:SqlDataSource ID="SqlDataSource_resolucaoList" runat="server"
                    OnUpdating="SqlDataSource_IdPL" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>" 
                    SelectCommand="SELECT * FROM resolucoes"
                    DeleteCommand="DELETE FROM resolucoes WHERE Id = @original_Id"
                    UpdateCommand="UPDATE resolucoes SET Id_Pergunta = @idPerg, Id_Linguagem = @idLinguagem, Resolucao = @Resolucao WHERE Id = @original_Id" ConflictDetection="CompareAllValues" 
                    InsertCommand="INSERT INTO resolucoes (Id_Pergunta, Id_Linguagem, Resolucao) VALUES (@Id_Pergunta, @Id_Linguagem, @Resolucao)" OldValuesParameterFormatString="original_{0}"
                    ProviderName="MySql.Data.MySqlClient">
                    <DeleteParameters>
                         <asp:Parameter Name="original_Id" Type="Int32"  />
                         <asp:Parameter Name="original_Id_Pergunta" Type="Int32" />
                         <asp:Parameter Name="original_Id_Linguagem" Type="Int32" />
                         <asp:Parameter Name="original_Resolucao" Type="String" />
                     </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="idPerg" Type="String" />
                        <asp:Parameter Name="idLinguagem" Type="String" />
                        <asp:Parameter Name="Resolucao" Type="String" />
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_idPerg" Type="String" />
                        <asp:Parameter Name="original_idLinguagem" Type="String" />
                        <asp:Parameter Name="original_Resolucao" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:Label ID="lbl" runat="server" Visible="false" Text=""></asp:Label>
                <asp:Label ID="lbl2" runat="server" Visible="false" Text=""></asp:Label>
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
                   <asp:Label ID="lbl_Resolucao" runat="server" Text="Resolução" Font-Names="Verdana" Font-Size="12px" Visible="False"></asp:Label>
                   <cc1:Editor ID="Editor" runat="server" width="500px" height="160px" Visible="False" NoUnicode="True"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Editor"
                        ErrorMessage="(*)" Visible="False"></asp:RequiredFieldValidator>
                </div>
                <br />
                <div>
                    <asp:Label ID="lbl_LinguagemId" runat="server" Text="Id Linguagem" Font-Names="Verdana" Font-Size="12px" Visible="False"></asp:Label>
                    <asp:DropDownList ID="Drop_LinguagemId" runat="server" DataSourceID="SqlDataSource_LinguagemID" DataTextField="Nome" DataValueField="Id" Visible="False">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource_LinguagemID" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>" 
                    SelectCommand="SELECT Id,Nome FROM linguagens_prog"  ProviderName="MySql.Data.MySqlClient"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Drop_LinguagemId"
                        ErrorMessage="(*)" Visible="False"></asp:RequiredFieldValidator>
                </div>
                <br />
                <div style="height: 50px; width: 194px"><asp:Button ID="Bt_Gravar" runat="server" Text="Gravar" BackColor="Silver" Font-Names="Verdana"
                        Font-Size="12px" OnClick="bt_Gravar" Width="87px" OnClientClick="return confirm('Tem a certeza que quer gravar este registo?');" Visible="False" />
                    <br />
                    <asp:Label ID="lbl_erro" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="12px"
                        ForeColor="#C00000" Text="Dados introduzidos com sucesso!" Visible="False"></asp:Label></div>
        </tr>
    </table>
</asp:Content>

