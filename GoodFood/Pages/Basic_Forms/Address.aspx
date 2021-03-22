<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Address.aspx.cs" Inherits="GoodFood.Customers" %>

<asp:Content ID="headAddress" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Address</title>
</asp:Content>

<asp:Content ID="bodyAddress" ContentPlaceHolderID="bodyContent" runat="server">

    <h1 class="text-center">Data from the Addresses table</h1>
    <div class="margin-half"></div>

    <form id="addressForm" runat="server">
        <asp:SqlDataSource ID="AddressDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;ADDRESSES&quot; WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID" InsertCommand="INSERT INTO &quot;ADDRESSES&quot; (&quot;ADDRESS_ID&quot;, &quot;PROVINCE&quot;, &quot;STREET&quot;, &quot;CITY&quot;, &quot;STREET_NUMBER&quot;, &quot;HOUSE_NUMBER&quot;, &quot;LATITUDE&quot;, &quot;LONGITUDE&quot;) VALUES (:ADDRESS_ID, :PROVINCE, :STREET, :CITY, :STREET_NUMBER, :HOUSE_NUMBER, :LATITUDE, :LONGITUDE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ADDRESS_ID&quot;, &quot;PROVINCE&quot;, &quot;STREET&quot;, &quot;CITY&quot;, &quot;STREET_NUMBER&quot;, &quot;HOUSE_NUMBER&quot;, &quot;LATITUDE&quot;, &quot;LONGITUDE&quot; FROM &quot;ADDRESSES&quot;" UpdateCommand="UPDATE &quot;ADDRESSES&quot; SET &quot;PROVINCE&quot; = :PROVINCE, &quot;STREET&quot; = :STREET, &quot;CITY&quot; = :CITY, &quot;STREET_NUMBER&quot; = :STREET_NUMBER, &quot;HOUSE_NUMBER&quot; = :HOUSE_NUMBER, &quot;LATITUDE&quot; = :LATITUDE, &quot;LONGITUDE&quot; = :LONGITUDE WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID">
            <DeleteParameters>
                <asp:Parameter Name="ADDRESS_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ADDRESS_ID" Type="String" />
                <asp:Parameter Name="PROVINCE" Type="String" />
                <asp:Parameter Name="STREET" Type="String" />
                <asp:Parameter Name="CITY" Type="String" />
                <asp:Parameter Name="STREET_NUMBER" Type="String" />
                <asp:Parameter Name="HOUSE_NUMBER" Type="String" />
                <asp:Parameter Name="LATITUDE" Type="String" />
                <asp:Parameter Name="LONGITUDE" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="PROVINCE" Type="String" />
                <asp:Parameter Name="STREET" Type="String" />
                <asp:Parameter Name="CITY" Type="String" />
                <asp:Parameter Name="STREET_NUMBER" Type="String" />
                <asp:Parameter Name="HOUSE_NUMBER" Type="String" />
                <asp:Parameter Name="LATITUDE" Type="String" />
                <asp:Parameter Name="LONGITUDE" Type="String" />
                <asp:Parameter Name="ADDRESS_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>


        <asp:GridView CssClass="table table-active table-responsive" ID="AddressGridView" runat="server" BackColor="White" BorderColor="#CCCCCC" Width="1200px" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False" DataKeyNames="ADDRESS_ID" DataSourceID="AddressDataSource">
            <Columns>
                <asp:BoundField DataField="ADDRESS_ID" HeaderText="ADDRESS_ID" ReadOnly="True" SortExpression="ADDRESS_ID" />
                <asp:BoundField DataField="PROVINCE" HeaderText="PROVINCE" SortExpression="PROVINCE" />
                <asp:BoundField DataField="STREET" HeaderText="STREET" SortExpression="STREET" />
                <asp:BoundField DataField="CITY" HeaderText="CITY" SortExpression="CITY" />
                <asp:BoundField DataField="STREET_NUMBER" HeaderText="STREET_NUMBER" SortExpression="STREET_NUMBER" />
                <asp:BoundField DataField="HOUSE_NUMBER" HeaderText="HOUSE_NUMBER" SortExpression="HOUSE_NUMBER" />
                <asp:BoundField DataField="LATITUDE" HeaderText="LATITUDE" SortExpression="LATITUDE" />
                <asp:BoundField DataField="LONGITUDE" HeaderText="LONGITUDE" SortExpression="LONGITUDE" />
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

        <asp:FormView ID="AddressFormView" runat="server" DataKeyNames="ADDRESS_ID" DataSourceID="AddressDataSource">

            <InsertItemTemplate>
                <h5>Please add the values in these fields to add a new address!</h5>
                <div class="margin-half"></div>
                <div class="row">
                    <div class="col-sm-4">
                        <asp:Label Text="Address ID:" runat="server" />
                    </div>
                    <div class="col-sm-4">
                        <asp:TextBox ID="ADDRESS_IDTextBox" runat="server" Text='<%# Bind("ADDRESS_ID") %>' />
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator ID="AddressIdRequiredFieldValidator" runat="server" ErrorMessage="* Id is required" ControlToValidate="ADDRESS_IDTextBox" ValidationGroup="InsertAddress" CssClass="validation">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="margin-half"></div>
                <div class="row">
                    <div class="col-sm-4">
                        <asp:Label Text="Province:" runat="server" />
                    </div>
                    <div class="col-sm-4">
                        <asp:TextBox ID="PROVINCETextBox" runat="server" Text='<%# Bind("PROVINCE") %>' />
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator ID="ProvinceRequiredFieldValidator" runat="server" ErrorMessage="* Province is required" ControlToValidate="PROVINCETextBox" ValidationGroup="InsertAddress" CssClass="validation">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="margin-half"></div>
                <div class="row">
                    <div class="col-sm-4">
                        <asp:Label Text="City:" runat="server" />
                    </div>
                    <div class="col-sm-4">
                        <asp:TextBox ID="CITYTextBox" runat="server" Text='<%# Bind("CITY") %>' />
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator ID="CityRequiredFieldValidator" runat="server" ErrorMessage="* City is required" ControlToValidate="CITYTextBox" ValidationGroup="InsertAddress" CssClass="validation">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="margin-half"></div>
                <div class="row">
                    <div class="col-sm-4">
                        <asp:Label Text="Street:" runat="server" />
                    </div>
                    <div class="col-sm-4">
                        <asp:TextBox ID="STREETTextBox" runat="server" Text='<%# Bind("STREET") %>' />
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator ID="StreetRequiredFieldValidator" runat="server" ErrorMessage="* Street is required" ControlToValidate="STREETTextBox" ValidationGroup="InsertAddress" CssClass="validation">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="margin-half"></div>
                <div class="row">
                    <div class="col-sm-4">
                        <asp:Label Text="Street Number:" runat="server" />
                    </div>
                    <div class="col-sm-4">
                        <asp:TextBox ID="STREET_NUMBERTextBox" runat="server" Text='<%# Bind("STREET_NUMBER") %>' />
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator ID="StreetNumberRequiredFieldValidator" runat="server" ErrorMessage="* Street Number is required" ControlToValidate="STREET_NUMBERTextBox" ValidationGroup="InsertAddress" CssClass="validation">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="margin-half"></div>
                <div class="row">
                    <div class="col-sm-4">
                        <asp:Label Text="House Number:" runat="server" />
                    </div>
                    <div class="col-sm-4">
                        <asp:TextBox ID="HOUSE_NUMBERTextBox" runat="server" Text='<%# Bind("HOUSE_NUMBER") %>' />
                    </div>
                </div>
                <div class="margin-half"></div>
                <div class="row">
                    <div class="col-sm-4">
                        <asp:Label Text="Latitude:" runat="server" />
                    </div>
                    <div class="col-sm-4">
                        <asp:TextBox ID="LATITUDETextBox" runat="server" Text='<%# Bind("LATITUDE") %>' />
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator ID="LatitudeRequiredFieldValidator" runat="server" ErrorMessage="* Latitude is required" ControlToValidate="LATITUDETextBox" ValidationGroup="InsertAddress" CssClass="validation">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="margin-half"></div>
                <div class="row">
                    <div class="col-sm-4">
                        <asp:Label Text="Longitude:" runat="server" />
                    </div>
                    <div class="col-sm-4">
                        <asp:TextBox ID="LONGITUDETextBox" runat="server" Text='<%# Bind("LONGITUDE") %>' />
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator ID="LongitudeRequiredFieldValidator" runat="server" ErrorMessage="* Longitude is required" ControlToValidate="LONGITUDETextBox" ValidationGroup="InsertAddress" CssClass="validation">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="margin-full"></div>
                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" />
                &nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" ValidationGroup="InsertAddress" CommandName="Insert" Text="Insert" CssClass="btn btn-primary button-spaces" />

            </InsertItemTemplate>
            <ItemTemplate>
                <h3>Press the button to add a new address  
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Address" CssClass="btn btn-primary" />

                </h3>
            </ItemTemplate>

        </asp:FormView>
    </form>

</asp:Content>
