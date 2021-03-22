<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="GoodFood.Customers" %>

<asp:Content ID="headAddress" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Address</title>
</asp:Content>

<asp:Content ID="bodyAddress" ContentPlaceHolderID="bodyContent" runat="server">

    <form id="orderDetailsForm" runat="server">

        <asp:SqlDataSource ID="OrderDetailsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT to_char( &quot;Date&quot;, 'Month') AS Month, Extract (Month FROM &quot;Date&quot;) AS Id FROM INVOICES"></asp:SqlDataSource>


        <h1 class="text-center">Details of the Order Details</h1>
        <div class="margin-half"></div>
        <h5>Select the name of the month:
        <asp:DropDownList ID="monthDropdown" runat="server" AutoPostBack="True" DataSourceID="OrderDetailsDataSource" DataTextField="MONTH" DataValueField="ID">
        </asp:DropDownList>
        </h5>

        <div class="margin-half"></div>
        <asp:SqlDataSource ID="OrdersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;ADDRESSES&quot; WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID" InsertCommand="INSERT INTO &quot;ADDRESSES&quot; (&quot;ADDRESS_ID&quot;, &quot;PROVINCE&quot;, &quot;STREET&quot;, &quot;CITY&quot;, &quot;STREET_NUMBER&quot;, &quot;HOUSE_NUMBER&quot;, &quot;LATITUDE&quot;, &quot;LONGITUDE&quot;) VALUES (:ADDRESS_ID, :PROVINCE, :STREET, :CITY, :STREET_NUMBER, :HOUSE_NUMBER, :LATITUDE, :LONGITUDE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select * from
(select od.restaurant_id, r.Name as &quot;Restaurant Name&quot;,
count(od.dish_code) as &quot;Number Of Dishes Ordered&quot;
from order_details od
join AVAILABLE_RESTAURANT ad on ad.RESTAURANT_ID = od.RESTAURANT_ID and ad.DISH_CODE = od.DISH_CODE
join RESTAURANTS r on r.Pan_Number = ad.Restaurant_ID
join Dishes d on d.dish_code = ad.Dish_code
join orders o on o.order_number = od.order_number
join invoices i on i.sn = o.sn
where extract(Month from &quot;Date&quot;) = :MonthFromDp
group by od.restaurant_id, r.Name, to_char(&quot;Date&quot;, 'Month')
order by count(od.dish_code) desc)
where rownum&lt;6" UpdateCommand="UPDATE &quot;ADDRESSES&quot; SET &quot;PROVINCE&quot; = :PROVINCE, &quot;STREET&quot; = :STREET, &quot;CITY&quot; = :CITY, &quot;STREET_NUMBER&quot; = :STREET_NUMBER, &quot;HOUSE_NUMBER&quot; = :HOUSE_NUMBER, &quot;LATITUDE&quot; = :LATITUDE, &quot;LONGITUDE&quot; = :LONGITUDE WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID">
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
                <asp:ControlParameter ControlID="monthDropdown" Name="MonthFromDp" PropertyName="SelectedValue" />
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


        <asp:GridView CssClass="table table-active" ID="OrderDetailsGridView" runat="server" BackColor="White" BorderColor="#CCCCCC" Width="1200px" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False" DataSourceID="OrdersDataSource">


            <%-- Auto generated design for gridview starts --%>
            <Columns>
                <asp:BoundField DataField="RESTAURANT_ID" HeaderText="RESTAURANT_ID" SortExpression="RESTAURANT_ID" />
                <asp:BoundField DataField="Restaurant Name" HeaderText="Restaurant Name" SortExpression="Restaurant Name" />
                <asp:BoundField DataField="Number Of Dishes Ordered" HeaderText="Number Of Dishes Ordered" SortExpression="Number Of Dishes Ordered" />
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
