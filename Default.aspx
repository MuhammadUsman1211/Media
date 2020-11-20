<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Media._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">   
    <div class="row">
        <div class="col-md-12">
            <h3>Read RSS Feed from World Top News Channels</h3>
            <div>
                <asp:GridView ID="gvRss" runat="server" AutoGenerateColumns="false" ShowHeader="false" Width="90%">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <table width="100%" border="0" cellpadding="0" cellspacing="5">
                                    <tr>
                                        <td>
                                            <h3 style="color: #3E7CFF"><%#Eval("Title") %></h3>
                                        </td>
                                        <td width="200px">
                                            <%#Eval("PublishDate") %>
                                        </td>
                                    </tr>
                                    <tr>                                        
                                        <td colspan="2">
                                            <asp:Image ImageUrl='<%#Eval("image1") %>' runat="server" />  
                                           
                                            <%#Eval("Description") %>
                                        </td>
                                    </tr>                                   
                                    <tr>
                                        <td></td>
                                        <td align="right">
                                            <a href='<%#Eval("Link") %>' target="_blank">Read More...</a>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>     

    </div>

</asp:Content>
