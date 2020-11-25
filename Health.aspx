<%@ Page Title="Health" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Health.aspx.cs" Inherits="Media.Health" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CSSContent" runat="server">
	<style>
		* {
			box-sizing: border-box;
		}

		.column img{			
			padding-top: 10px;
			padding-bottom: 10px;
		}

		/* Clearfix (clear floats) */
		.row::after {
			content: "";
			clear: both;
			display: table;
		}


	</style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<div class="col-md-12">
			<h3>Health HeadLine</h3>
			<div>
				<asp:Repeater ID="sportrss" runat="server">
					<HeaderTemplate>
						<table border="0" cellpadding="0" cellspacing="5">
					</HeaderTemplate>
					<ItemTemplate>
						<tr>
							<td colspan="2">
								<h3 style="color: #3E7CFF"><%#Eval("Title") %></h3>
								<%#Eval("PublishDate") %>
							</td>							
						</tr>
						<tr>

							<td colspan="2">

								<div class="column">
									<asp:Image ImageUrl='<%#Eval("image1") %>' runat="server" />
								</div>
								<div class="column">
									<%#Eval("Description") %>
									<a href='<%#Eval("Link") %>' target="_blank" style="color:red !important;">Read More...</a>
								</div>
								<hr style="border-top:1px solid #ddd;">
							</td>
						</tr>
						
					</ItemTemplate>
					<FooterTemplate>
						</table>
					</FooterTemplate>
				</asp:Repeater>
			</div>
		</div>
	</div>

</asp:Content>