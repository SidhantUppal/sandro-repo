<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Account.Master"  Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=Resources.Account_Recharge_BuyCredit%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContentTitle" runat="server">
    <%-- <%=Resources.Account_Main_BttnOperations%> --%>
    <%=Resources.Account_Recharge_BuyCredit%>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
<%--
<div id="breadcrumb-wrapper" class="row">
    <ul id="breadcrumb">
        <li>
            <span class="entypo-home"></span>
        </li>
        <li><i class="fa fa-lg fa-angle-right"></i>
        </li>
        <li><a href="<%= Url.Action("Main", "Account") %>" title="<%=Resources.SiteMaster_Home %>"><%=Resources.SiteMaster_Home %></a>
        </li>
        <li><i class="fa fa-lg fa-angle-right"></i>
        </li>
        <li><%=Resources.Account_Main_BttnOperations%>
        </li>
    </ul>
</div>
--%>
<%-->
<div class="title-alt">
</div>
--%>
<div class="content-wrap">
    <div class="row">
        <div class="col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2 col-block ">
            <h3><%=Resources.Account_RechargeCancelTitle%></h3>
            <div class="nest">

                <div class="body-nest">

                    <div class="alert alert-bky-danger">
                        <span class="bky-cancel"></span>
                        &nbsp;
                        <%=Resources.Account_RechargeCancel_1%>
                        <%
                            if (Convert.ToDouble(ViewData["UserBalance"])<=0) 
                            { 
                                %> 
                                    <hr>
                                    <strong> <%=Resources.Account_RechargeCancel_2%> </strong> 
                                    &nbsp;
                                    <%=Resources.Account_RechargeCancel_3%>
                                <% 
                            } 
                        %>
                    </div>

                    <div class="alert alert-bky-info">
                        <%
                            if(Convert.ToDouble(ViewData["UserBalance"])<=0) 
                            { 
                                %>
                                    <span class="bky-info"></span> 
                                    &nbsp; 
                                    <strong><%=Resources.Account_RechargeCancel_4%></strong>
                                    <hr>
                                    <p><%=Resources.Account_RechargeCancel_5%></p>
                                <% 
                            } 
                            else 
                            {
                                %>
                                    <span class="bky-info"></span> 
                                    &nbsp;
                                    <strong><%=Resources.Account_RechargeCancel_5%></strong>
                                <% 
                            } 
                        %>
                    </div>
                    <div class="row-buttons">
                        <a class="btn btn-bky-primary" href="RechargeINT"><%=Resources.Account_RechargeButton_Recharge%></a>
                        <a class="btn btn-bky-default" href="Main"><%=Resources.Account_RechargeButton_MainMenu%></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</asp:Content>