<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="Resolucao_Listar" Title="Painel Administra��o" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>
    <table>
        <tr>
            <!--T�tulo da tabela e respetivas formata��es(cores,etc..)-->
            <td style="width: 100%; font-weight: bold; font-size: 14px; font-family: Verdana; color: #ffffff; background-color: #ca5100">Listagem das Resolu��es</td>
        </tr>
        <tr>
            <td>
                <!--GridView: Mostra toda a informa��o da tabela resolucoes existente na BD 
                              (atrav�s de um DATASOURCE que cont�m um comando Select em MySQL) 
                    
                    ItemTemplate: S�o os campos que pretendemos mostrar na GridView, mas com impossibilidade 
                                  de serem alterados/editados/modificados, est�o est�ticos
                    EditItemTemplate: S�o os campos que pretendemos mostrar na GridView, mas agora com possibilidade 
                                      para serem alterados/editados/modificados, ap�s ter-se clicado no bot�o de "Editar"-->
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
                                <!--Campo para sele��o e inser��o do n�mero da pergunta correspondente � resolu��o da pergunta-->
                                <asp:DropDownList ID="Drop_IdPergunta" runat="server" DataSourceID="SqlDataSource_PerguntaID" DataTextField="Id" DataValueField="Id" AppendDataBoundItems="true" OnSelectedIndexChanged="Drop_IdPergunta_SelectedIndexChanged" AutoPostBack="true" EnableViewState="true">
                                    <asp:ListItem Value="0" Selected="True">Escolha uma op��o</asp:ListItem>
                                </asp:DropDownList>
                                <!--RequiredFieldValidator aparece quando o campo da textbox estiver vazio, ou seja, requer um preenchimento obrigat�rio-->
                                <asp:RequiredFieldValidator InitialValue="0" ID="RequiredFieldValidator" runat="server" ControlToValidate="Drop_IdPergunta" ErrorMessage="(*)"></asp:RequiredFieldValidator>
                                <!--SqlDataSource, onde s�o feitos os comandos em MySQL
                                                   SelectCommand: Comando em MySQL para efetuar a listagem das perguntas existentes-->
                                <asp:SqlDataSource ID="SqlDataSource_PerguntaID" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
                                    SelectCommand="SELECT Id FROM perguntas" ProviderName="MySql.Data.MySqlClient"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_IdPergunta" runat="server" Text='<%# Bind("Id_Pergunta") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Id Linguagem">
                            <EditItemTemplate>
                                <!--Campo para sele��o e inser��o do n�mero da linguagem correspondente � resolu��o da pergunta-->
                                <asp:DropDownList ID="Drop_IdLinguagem" runat="server" DataSourceID="SqlDataSource_LinguagemID" DataTextField="Id" DataValueField="Id" AppendDataBoundItems="true" OnSelectedIndexChanged="Drop_IdLinguagem_SelectedIndexChanged" AutoPostBack="true" EnableViewState="true">
                                    <asp:ListItem Value="0" Selected="True">Escolha uma op��o</asp:ListItem>
                                </asp:DropDownList>
                                <!--RequiredFieldValidator aparece quando o campo da textbox estiver vazio, ou seja, requer um preenchimento obrigat�rio-->
                                <asp:RequiredFieldValidator InitialValue="0" ID="RequiredFieldValidator2" runat="server" ControlToValidate="Drop_IdLinguagem" ErrorMessage="(*)"></asp:RequiredFieldValidator>
                                <!--SqlDataSource, onde s�o feitos os comandos em MySQL
                                                   SelectCommand: Comando em MySQL para efetuar a listagem das linguagens existentes-->
                                <asp:SqlDataSource ID="SqlDataSource_LinguagemID" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
                                    SelectCommand="SELECT Id FROM linguagens_prog" ProviderName="MySql.Data.MySqlClient"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_IdLinguagens" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Resolu��o">
                            <EditItemTemplate>
                                <cc1:Editor ID="Editor" runat="server" Content='<%# Bind("Resolucao") %>' Width="500px" />
                                <!--RequiredFieldValidator aparece quando o campo da textbox estiver vazio, ou seja, requer um preenchimento obrigat�rio-->
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Editor" ErrorMessage="(*)"></asp:RequiredFieldValidator>
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

                <!--SqlDataSource, onde s�o feitos os comandos em MySQL, para podermos editar 
                                    (fazer update) informa��o contida na tabela assim como eliminar informa��o da mesma
                
                    SelectCommand: Comando em MySQL para efetuar a listagem dos resolucoes existentes
                    UpdateCommand: Comando em MySQL chamado pelo bot�o editar, e que vai fazer o update na BD da tabela resolucoes
                                   e dos campos modificados
                    DeleteCommand: Comando em MySQL chamado pelo bot�o eliminar, para eliminar dados da tabela resolucoes 
                    
                    DeleteParameters: S�o os campos a eliminar depois de efetuado o Deletecommand
                    UpdateParameters: S�o os campos aos quais vamos fazer update (editar)-->
                <asp:SqlDataSource ID="SqlDataSource_resolucaoList" runat="server"
                    OnUpdating="SqlDataSource_IdPL"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
                    SelectCommand="SELECT * FROM resolucoes"
                    DeleteCommand="DELETE FROM resolucoes WHERE Id = @original_Id"
                    UpdateCommand="UPDATE resolucoes SET Id_Pergunta = @idPerg, Id_Linguagem = @idLinguagem, Resolucao = @Resolucao WHERE Id = @original_Id" ConflictDetection="CompareAllValues"
                    InsertCommand="INSERT INTO resolucoes (Id_Pergunta, Id_Linguagem, Resolucao) VALUES (@Id_Pergunta, @Id_Linguagem, @Resolucao)" OldValuesParameterFormatString="original_{0}"
                    ProviderName="MySql.Data.MySqlClient">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Id" Type="Int32" />
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
                <!--label utilizada para guardar o valor retirado na drop do Id da Pergunta-->
                <asp:Label ID="lbl" runat="server" Visible="false" Text=""></asp:Label>
                <!--label utilizada para guardar o valor retirado na drop do Id da Linguagem-->
                <asp:Label ID="lbl2" runat="server" Visible="false" Text=""></asp:Label>
            </td>
            <td>
                <!--Bot�o que torna labels e textbox vis�veis para inser��o de mais resolu��es-->
                <asp:Button ID="bt_Adicionar" runat="server" Text="Adicionar" OnClick="bt_Adicionar_Click" />
            </td>
            <td style="width: 155px; text-align: right">
                <div>
                    <!--Labels que identificam a Pergunta para a qual estamos a instroduzir a resolu��o-->
                    <asp:Label ID="lbl_Pergunta" runat="server" Font-Names="Verdana" Font-Size="12px" Text="Pergunta:" Visible="False" Style="font-weight: 700; font-size: medium"></asp:Label>
                    <asp:Label ID="lbl_PgId" runat="server" Font-Names="Verdana" Font-Size="12px" Visible="False"></asp:Label>
                </div>
                <br />
                <div>
                    <!--Label com o nome do que se quer inserir na BD com as respetivas formata��es(cores,etc..)-->
                    <asp:Label ID="lbl_Resolucao" runat="server" Text="Resolu��o" Font-Names="Verdana" Font-Size="12px" Visible="False"></asp:Label>
                    <!--Campo para inserir a pergunta em HTML, atrav�s de um editor de html do AjaxToolkit-->
                    <cc1:Editor ID="Editor" runat="server" Width="500px" Height="160px" Visible="False" NoUnicode="True" />
                    <!--RequiredFieldValidator aparece quando o campo da textbox estiver vazio, ou seja, requer um preenchimento obrigat�rio-->
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Editor" ErrorMessage="(*)" Visible="False"></asp:RequiredFieldValidator>
                </div>
                <br />
                <div>
                    <!--Label com o nome do que se quer inserir na BD com as respetivas formata��es(cores,etc..)-->
                    <asp:Label ID="lbl_LinguagemId" runat="server" Text="Id Linguagem" Font-Names="Verdana" Font-Size="12px" Visible="False"></asp:Label>
                    <!--Campo para sele��o e inser��o do n�mero da linguagem correspondente ao tipo de resolu��o que se vai inserir-->
                    <asp:DropDownList ID="Drop_LinguagemId" runat="server" DataSourceID="SqlDataSource_LinguagemID" DataTextField="Nome" DataValueField="Id" Visible="False">
                    </asp:DropDownList>
                    <!--SqlDataSource, onde s�o feitos os comandos em MySQL
                                                   SelectCommand: Comando em MySQL para efetuar a listagem das linguagens de programa��o existentes-->
                    <asp:SqlDataSource ID="SqlDataSource_LinguagemID" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
                        SelectCommand="SELECT Id,Nome FROM linguagens_prog" ProviderName="MySql.Data.MySqlClient"></asp:SqlDataSource>
                    <!--RequiredFieldValidator aparece quando o campo da textbox estiver vazio, ou seja, requer um preenchimento obrigat�rio-->
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Drop_LinguagemId" ErrorMessage="(*)" Visible="False"></asp:RequiredFieldValidator>
                </div>
                <br />
                <div style="height: 50px; width: 194px">
                    <!--Bot�o com um evento para inserir dados na BD, com os respetivos dados preenchidos nas textbox e com mensagem de confirma��o de inser��o de dados-->
                    <asp:Button ID="Bt_Gravar" runat="server" Text="Gravar" BackColor="Silver" Font-Names="Verdana" Font-Size="12px" OnClick="bt_Gravar" Width="87px" OnClientClick="return confirm('Tem a certeza que quer gravar este registo?');" Visible="False" />
                    <br />
                    <!--label utilizada para mostrar mensagens de erro, quando os dados s�o introduzidos corretamente e quando n�o s�o introduzidos corretamente-->
                    <asp:Label ID="lbl_erro" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="12px" ForeColor="#C00000" Text="Dados introduzidos com sucesso!" Visible="False"></asp:Label>
                </div>
                </td>
        </tr>
    </table>
</asp:Content>