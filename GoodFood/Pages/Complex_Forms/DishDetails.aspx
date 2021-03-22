<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DishDetails.aspx.cs" Inherits="GoodFood.Customers" %>

<asp:Content ID="headDishDetails" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Address</title>
</asp:Content>

<asp:Content ID="bodyDishDetails" ContentPlaceHolderID="bodyContent" runat="server">

    <form id="dishDetailsForm" runat="server">

        <asp:SqlDataSource ID="dishNameDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;DISH_CODE&quot;, &quot;NAME&quot; FROM &quot;DISHES&quot;"></asp:SqlDataSource>


        <h1 class="text-center">Details of the Dish Orders</h1>
        <div class="margin-half"></div>
        <h5>Select the name of the dish:
        <asp:DropDownList ID="dishDropdown" runat="server" AutoPostBack="True" DataSourceID="dishNameDataSource" DataTextField="NAME" DataValueField="DISH_CODE">
        </asp:DropDownList>
        </h5>

        <div class="margin-half"></div>
        <asp:SqlDataSource ID="DishDetailsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;ADDRESSES&quot; WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID" InsertCommand="INSERT INTO &quot;ADDRESSES&quot; (&quot;ADDRESS_ID&quot;, &quot;PROVINCE&quot;, &quot;STREET&quot;, &quot;CITY&quot;, &quot;STREET_NUMBER&quot;, &quot;HOUSE_NUMBER&quot;, &quot;LATITUDE&quot;, &quot;LONGITUDE&quot;) VALUES (:ADDRESS_ID, :PROVINCE, :STREET, :CITY, :STREET_NUMBER, :HOUSE_NUMBER, :LATITUDE, :LONGITUDE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT d.DISH_CODE, d.NAME AS Dish, d.LOCAL_NAME, d.ORIGIN, ar.PRICE, ar.RESTAURANT_ID, r.NAME FROM DISHES d, AVAILABLE_RESTAURANT ar, RESTAURANTS r WHERE ar.DISH_CODE = d.DISH_CODE AND r.PAN_NUMBER = ar.RESTAURANT_ID AND (d.DISH_CODE = :Dish_ID)" UpdateCommand="UPDATE &quot;ADDRESSES&quot; SET &quot;PROVINCE&quot; = :PROVINCE, &quot;STREET&quot; = :STREET, &quot;CITY&quot; = :CITY, &quot;STREET_NUMBER&quot; = :STREET_NUMBER, &quot;HOUSE_NUMBER&quot; = :HOUSE_NUMBER, &quot;LATITUDE&quot; = :LATITUDE, &quot;LONGITUDE&quot; = :LONGITUDE WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID">
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
                <asp:ControlParameter ControlID="dishDropdown" Name="Dish_ID" PropertyName="SelectedValue" />
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


        <asp:GridView CssClass="table table-active" ID="DishDetailsGridView" runat="server" BackColor="White" BorderColor="#CCCCCC" Width="1200px" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False" DataSourceID="DishDetailsDataSource" DataKeyNames="DISH_CODE">


            <%-- Auto generated design for gridview starts --%>
            <Columns>
                <asp:BoundField DataField="DISH_CODE" HeaderText="DISH_CODE" ReadOnly="True" SortExpression="DISH_CODE" />
                <asp:BoundField DataField="DISH" HeaderText="DISH" SortExpression="DISH" />
                <asp:BoundField DataField="LOCAL_NAME" HeaderText="LOCAL_NAME" SortExpression="LOCAL_NAME" />
                <asp:BoundField DataField="ORIGIN" HeaderText="ORIGIN" SortExpression="ORIGIN" />
                <asp:BoundField DataField="PRICE" HeaderText="PRICE" SortExpression="PRICE" />
                <asp:BoundField DataField="RESTAURANT_ID" HeaderText="RESTAURANT_ID" SortExpression="RESTAURANT_ID" />
                <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
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
