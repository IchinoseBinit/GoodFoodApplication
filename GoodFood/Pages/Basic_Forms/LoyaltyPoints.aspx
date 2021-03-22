<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoyaltyPoints.aspx.cs" Inherits="GoodFood.Customers" %>

<asp:Content ID="headLoyaltyPoints" ContentPlaceHolderID="HeadContent" runat="server">
    <title>LoyaltyPoint</title>
</asp:Content>

<asp:Content ID="bodyLoyaltyPoint" ContentPlaceHolderID="bodyContent" runat="server">

    <h1 class="text-center">Data from the Loyalty Points table</h1>
    <div class="margin-half"></div>

    <form id="loyaltyPointForm" runat="server">
        <asp:SqlDataSource ID="LoyaltyPointsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;LOYALTY_POINTS&quot; WHERE &quot;ID&quot; = :ID" InsertCommand="INSERT INTO &quot;LOYALTY_POINTS&quot; (&quot;ID&quot;, &quot;DESCRIPTION&quot;, &quot;AMOUNT&quot;) VALUES (:ID, :DESCRIPTION, :AMOUNT)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ID&quot;, &quot;DESCRIPTION&quot;, &quot;AMOUNT&quot; FROM &quot;LOYALTY_POINTS&quot;" UpdateCommand="UPDATE &quot;LOYALTY_POINTS&quot; SET &quot;DESCRIPTION&quot; = :DESCRIPTION, &quot;AMOUNT&quot; = :AMOUNT WHERE &quot;ID&quot; = :ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ID" Type="String" />
                <asp:Parameter Name="DESCRIPTION" Type="String" />
                <asp:Parameter Name="AMOUNT" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="DESCRIPTION" Type="String" />
                <asp:Parameter Name="AMOUNT" Type="Decimal" />
                <asp:Parameter Name="ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>


        <asp:GridView CssClass="table table-active" ID="LoyaltyPointsGridView" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="LoyaltyPointsDataSource">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION" SortExpression="DESCRIPTION" />
                <asp:BoundField DataField="AMOUNT" HeaderText="AMOUNT" SortExpression="AMOUNT" />


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
        <div class="margin-full"></div>

        <asp:FormView ID="LoyaltyPointsFormView" runat="server" DataKeyNames="ID" DataSourceID="LoyaltyPointsDataSource">

            <InsertItemTemplate>
                <h5>Please add the values in these fields to add a new loyalty point!</h5>
                <div class="margin-half"></div>
                <div class="row">
                    <div class="col-sm-4">
                        <asp:Label Text="ID:" runat="server" />
                    </div>
                    <div class="col-sm-4">
                        <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator ID="PointIdRequiredFieldValidator" runat="server" ErrorMessage="* Point Id is required" ControlToValidate="IDTextBox" ValidationGroup="InsertLoyaltyPoints" CssClass="validation">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="margin-half"></div>
                <div class="row">
                    <div class="col-sm-4">
                        <asp:Label Text="Description:" runat="server" />
                    </div>
                    <div class="col-sm-4">
                        <asp:TextBox ID="DESCRIPTIONTextBox" runat="server" Text='<%# Bind("DESCRIPTION") %>' />
                    </div>
                </div>
                <div class="margin-half"></div>
                <div class="row">
                    <div class="col-sm-4">
                        <asp:Label Text="Amount:" runat="server" />
                    </div>
                    <div class="col-sm-4">
                        <asp:TextBox ID="AMOUNTTextBox" runat="server" Text='<%# Bind("AMOUNT") %>' />
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator ID="AmountRequiredFieldValidator" runat="server" ErrorMessage="* Amount is required" ControlToValidate="AMOUNTTextBox" ValidationGroup="InsertLoyaltyPoints" CssClass="validation">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="margin-full"></div>
                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" />
                &nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" ValidationGroup="InsertLoyaltyPoints" CommandName="Insert" Text="Insert" CssClass="btn btn-primary button-spaces" />

            </InsertItemTemplate>
            <ItemTemplate>
                <h3>Press the button to add a new loyalty point  
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Point" CssClass="btn btn-primary" />

                </h3>
            </ItemTemplate>
        </asp:FormView>
    </form>

</asp:Content>
