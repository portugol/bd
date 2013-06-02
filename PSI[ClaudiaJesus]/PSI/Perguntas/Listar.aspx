<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="Perguntas_Listar" Title="Painel Administração" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>
    <table>
        <tr>
            <td rowspan="2">
                   <asp:Menu ID="Menu1" runat="server" DataSourceID="XmlDataSource_PSI" StaticSubMenuIndent="10px" BackColor="#636363" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#FFFFFF">
                        <DataBindings>
                            <asp:MenuItemBinding DataMember="item" NavigateUrlField="url" TextField="textoParaEcra" />
                        </DataBindings>
                        <DynamicHoverStyle BackColor="#C0C0C0" ForeColor="White" />
                        <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                        <DynamicMenuStyle BackColor="#636363" />
                        <DynamicSelectedStyle BackColor="#1C5E55" />
                        <StaticHoverStyle BackColor="#C0C0C0" ForeColor="White" />
                        <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                        <StaticSelectedStyle BackColor="#1C5E55" />
                    </asp:Menu>
                    <asp:XmlDataSource ID="XmlDataSource_PSI" runat="server" DataFile="~/menu/menu_Admin.xml" XPath="/menu/*"></asp:XmlDataSource>
            </td>
            <td style="width: 104%; font-weight: bold; font-size: 14px; font-family: Verdana; color: #ffffff; background-color: #ca5100">Listagem das Perguntas</td>
        </tr>
        <tr>
            <td style="width: 104%">
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
                                <cc1:Editor ID="Editor" runat="server" Content='<%# Bind("Pergunta") %>' Width="500px" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ControlToValidate="Editor"
                                    ErrorMessage="(*)"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_Pergunta" runat="server" Text='<%# Eval("Pergunta") %>' Font-Names="Verdana" Font-Size="12px"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Dificuldade">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Dificuldade" runat="server" Text='<%# Bind("Dificuldade") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_Dificuldade"
                                    ErrorMessage="(*)"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_Dificuldade" runat="server" Text='<%# Bind("Dificuldade") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Id Capítulo">
                            <EditItemTemplate>
                                <asp:DropDownList ID="Drop_Capitulo" runat="server" DataSourceID="SqlDataSource_CapituloID" DataTextField="Nome" DataValueField="Id" AppendDataBoundItems="true" OnSelectedIndexChanged="Drop_Capitulo_SelectedIndexChanged" AutoPostBack="true" EnableViewState="true">
                                    <asp:ListItem Value="0" Selected="True">Escolha uma opção</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator InitialValue="0" ID="RequiredFieldValidator3" runat="server" ControlToValidate="Drop_Capitulo"
                                    ErrorMessage="(*)"></asp:RequiredFieldValidator>
                                <asp:SqlDataSource ID="SqlDataSource_CapituloID" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
                                    SelectCommand="SELECT Id, Nome FROM capitulo" ProviderName="MySql.Data.MySqlClient"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_CapituloId" runat="server" Text='<%# Bind("CapituloId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tipo Pergunta">
                            <EditItemTemplate>
                                <asp:DropDownList ID="Drop_Tipo" runat="server" DataSourceID="SqlDataSource_TipoPerg" DataTextField="Tipo" DataValueField="Id" AppendDataBoundItems="true" OnSelectedIndexChanged="Drop_Tipo_SelectedIndexChanged" AutoPostBack="true" EnableViewState="true">
                                    <asp:ListItem Value="0" Selected="True">Escolha uma opção</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator InitialValue="0" ID="RequiredFieldValidator4" runat="server" ControlToValidate="Drop_Tipo"
                                    ErrorMessage="(*)"></asp:RequiredFieldValidator>
                                <asp:SqlDataSource ID="SqlDataSource_TipoPerg" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
                                    SelectCommand="SELECT Id, Tipo FROM Tipo_Perg" ProviderName="MySql.Data.MySqlClient"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_TipoPg" runat="server" Text='<%# Bind("TipoPg") %>'></asp:Label>
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
                <asp:SqlDataSource ID="SqlDataSource_PergList" runat="server"
                    OnUpdating="SqlDataSource_IdCT"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
                    SelectCommand="SELECT * FROM perguntas"
                    DeleteCommand="DELETE FROM perguntas WHERE Id = @original_Id"
                    UpdateCommand="UPDATE perguntas SET Pergunta = @Pergunta , Dificuldade = @Dificuldade ,CapituloId=@idCap, TipoPg=@idTipo WHERE Id = @original_Id" ConflictDetection="CompareAllValues"
                    InsertCommand="INSERT INTO perguntas (Pergunta, Dificuldade, CapituloId, TipoPg) VALUES (@Pergunta, @Dificuldade, @CapituloId, @TipoPg)" OldValuesParameterFormatString="original_{0}"
                    ProviderName="MySql.Data.MySqlClient">
                    <UpdateParameters>
                        <asp:Parameter Name="Pergunta" Type="String" />
                        <asp:Parameter Name="Dificuldade" Type="Int32" />
                        <asp:Parameter Name="idCap" Type="String" />
                        <asp:Parameter Name="idTipo" Type="String" />
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_Pergunta" Type="String" />
                        <asp:Parameter Name="original_Dificuldade" Type="Int32" />
                        <asp:Parameter Name="original_idCap" Type="String" />
                        <asp:Parameter Name="original_idTipo" Type="String" />
                    </UpdateParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_Pergunta" Type="String" />
                        <asp:Parameter Name="original_Dificuldade" Type="Int32" />
                        <asp:Parameter Name="original_CapituloId" Type="String" />
                        <asp:Parameter Name="original_TipoPg" Type="String" />
                    </DeleteParameters>
                </asp:SqlDataSource>
                <asp:Label ID="lbl" runat="server" Visible="False" Text=""></asp:Label>
                <asp:Label ID="lbl2" runat="server" Visible="False" Text=""></asp:Label>
                <asp:Label ID="lblteste" runat="server" Visible="False" Text=""></asp:Label>
            </td>
            <td>
                <asp:Label ID="lbl_Capitulo" runat="server" Visible="True" Text="Filtar por Capítulo:"></asp:Label>
                <asp:DropDownList ID="Drop_CapID" runat="server" DataSourceID="SqlDataSource_CapID" DataTextField="Nome" DataValueField="Id" AppendDataBoundItems="true" OnSelectedIndexChanged="Drop_CapID_SelectedIndexChanged" AutoPostBack="true" EnableViewState="true">
                    <asp:ListItem Value="0" Selected="True">Escolha uma opção</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource_CapID" runat="server"       
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_Listar %>"
                    SelectCommand="SELECT Id,Nome FROM capitulo" ProviderName="MySql.Data.MySqlClient"></asp:SqlDataSource>
                <br /><br />

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

