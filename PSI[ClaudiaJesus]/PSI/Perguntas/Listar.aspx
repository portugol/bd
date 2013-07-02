<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="Perguntas_Listar" Title="Painel Administração" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>
    <table>
        <tr>
            <!--Título da tabela e respetivas formatações(cores,etc..)-->
            <td style="width: 104%; font-weight: bold; font-size: 14px; font-family: Verdana; color: #ffffff; background-color: #ca5100">Listagem das Perguntas</td>
        </tr>
        <tr>
            <td style="width: 104%">
                <!--GridView: Mostra toda a informação da tabela perguntas existente na BD 
                              (através de um DATASOURCE que contém um comando Select em MySQL) 
                    
                    ItemTemplate: São os campos que pretendemos mostrar na GridView, mas com impossibilidade 
                                  de serem alterados/editados/modificados, estão estáticos
                    EditItemTemplate: São os campos que pretendemos mostrar na GridView, mas agora com possibilidade 
                                      para serem alterados/editados/modificados, após ter-se clicado no botão de "Editar"-->
                <asp:GridView ID="GrdvList_Perg" runat="server" AllowPaging="True"
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="SqlDataSource_PergList" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" DataKeyNames="Id" EnableModelValidation="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Id">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Id" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Pergunta">
                            <EditItemTemplate>
                                <cc1:Editor ID="Editor" runat="server" Content='<%# Bind("Pergunta") %>' Width="500px" NoUnicode="True" />
                                <!--RequiredFieldValidator aparece quando o campo da textbox estiver vazio, ou seja, requer um preenchimento obrigatório-->
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ControlToValidate="Editor" ErrorMessage="(*)"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_Pergunta" runat="server" Text='<%# Eval("Pergunta") %>' Font-Names="Verdana" Font-Size="12px"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Dificuldade">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Dificuldade" runat="server" Text='<%# Bind("Dificuldade") %>'></asp:TextBox>
                                <!--RequiredFieldValidator aparece quando o campo da textbox estiver vazio, ou seja, requer um preenchimento obrigatório-->
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_Dificuldade" ErrorMessage="(*)"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_Dificuldade" runat="server" Text='<%# Bind("Dificuldade") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Id Capítulo">
                            <EditItemTemplate>
                                <!--Campo para seleção e inserção do número do capitulo a que a pergunta vai pertencer-->
                                <asp:DropDownList ID="Drop_Capitulo" runat="server" DataSourceID="SqlDataSource_CapituloID" DataTextField="Nome" DataValueField="Id" AppendDataBoundItems="true" OnSelectedIndexChanged="Drop_Capitulo_SelectedIndexChanged" AutoPostBack="true" EnableViewState="true">
                                    <asp:ListItem Value="0" Selected="True">Escolha uma opção</asp:ListItem>
                                </asp:DropDownList>
                                <!--RequiredFieldValidator aparece quando o campo da textbox estiver vazio, ou seja, requer um preenchimento obrigatório-->
                                <asp:RequiredFieldValidator InitialValue="0" ID="RequiredFieldValidator3" runat="server" ControlToValidate="Drop_Capitulo" ErrorMessage="(*)"></asp:RequiredFieldValidator>
                                <!--SqlDataSource, onde são feitos os comandos em MySQL
                                                   SelectCommand: Comando em MySQL para efetuar a listagem dos testes existentes-->
                                <asp:SqlDataSource ID="SqlDataSource_CapituloID" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
                                    SelectCommand="SELECT Id, Nome FROM capitulo" ProviderName="MySql.Data.MySqlClient"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_CapituloId" runat="server" Text='<%# Bind("CapituloId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tipo Pergunta">
                            <EditItemTemplate>
                                <!--Campo para seleção e inserção do número do Tipo de pergunta a que a pergunta vai pertencer-->
                                <asp:DropDownList ID="Drop_Tipo" runat="server" DataSourceID="SqlDataSource_TipoPerg" DataTextField="Tipo" DataValueField="Id" AppendDataBoundItems="true" OnSelectedIndexChanged="Drop_Tipo_SelectedIndexChanged" AutoPostBack="true" EnableViewState="true">
                                    <asp:ListItem Value="0" Selected="True">Escolha uma opção</asp:ListItem>
                                </asp:DropDownList>
                                <!--RequiredFieldValidator aparece quando o campo da textbox estiver vazio, ou seja, requer um preenchimento obrigatório-->
                                <asp:RequiredFieldValidator InitialValue="0" ID="RequiredFieldValidator4" runat="server" ControlToValidate="Drop_Tipo" ErrorMessage="(*)"></asp:RequiredFieldValidator>
                                <!--SqlDataSource, onde são feitos os comandos em MySQL
                                                   SelectCommand: Comando em MySQL para efetuar a listagem do tipo de perguntas existentes-->
                                <asp:SqlDataSource ID="SqlDataSource_TipoPerg" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
                                    SelectCommand="SELECT Id, Tipo FROM Tipo_Perg" ProviderName="MySql.Data.MySqlClient"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_TipoPg" runat="server" Text='<%# Bind("TipoPg") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Lingua">
                            <EditItemTemplate>
                                <!--Campo para seleção e inserção do número do Tipo de pergunta a que a pergunta vai pertencer-->
                                <asp:DropDownList ID="Drop_Lingua" runat="server" DataSourceID="SqlDataSource_Lingua" DataTextField="Lingua" DataValueField="IdLingua" AppendDataBoundItems="true" OnSelectedIndexChanged="Drop_Lingua_SelectedIndexChanged" AutoPostBack="true" EnableViewState="true">
                                    <asp:ListItem Value="0" Selected="True">Escolha uma opção</asp:ListItem>
                                </asp:DropDownList>
                                <!--RequiredFieldValidator aparece quando o campo da textbox estiver vazio, ou seja, requer um preenchimento obrigatório-->
                                <asp:RequiredFieldValidator InitialValue="0" ID="RequiredFieldValidator5" runat="server" ControlToValidate="Drop_Lingua" ErrorMessage="(*)"></asp:RequiredFieldValidator>
                                <!--SqlDataSource, onde são feitos os comandos em MySQL
                                                   SelectCommand: Comando em MySQL para efetuar a listagem das linguagens existentes-->
                                <asp:SqlDataSource ID="SqlDataSource_Lingua" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
                                        SelectCommand="SELECT IdLingua, Lingua FROM lingua" ProviderName="MySql.Data.MySqlClient"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_Lingua" runat="server" Text='<%# Bind("Lingua") %>'></asp:Label>
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

                <!--SqlDataSource, onde são feitos os comandos em MySQL, para podermos editar 
                                    (fazer update) informação contida na tabela assim como eliminar informação da mesma
                
                    SelectCommand: Comando em MySQL para efetuar a listagem dos capitulos existentes
                    UpdateCommand: Comando em MySQL chamado pelo botão editar, e que vai fazer o update na BD da tabela capitulo
                                   e dos campos modificados
                    DeleteCommand: Comando em MySQL chamado pelo botão eliminar, para eliminar dados da tabela capitulo
                    
                    DeleteParameters: São os campos a eliminar depois de efetuado o Deletecommand
                    UpdateParameters: São os campos aos quais vamos fazer update (editar)-->
                <asp:SqlDataSource ID="SqlDataSource_PergList" runat="server"
                    OnUpdating="SqlDataSource_IdCT"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
                    SelectCommand="SELECT * FROM perguntas"
                    DeleteCommand="DELETE FROM perguntas WHERE Id = @original_Id"
                    UpdateCommand="UPDATE perguntas SET Pergunta = @Pergunta , Dificuldade = @Dificuldade ,CapituloId=@idCap, TipoPg=@idTipo, Lingua=@idLingua WHERE Id = @original_Id" ConflictDetection="CompareAllValues"
                    InsertCommand="INSERT INTO perguntas (Pergunta, Dificuldade, CapituloId, TipoPg, Lingua) VALUES (@Pergunta, @Dificuldade, @CapituloId, @TipoPg, @Lingua)" OldValuesParameterFormatString="original_{0}"
                    ProviderName="MySql.Data.MySqlClient">
                   <UpdateParameters>
                        <asp:Parameter Name="Pergunta" Type="String" />
                        <asp:Parameter Name="Dificuldade" Type="Int32" />
                        <asp:Parameter Name="idCap" Type="String" />
                        <asp:Parameter Name="idTipo" Type="String" />
                        <asp:Parameter Name="idLingua" Type="String" />
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_Pergunta" Type="String" />
                        <asp:Parameter Name="original_Dificuldade" Type="Int32" />
                        <asp:Parameter Name="original_idCap" Type="String" />
                        <asp:Parameter Name="original_idTipo" Type="String" />
                        <asp:Parameter Name="original_idLingua" Type="String" />
                    </UpdateParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_Pergunta" Type="String" />
                        <asp:Parameter Name="original_Dificuldade" Type="Int32" />
                        <asp:Parameter Name="original_CapituloId" Type="String" />
                        <asp:Parameter Name="original_TipoPg" Type="String" />
                        <asp:Parameter Name="original_idLingua" Type="String" />
                    </DeleteParameters>
                </asp:SqlDataSource>
                
                <!--label utilizada para guardar o valor retirado na drop do capitulo-->
                <asp:Label ID="lbl" runat="server" Visible="False" Text=""></asp:Label>
                <!--label utilizada para guardar o valor retirado na drop do tipo de pergunta-->
                <asp:Label ID="lbl2" runat="server" Visible="False" Text=""></asp:Label>
                <!--label utilizada para guardar o valor retirado na drop da lingua-->
                <asp:Label ID="lbl3" runat="server" Visible="False" Text=""></asp:Label>
                <!--label utilizada para guardar o valor retirado na drop do id do capitulo-->
                <asp:Label ID="lblteste" runat="server" Visible="False" Text=""></asp:Label>
            </td>
            <td>
                <!--Filtrar a GridView por capítulo, utilizando uma DropDownList para selecionar o capitulo desejado
                    e usando um comando em MySQL(select) para fazer essa mesma filtragem-->
                <asp:Label ID="lbl_Capitulo" runat="server" Visible="True" Text="Filtar por Capítulo:"></asp:Label>
                <asp:DropDownList ID="Drop_CapID" runat="server" DataSourceID="SqlDataSource_CapID" DataTextField="Nome" DataValueField="Id" AppendDataBoundItems="true" OnSelectedIndexChanged="Drop_CapID_SelectedIndexChanged" AutoPostBack="true" EnableViewState="true">
                    <asp:ListItem Value="0" Selected="True">Escolha uma opção</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource_CapID" runat="server"       
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
                    SelectCommand="SELECT Id,Nome FROM capitulo" ProviderName="MySql.Data.MySqlClient"></asp:SqlDataSource>
                <br /><br />
                <!--Filtrar a GridView por dificuldade, utilizando uma DropDownList para selecionar o grau de dificuldade desejado
                    e usando um comando em MySQL(select) para fazer essa mesma filtragem-->
                <asp:Label ID="lbl_Dificuldade" runat="server" Visible="True" Text="Filtar por Dificuldade:"></asp:Label>
                <asp:DropDownList ID="Drop_Dificuldade" runat="server" DataSourceID="SqlDataSource_Dificuldade" DataTextField="Dificuldade" DataValueField="Dificuldade" AppendDataBoundItems="true" OnSelectedIndexChanged="Drop_Dificuldade_SelectedIndexChanged" AutoPostBack="true" EnableViewState="true">
                    <asp:ListItem Value="0" Selected="True">Escolha uma opção</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource_Dificuldade" runat="server"       
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
                    SelectCommand="SELECT DISTINCT Dificuldade FROM perguntas" ProviderName="MySql.Data.MySqlClient"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>