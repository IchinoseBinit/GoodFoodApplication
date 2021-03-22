<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="GoodFood.Customers" %>

<asp:Content ID="headCustomer" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Customers</title>
</asp:Content>

<asp:Content ID="bodyCustomer" ContentPlaceHolderID="bodyContent" runat="server">

    <h1 class="text-center">Data from the Customers table</h1>
    <div class="margin-half"></div>

    <form id="customerForm" runat="server">
        <asp:SqlDataSource ID="CustomerDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;CUSTOMERS&quot; WHERE &quot;CUSTOMER_ID&quot; = :CUSTOMER_ID" InsertCommand="INSERT INTO &quot;CUSTOMERS&quot; (&quot;CUSTOMER_ID&quot;, &quot;NAME&quot;, &quot;AGE&quot;, &quot;GENDER&quot;, &quot;PHONE_NUMBER&quot;, &quot;EMAIL_ADDRESS&quot;) VALUES (:CUSTOMER_ID, :NAME, :AGE, :GENDER, :PHONE_NUMBER, :EMAIL_ADDRESS)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;CUSTOMER_ID&quot;, &quot;NAME&quot;, &quot;AGE&quot;, &quot;GENDER&quot;, &quot;PHONE_NUMBER&quot;, &quot;EMAIL_ADDRESS&quot; FROM &quot;CUSTOMERS&quot;" UpdateCommand="UPDATE &quot;CUSTOMERS&quot; SET &quot;NAME&quot; = :NAME, &quot;AGE&quot; = :AGE, &quot;GENDER&quot; = :GENDER, &quot;PHONE_NUMBER&quot; = :PHONE_NUMBER, &quot;EMAIL_ADDRESS&quot; = :EMAIL_ADDRESS WHERE &quot;CUSTOMER_ID&quot; = :CUSTOMER_ID">
            <DeleteParameters>
                <asp:Parameter Name="CUSTOMER_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CUSTOMER_ID" Type="String" />
                <asp:Parameter Name="NAME" Type="String" />
                <asp:Parameter Name="AGE" Type="Decimal" />
                <asp:Parameter Name="GENDER" Type="String" />
                <asp:Parameter Name="PHONE_NUMBER" Type="String" />
                <asp:Parameter Name="EMAIL_ADDRESS" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="NAME" Type="String" />
                <asp:Parameter Name="AGE" Type="Decimal" />
                <asp:Parameter Name="GENDER" Type="String" />
                <asp:Parameter Name="PHONE_NUMBER" Type="String" />
                <asp:Parameter Name="EMAIL_ADDRESS" Type="String" />
                <asp:Parameter Name="CUSTOMER_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>


        <div style="width: 1120px; overflow: auto;">
            <asp:GridView CssClass="table table-active" ID="CustomerGridView" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False" DataKeyNames="CUSTOMER_ID" DataSourceID="CustomerDataSource">
                <Columns>
                    <asp:BoundField DataField="CUSTOMER_ID" HeaderText="CUSTOMER_ID" ReadOnly="True" SortExpression="CUSTOMER_ID" />
                    <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                    <asp:BoundField DataField="AGE" HeaderText="AGE" SortExpression="AGE" />
                    <asp:BoundField DataField="GENDER" HeaderText="GENDER" SortExpression="GENDER" />
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
        </div>
        <div class="margin-full"></div>
        <asp:FormView ID="CustomerFormView" runat="server" DataKeyNames="CUSTOMER_ID" DataSourceID="CustomerDataSource">
            <InsertItemTemplate>
                <h5>Please add the values in these fields to add a new customer!</h5>
                <div class="margin-half"></div>
                <div class="row">
                    <div class="col-sm-4">
                        <asp:Label Text="Customer ID:" runat="server" />
                    </div>
                    <div class="col-sm-4">
                        <asp:TextBox ID="CUSTOMER_IDTextBox" runat="server" Text='<%# Bind("CUSTOMER_ID") %>' />
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator ID="IdRequiredFieldValidator" runat="server" ErrorMessage="* Id is required" ControlToValidate="CUSTOMER_IDTextBox" ValidationGroup="InsertCustomer" CssClass="validation">
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
                        <asp:RequiredFieldValidator ID="NameRequiredFieldValidator" ControlToValidate="NAMETextBox" ErrorMessage="* Name is required" runat="server" ValidationGroup="InsertCustomer" CssClass="validation">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="margin-half"></div>

                <div class="row">
                    <div class="col-sm-4">
                        <asp:Label Text="Age:" runat="server" />
                    </div>
                    <div class="col-sm-4">

                        <asp:TextBox ID="AGETextBox" runat="server" Text='<%# Bind("AGE") %>' />

                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator ID="AgeRequiredFieldValidator" ControlToValidate="AGETextBox" ErrorMessage="* Age is required" runat="server" ValidationGroup="InsertCustomer" CssClass="validation">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="margin-half"></div>

                <div class="row">
                    <div class="col-sm-4">
                        <asp:Label Text="Gender:" runat="server" />
                    </div>
                    <div class="col-sm-4">
                        <asp:TextBox ID="GENDERTextBox" runat="server" Text='<%# Bind("GENDER") %>' />
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator ID="GenderRequiredFieldValidator" ControlToValidate="GENDERTextBox" ErrorMessage="* Gender is required" runat="server" ValidationGroup="InsertCustomer" CssClass="validation">
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
                        <asp:RequiredFieldValidator ID="PhoneNumberRequiredFieldValidator" ControlToValidate="PHONE_NUMBERTextBox" ErrorMessage="* Phone Number is required" runat="server" ValidationGroup="InsertCustomer" CssClass="validation">
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
                &nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" ValidationGroup="InsertCustomer"  CommandName="Insert" Text="Insert" CssClass="btn btn-primary button-spaces" />

            </InsertItemTemplate>
            <ItemTemplate>
                <h3>Press the button to add a new customer  
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Customer" CssClass="btn btn-primary" />

                </h3>
            </ItemTemplate>
        </asp:FormView>
    </form>

</asp:Content>
