<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PageList.aspx.cs" Inherits="Media.Admin.PageList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h2>PAGES LIST</h2>
        <asp:Repeater ID="rptpages" runat="server" OnItemDataBound="rptpages_ItemDataBound" OnItemCommand="rptpages_ItemCommand">
            <HeaderTemplate>
                <table class="table">
                    <thead class="thead-dark">
                        <tr>                            
                            <th scope="col">Page</th>
                            <th scope="col">Link</th>
                            <th scope="col">Count</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:Label ID="lblpage" runat="server" Text='<%# Eval("CatName") %>'></asp:Label>
                    </td>
                    <td>
                        <a id="ankpage" runat="server" target="_blank"><asp:Label ID="lbllink" runat="server"></asp:Label></a>
                    </td>
                    <td>
                         <asp:Label ID="lblcount" runat="server" Text='<%# Eval("Count") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="btnaddrss" runat="server" CommandName="AddRss" CommandArgument='<%# Eval("CatID") %>' Text="Add RSS" />
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JSContent" runat="server">
</asp:Content>
