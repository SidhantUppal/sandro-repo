<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<kendoTest.Models.ClientCategoryViewModel>" %>

<%= Html.Kendo().DropDownListFor(m => m)
        .DataValueField("CategoryID")
        .DataTextField("CategoryName")
        .BindTo((System.Collections.IEnumerable)ViewData["categories"])
%>