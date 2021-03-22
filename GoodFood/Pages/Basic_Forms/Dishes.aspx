<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dishes.aspx.cs" Inherits="GoodFood.Customers" %>

<asp:Content ID="headDish" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Dishes</title>
</asp:Content>

<asp:Content ID="bodyDish" ContentPlaceHolderID="bodyContent" runat="server">

    <h1 class="text-center">Data from the Dishes table</h1>
    <div class="margin-half"></div>

    <form id="dishForm" runat="server">
        <asp:SqlDataSource ID="DishDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;DISH_CODE&quot;, &quot;NAME&quot;, &quot;ORIGIN&quot;, &quot;LOCAL_NAME&quot; FROM &quot;DISHES&quot;" DeleteCommand="DELETE FROM &quot;DISHES&quot; WHERE &quot;DISH_CODE&quot; = :DISH_CODE" InsertCommand="INSERT INTO &quot;DISHES&quot; (&quot;DISH_CODE&quot;, &quot;NAME&quot;, &quot;ORIGIN&quot;, &quot;LOCAL_NAME&quot;) VALUES (:DISH_CODE, :NAME, :ORIGIN, :LOCAL_NAME)" UpdateCommand="UPDATE &quot;DISHES&quot; SET &quot;NAME&quot; = :NAME, &quot;ORIGIN&quot; = :ORIGIN, &quot;LOCAL_NAME&quot; = :LOCAL_NAME WHERE &quot;DISH_CODE&quot; = :DISH_CODE">
            <DeleteParameters>
                <asp:Parameter Name="DISH_CODE" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="DISH_CODE" Type="String" />
                <asp:Parameter Name="NAME" Type="String" />
                <asp:Parameter Name="ORIGIN" Type="String" />
                <asp:Parameter Name="LOCAL_NAME" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="NAME" Type="String" />
                <asp:Parameter Name="ORIGIN" Type="String" />
                <asp:Parameter Name="LOCAL_NAME" Type="String" />
                <asp:Parameter Name="DISH_CODE" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>


        <asp:GridView CssClass="table table-active" ID="DishGridView" runat="server" BackColor="White" Width="1200px" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False" DataKeyNames="DISH_CODE" DataSourceID="DishDataSource">


            <%-- Auto generated design for gridview starts --%>
            <Columns>
                <asp:BoundField DataField="DISH_CODE" HeaderText="DISH_CODE" ReadOnly="True" SortExpression="DISH_CODE" />
                <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                <asp:BoundField DataField="ORIGIN" HeaderText="ORIGIN" SortExpression="ORIGIN" />
                <asp:BoundField DataField="LOCAL_NAME" HeaderText="LOCAL_NAME" SortExpression="LOCAL_NAME" />

                <%-- Creating the actions column with icons --%>
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:ImageButton ImageUrl="~/icons/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px" />
                        <asp:ImageButton ImageUrl="~/icons/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton ImageUrl="~/icons/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px" />
                        <asp:ImageButton ImageUrl="~/icons/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px" />
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
            <%-- Auto generated design for gridview ends here--%>
        </asp:GridView>
        <div class="margin-full"></div>
        <asp:FormView ID="DishFormView" runat="server" DataKeyNames="DISH_CODE" DataSourceID="DishDataSource">

            <InsertItemTemplate>
                <h5>Please add the values in these fields to add a new dish!</h5>
                <div class="margin-half"></div>
                <div class="row">
                    <div class="col-sm-4">
                        <asp:Label Text="Dish Code:" runat="server" />
                    </div>
                    <div class="col-sm-4">
                        <asp:TextBox ID="DISH_CODETextBox" runat="server" Text='<%# Bind("DISH_CODE") %>' />
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator ID="CodeRequiredFieldValidator" runat="server" ErrorMessage="* Dish Code is required" ControlToValidate="DISH_CODETextBox" ValidationGroup="InsertDish" CssClass="validation-dish">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="margin-half"></div>
                <div class="row">
                    <div class="col-sm-4">
                        <asp:Label Text="Name:" runat="server" />
                    </div>
                    <div class="col-sm-4">
                        <asp:TextBox ID="NAMETextBox" runat="server" Text='<%# Bind("NAME") %>' />
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator ID="DishNameRequiredFieldValidator" runat="server" ErrorMessage="* Name is required" ControlToValidate="NAMETextBox" ValidationGroup="InsertDish" CssClass="validation-dish">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="margin-half"></div>
                <div class="row">
                    <div class="col-sm-4">
                        <asp:Label Text="Origin:" runat="server" />
                    </div>
                    <div class="col-sm-4">
                        <asp:TextBox ID="ORIGINTextBox" runat="server" Text='<%# Bind("ORIGIN") %>' />
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator ID="OriginRequiredFieldValidator" runat="server" ErrorMessage="* Origin is required" ControlToValidate="ORIGINTextBox" ValidationGroup="InsertDish" CssClass="validation-dish">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="margin-half"></div>
                <div class="row">
                    <div class="col-sm-4">
                        <asp:Label Text="Local Name:" runat="server" />
                    </div>
                    <div class="col-sm-4">
                        <asp:TextBox ID="LOCAL_NAMETextBox" runat="server" Text='<%# Bind("LOCAL_NAME") %>' />
                    </div>
                </div>
                <div class="margin-full"></div>
                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" />
                &nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" ValidationGroup="InsertDish" CommandName="Insert" Text="Insert" CssClass="btn btn-primary button-spaces" />

            </InsertItemTemplate>
            <ItemTemplate>
                <h3>Press the button to add a new dish  
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Dish" CssClass="btn btn-primary" />

                </h3>
            </ItemTemplate>
        </asp:FormView>
    </form>

</asp:Content>
