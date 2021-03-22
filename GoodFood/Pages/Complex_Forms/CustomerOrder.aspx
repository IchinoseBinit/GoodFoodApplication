<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerOrder.aspx.cs" Inherits="GoodFood.Customers" %>

<asp:Content ID="headAddress" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Address</title>
</asp:Content>

<asp:Content ID="bodyAddress" ContentPlaceHolderID="bodyContent" runat="server">

    <form id="customerOrderForm" runat="server">

        <asp:SqlDataSource ID="CustomerDetailsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;NAME&quot;, &quot;CUSTOMER_ID&quot; FROM &quot;CUSTOMERS&quot;"></asp:SqlDataSource>


        <h1 class="text-center">Details of the Customer Orders</h1>
        <div class="margin-half"></div>
        <h5>Select the name of the customer:
        <asp:DropDownList ID="customerDropdown" runat="server" AutoPostBack="True" DataSourceID="CustomerDetailsDataSource" DataTextField="NAME" DataValueField="CUSTOMER_ID">
        </asp:DropDownList>
        </h5>

        <div class="margin-half"></div>
        <asp:SqlDataSource ID="CustomerOrderDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;ADDRESSES&quot; WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID" InsertCommand="INSERT INTO &quot;ADDRESSES&quot; (&quot;ADDRESS_ID&quot;, &quot;PROVINCE&quot;, &quot;STREET&quot;, &quot;CITY&quot;, &quot;STREET_NUMBER&quot;, &quot;HOUSE_NUMBER&quot;, &quot;LATITUDE&quot;, &quot;LONGITUDE&quot;) VALUES (:ADDRESS_ID, :PROVINCE, :STREET, :CITY, :STREET_NUMBER, :HOUSE_NUMBER, :LATITUDE, :LONGITUDE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT c.NAME AS &quot;Customer Name&quot;, d.NAME AS Dish, r.NAME AS Restaurant, a.CITY, a.STREET, a.STREET_NUMBER, od.UNITS, ad.PRICE, od.LINE_TOTAL FROM ORDER_DETAILS od, ORDERS o, CUSTOMERS c, ADDRESSES a, AVAILABLE_RESTAURANT ad, DISHES d, RESTAURANTS r WHERE o.ORDER_NUMBER = od.ORDER_NUMBER AND c.CUSTOMER_ID = o.CUSTOMER_ID AND a.ADDRESS_ID = o.DELIVERY_POINT AND ad.RESTAURANT_ID = od.RESTAURANT_ID AND ad.DISH_CODE = od.DISH_CODE AND d.DISH_CODE = ad.DISH_CODE AND r.PAN_NUMBER = ad.RESTAURANT_ID AND (o.CUSTOMER_ID = :CUSTOMER_ID)" UpdateCommand="UPDATE &quot;ADDRESSES&quot; SET &quot;PROVINCE&quot; = :PROVINCE, &quot;STREET&quot; = :STREET, &quot;CITY&quot; = :CITY, &quot;STREET_NUMBER&quot; = :STREET_NUMBER, &quot;HOUSE_NUMBER&quot; = :HOUSE_NUMBER, &quot;LATITUDE&quot; = :LATITUDE, &quot;LONGITUDE&quot; = :LONGITUDE WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID">
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
            <SelectParameters>
                <asp:ControlParameter ControlID="customerDropdown" Name="CUSTOMER_ID" PropertyName="SelectedValue" />
            </SelectParameters>
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


        <asp:GridView CssClass="table table-active" ID="CustomerOrderGridView" runat="server" BackColor="White" BorderColor="#CCCCCC" Width="1200px" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False" DataSourceID="CustomerOrderDataSource">


            <%-- Auto generated design for gridview starts --%>
            <Columns>
                <asp:BoundField DataField="Customer Name" HeaderText="Customer Name" SortExpression="Customer Name" />
                <asp:BoundField DataField="DISH" HeaderText="DISH" SortExpression="DISH" />
                <asp:BoundField DataField="RESTAURANT" HeaderText="RESTAURANT" SortExpression="RESTAURANT" />
                <asp:BoundField DataField="CITY" HeaderText="CITY" SortExpression="CITY" />
                <asp:BoundField DataField="STREET" HeaderText="STREET" SortExpression="STREET" />
                <asp:BoundField DataField="STREET_NUMBER" HeaderText="STREET_NUMBER" SortExpression="STREET_NUMBER" />
                <asp:BoundField DataField="UNITS" HeaderText="UNITS" SortExpression="UNITS" />
                <asp:BoundField DataField="PRICE" HeaderText="PRICE" SortExpression="PRICE" />
                <asp:BoundField DataField="LINE_TOTAL" HeaderText="LINE_TOTAL" SortExpression="LINE_TOTAL" />
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

    </form>

</asp:Content>
