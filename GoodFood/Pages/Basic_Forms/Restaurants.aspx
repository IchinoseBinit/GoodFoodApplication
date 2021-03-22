<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Restaurants.aspx.cs" Inherits="GoodFood.Pages.Basic_Forms.Restaurants" %>
<asp:Content ID="headRestaurant" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Restaurants</title>
</asp:Content>

<asp:Content ID="bodyRestaurant" ContentPlaceHolderID="bodyContent" runat="server">

    <h1 class="text-center">Data from the Restaurants table</h1>

    <form id="restaurantForm" runat="server">
    <div class="margin-half">
        
        </div>

        <asp:SqlDataSource ID="RestaurantDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;RESTAURANTS&quot; WHERE &quot;PAN_NUMBER&quot; = :PAN_NUMBER" InsertCommand="INSERT INTO &quot;RESTAURANTS&quot; (&quot;PAN_NUMBER&quot;, &quot;NAME&quot;, &quot;PHONE_NUMBER&quot;, &quot;EMAIL_ADDRESS&quot;) VALUES (:PAN_NUMBER, :NAME, :PHONE_NUMBER, :EMAIL_ADDRESS)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PAN_NUMBER&quot;, &quot;NAME&quot;, &quot;PHONE_NUMBER&quot;, &quot;EMAIL_ADDRESS&quot; FROM &quot;RESTAURANTS&quot;" UpdateCommand="UPDATE &quot;RESTAURANTS&quot; SET &quot;NAME&quot; = :NAME, &quot;PHONE_NUMBER&quot; = :PHONE_NUMBER, &quot;EMAIL_ADDRESS&quot; = :EMAIL_ADDRESS WHERE &quot;PAN_NUMBER&quot; = :PAN_NUMBER">
            <DeleteParameters>
                <asp:Parameter Name="PAN_NUMBER" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PAN_NUMBER" Type="String" />
                <asp:Parameter Name="NAME" Type="String" />
                <asp:Parameter Name="PHONE_NUMBER" Type="String" />
                <asp:Parameter Name="EMAIL_ADDRESS" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="NAME" Type="String" />
                <asp:Parameter Name="PHONE_NUMBER" Type="String" />
                <asp:Parameter Name="EMAIL_ADDRESS" Type="String" />
                <asp:Parameter Name="PAN_NUMBER" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>


        <asp:GridView CssClass="table table-active" ID="RestaurantGridView" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False" DataKeyNames="PAN_NUMBER" DataSourceID="RestaurantDataSource">
            <Columns>
                <asp:BoundField DataField="PAN_NUMBER" HeaderText="PAN_NUMBER" ReadOnly="True" SortExpression="PAN_NUMBER" />
                <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                <asp:BoundField DataField="PHONE_NUMBER" HeaderText="PHONE_NUMBER" SortExpression="PHONE_NUMBER" />
                <asp:BoundField DataField="EMAIL_ADDRESS" HeaderText="EMAIL_ADDRESS" SortExpression="EMAIL_ADDRESS" />


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


            <%-- Auto generated design for gridview starts --%>
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
        <div class="margin-full">
            <asp:Label ID="lbl1" runat="server" Text="Label" Visible="False"></asp:Label>
        </div>
        <asp:FormView ID="RestaurantFormView" runat="server" DataKeyNames="PAN_NUMBER" DataSourceID="RestaurantDataSource">

            <InsertItemTemplate>
                <h5>Please add the values in these fields to add a new restaurant!</h5>
                <div class="margin-half">
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <asp:Label Text="Pan Number:" runat="server" />
                    </div>
                    <div class="col-sm-4">
                        <asp:TextBox ID="PAN_NUMBERTextBox" runat="server" Text='<%# Bind("PAN_NUMBER") %>' AutoPostBack="True" />
                    </div>
                    <div class="col-sm-4">
                        <%--<asp:RequiredFieldValidator ID="PanNumberRequiredFieldValidator" runat="server" ErrorMessage="* Pan Number is required" ControlToValidate="PAN_NUMBERTextBox" ValidationGroup="InsertRestaurant" CssClass="validation">
                        </asp:RequiredFieldValidator>--%>
                        <asp:CustomValidator ID="PrimaryKeyValidator" style="position:relative; left:10px;" runat="server" ErrorMessage="* Pan Number already exists" ControlToValidate="PAN_NUMBERTextBox" ValidationGroup="InsertRestaurant" CssClass="validation" OnServerValidate="PrimaryKeyValidator_ServerValidate" ValidateEmptyText="True"></asp:CustomValidator>
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
                        <asp:RequiredFieldValidator ID="NameRequiredFieldValidator" runat="server" ErrorMessage="* Name is required" ControlToValidate="NAMETextBox" ValidationGroup="InsertRestaurant" CssClass="validation">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="margin-half"></div>
                <div class="row">
                    <div class="col-sm-4">
                        <asp:Label Text="Phone Number:" runat="server" />
                    </div>
                    <div class="col-sm-4">
                        <asp:TextBox ID="PHONE_NUMBERTextBox" runat="server" Text='<%# Bind("PHONE_NUMBER") %>' />
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator ID="PhoneNumberRequiredFieldValidator" runat="server" ErrorMessage="* Phone Number is required" ControlToValidate="PHONE_NUMBERTextBox" ValidationGroup="InsertRestaurant" CssClass="validation">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="margin-half"></div>
                <div class="row">
                    <div class="col-sm-4">
                        <asp:Label Text="Email Address:" runat="server" />
                    </div>
                    <div class="col-sm-4">
                        <asp:TextBox ID="EMAIL_ADDRESSTextBox" runat="server" Text='<%# Bind("EMAIL_ADDRESS") %>' />
                    </div>
                </div>
                <div class="margin-full"></div>
                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" />
                &nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" ValidationGroup="InsertRestaurant" Text="Insert" CssClass="btn btn-primary button-spaces" />
            </InsertItemTemplate>
            <ItemTemplate>
                <h3>Press the button to add a new restaurant  
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Restaurant" CssClass="btn btn-primary" />

                </h3>
            </ItemTemplate>
        </asp:FormView>
    </form>

</asp:Content>
