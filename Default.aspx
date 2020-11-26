<%@ Page Title="News" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Media._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContent" runat="server">
    <style>
        * {
            box-sizing: border-box;
        }

        .column img {
            padding-top: 10px;
            padding-bottom: 10px;
        }

        /* Clearfix (clear floats) */
        .row::after {
            content: "";
            clear: both;
            display: table;
        }
        .column img {
            max-width:100% !important;
        }
        .column video, .column iframe {
            max-width:100% !important;
        }

    </style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="text-align: center;">
        <div class="col-sm-6" style="border:2px solid #000;">
             <h2><b>News HeadLine</b></h2>
        </div>
        <div class="col-sm-6" style="border:2px solid #000;">
             <h2><b>Business HeadLine</b></h2>
        </div>
    </div>
    <div class="row bg-red" style="border:2px solid #000;">
        <div class="col-sm-12">
            <h2>Breaking News</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">           
            
                <asp:Repeater ID="newsrss" runat="server">
                    <HeaderTemplate>
                        <table border="0" class="table table-responsive">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <h3 style="color: #3E7CFF"><%#Eval("Title") %></h3>
                                <%#Eval("PublishDate") %>
                            </td>
                        </tr>
                        <tr>

                            <td>

                                <div class="column">
                                    <asp:Image ImageUrl='<%#Eval("image1") %>' runat="server" />
                                </div>
                                <div class="column">
                                    <%#Eval("Description") %>
                                    <a href='<%#Eval("Link") %>' target="_blank" style="color: red !important;">Read More...</a>
                                </div>                               
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            <div class="clearfix" style="clear:both;"></div>
            </div>
       
        <div class="col-md-6">           
           
                <asp:Repeater ID="sportrss" runat="server">
                    <HeaderTemplate>
                        <table border="0" class="table table-responsive">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <h3 style="color: #3E7CFF"><%#Eval("Title") %></h3>
                                <%#Eval("PublishDate") %>
                            </td>
                        </tr>
                        <tr>

                            <td>

                                <div class="column">
                                    <asp:Image ImageUrl='<%#Eval("image1") %>' runat="server" />
                                </div>
                                <div class="column">
                                    <%#Eval("Description") %>
                                    <a href='<%#Eval("Link") %>' target="_blank" style="color: red !important;">Read More...</a>
                                </div>                              
                            </td>
                        </tr>

                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
           <div class="clearfix" style="clear:both;"></div>
        </div>
    </div>

</asp:Content>
