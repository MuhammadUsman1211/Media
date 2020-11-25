<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddRss.aspx.cs" Inherits="Media.Admin.AddRss" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h2>PAGES RSS LIST &nbsp; <a href="PageList.aspx">[Back]</a></h2>
        <div class="row">
            <div class="col-sm-1">
                <b>RSS Link</b>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" Text="*" ControlToValidate="txtAddrss" ValidationGroup="RSS" Font-Size="Large"></asp:RequiredFieldValidator> 
            </div>
            <div class="col-sm-3">
                <asp:TextBox ID="txtAddrss" runat="server" class="form-control" placeholder="RSS Link"></asp:TextBox>
            </div>
            <div class="col-sm-2">
                <asp:Button ID="btnaddrss" Text="Add RSS" runat="server" OnClick="btnaddrss_Click" ValidationGroup="RSS" />
            </div>
        </div>
        <asp:HiddenField ID="hdncatid" runat="server" />
         <asp:Repeater ID="rptRss" runat="server" OnItemCommand="rptRss_ItemCommand">
            <HeaderTemplate>
                <table class="table">
                    <thead class="thead-dark">
                        <tr>                            
                            <th scope="col">Page</th>
                            <th scope="col">Rss Link</th>                           
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
                        <asp:Label ID="lbllink" runat="server" Text='<%# Eval("RSSLink") %>'></asp:Label>
                    </td>                   
                    <td>
                        <asp:Button ID="btnaddrss" runat="server" CommandName="Delete" OnClientClick="return confirm('Are You sure you want to delete')" CommandArgument='<%# Eval("Recid") %>' Text="Delete RSS" />
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
