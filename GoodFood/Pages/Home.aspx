<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="GoodFood.Customers" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="headHome" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Dashboard</title>
</asp:Content>

<asp:Content ID="bodyHome" ContentPlaceHolderID="bodyContent" runat="server">



    <form id="formDashboard" runat="server">
        <asp:SqlDataSource ID="CustomerCountSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS &quot;Number Of Customers&quot; FROM CUSTOMERS"></asp:SqlDataSource>
        <asp:SqlDataSource ID="OrderCountSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS &quot;Number Of Orders&quot; FROM ORDER_Details
"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DishesCountSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS &quot;Number Of Dishes&quot; FROM dishes
"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DishOrderedRestaurantSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT r.NAME AS &quot;Restaurant Name&quot;, COUNT(od.DISH_CODE) AS &quot;Number Of Dishes Ordered&quot; FROM ORDER_DETAILS od, AVAILABLE_RESTAURANT ad, RESTAURANTS r, DISHES d WHERE ad.RESTAURANT_ID = od.RESTAURANT_ID AND ad.DISH_CODE = od.DISH_CODE AND r.PAN_NUMBER = ad.RESTAURANT_ID AND d.DISH_CODE = ad.DISH_CODE GROUP BY od.RESTAURANT_ID, r.NAME ORDER BY &quot;Number Of Dishes Ordered&quot; DESC"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DishUnitSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT SUM(od.UNITS) AS &quot;Ordered Units&quot;, d.NAME AS Dish FROM ORDER_DETAILS od, AVAILABLE_RESTAURANT ad, DISHES d WHERE ad.RESTAURANT_ID = od.RESTAURANT_ID AND ad.DISH_CODE = od.DISH_CODE AND d.DISH_CODE = ad.DISH_CODE GROUP BY d.NAME"></asp:SqlDataSource>

        <asp:SqlDataSource ID="OrderCitySqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(o.ORDER_NUMBER) AS &quot;Orders by City&quot;, a.CITY FROM ORDERS o, CUSTOMER_ADDRESSES ca, ADDRESSES a WHERE o.DELIVERY_POINT = ca.ADDRESS_ID AND ca.ADDRESS_ID = a.ADDRESS_ID GROUP BY a.CITY HAVING (COUNT(o.ORDER_NUMBER) &gt; 1)"></asp:SqlDataSource>

        <div class="row">

            <div class="col-lg-7">
                <h4 style="text-align: center">Dishes with quantities sold</h4>
                <asp:Chart ID="ChartUnitOfDish" runat="server" DataSourceID="DishUnitSqlDataSource" Height="484px" Width="652px">
                    <Series>
                        <asp:Series ChartType="Pie" Legend="Legend1" Name="Series1" XValueMember="DISH" YValueMembers="Ordered Units" CustomProperties="PieLabelStyle=Disabled">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                    <Legends>
                        <asp:Legend Name="Legend1">
                        </asp:Legend>
                    </Legends>
                </asp:Chart>
            </div>

            <div class="col-lg-4">
                <h4 style="text-align: center">Cities with multiple orders</h4>
                <asp:Chart ID="ChartOrderCount" runat="server" DataSourceID="OrderCitySqlDataSource" Width="427px" Height="484px">
                    <Series>
                        <asp:Series Name="Series1" XValueMember="CITY" YValueMembers="Orders by City">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </div>
        </div>
        <div class="margin-full"></div>
        <div class="row">

            <div class="col-lg-12">
                <h4 style="text-align: center">Restaurants with Order Count</h4>
                <asp:Chart ID="ChartDishOrder" runat="server" DataSourceID="DishOrderedRestaurantSqlDataSource" Height="429px" Width="951px">
                    <Series>
                        <asp:Series ChartArea="ChartArea1" ChartType="Bar" CustomProperties="BarLabelStyle=Center" IsValueShownAsLabel="True" IsXValueIndexed="True" Name="Series1" XValueMember="Restaurant Name" YValueMembers="Number Of Dishes Ordered">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisX IntervalAutoMode="VariableCount">
                            </AxisX>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </div>
        </div>

        <div class="margin-half"></div>
        <div class="row">
            <div class="col-sm-12">
                <h5 style="text-align: center;">Statistics of the Application</h5>
            </div>
        </div>
        <div class="margin-half"></div>
        <div class="row">
            <div class="col-sm-4">
                <div class="card card-space">
                    <p>
                        <b>Number of Customers: 
                        </b>
                        <asp:GridView ID="GridView" runat="server" ShowHeader="False" DataSourceID="CustomerCountSqlDataSource" CellPadding="4" ForeColor="#333333" GridLines="None" Style="position: relative; top: -44px; left: 170px;">
                            <AlternatingRowStyle BackColor="White" />
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFFFFF" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <SortedAscendingCellStyle BackColor="#FDF5AC" />
                            <SortedAscendingHeaderStyle BackColor="#4D0000" />
                            <SortedDescendingCellStyle BackColor="#FCF6C0" />
                            <SortedDescendingHeaderStyle BackColor="#820000" />
                        </asp:GridView>
                    </p>
                    <a href="/Pages/Basic_Forms/Customers.aspx" class="btn btn-secondary">Browse Customers </a>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="card card-space">
                    <p>
                        <b>No. Of Orders:   
                        </b>
                        &nbsp;<asp:GridView ID="GridView1" runat="server" ShowHeader="false" CellPadding="4" DataSourceID="OrderCountSqlDataSource" ForeColor="#333333" GridLines="None" Style="position: relative; top: -44px; left: 110px">
                            <AlternatingRowStyle BackColor="White" />
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFFFFF" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <SortedAscendingCellStyle BackColor="#FDF5AC" />
                            <SortedAscendingHeaderStyle BackColor="#4D0000" />
                            <SortedDescendingCellStyle BackColor="#FCF6C0" />
                            <SortedDescendingHeaderStyle BackColor="#820000" />
                        </asp:GridView>
                    </p>
                    <a href="/Pages/Complex_Forms/OrderDetails.aspx" class="btn btn-secondary">Browse Order Activities</a>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="card card-space">
                    <p>
                        <b>No. of Dishes:
                        </b>
                        &nbsp;<asp:GridView ID="GridView2" runat="server" ShowHeader="false" CellPadding="4" DataSourceID="DishesCountSqlDataSource" ForeColor="#333333" GridLines="None" Style="position: relative; top: -44px; left: 105px">
                            <AlternatingRowStyle BackColor="White" />
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFFFFF" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <SortedAscendingCellStyle BackColor="#FDF5AC" />
                            <SortedAscendingHeaderStyle BackColor="#4D0000" />
                            <SortedDescendingCellStyle BackColor="#FCF6C0" />
                            <SortedDescendingHeaderStyle BackColor="#820000" />
                        </asp:GridView>
                    </p>
                    <a href="/Pages/Basic_Forms/Dishes.aspx" class="btn btn-secondary">Browse Dishes </a>
                </div>
            </div>
        </div>

    </form>



</asp:Content>