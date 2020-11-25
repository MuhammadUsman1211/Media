<%@ Page Title="Covid-19" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Covid.aspx.cs" Inherits="Media.Covid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContent" runat="server">
    <style>
        .card {
            position: relative;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
            -ms-flex-direction: column;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #8eb4e3;
            background-clip: border-box;
            border: 1px solid rgba(0,0,0,.125);
            border-radius: .25rem;
        }

        .card-body {
            -webkit-box-flex: 1;
            -ms-flex: 1 1 auto;
            flex: 1 1 auto;
            padding: 1.25rem;
        }

        .card-title {
            margin-bottom: .75rem;
        }
        .card-inner-cstm {margin-bottom:30px;}
        .card-pink {background-color:#e6b9b8;}
        .card-blue-dark {background-color:#4f81bd;}

        p {
            margin-top: 0;
            margin-bottom: 1rem;
        }

        p {
            margin: 0 0 10px;
        }

        a {
            color: #007bff;
            text-decoration: none;
            background-color: transparent;
            -webkit-text-decoration-skip: objects;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="margin-top: 50px;">
    </div>
    <div id="divrecords">
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JSContent" runat="server">
    <script type="text/javascript">
        var html = '';
        var count = 1;
        $(document).ready(function ($) {
            summaryDiv();
            FillDiv();

        });
        var cardtemplate = "<div class=\"col-sm-4\"><div class=\"card card-inner-cstm Cssawd\"><div class=\"card-body\" ><h3 class=\"card-title\">#province</h3><h5 class=\"card-subtitle mb-2 text-muted\">Today Convid-19 Cases </h5><p class=\"card-text\">#data</p></div ></div ></div >";
        function summaryDiv() {
            $.ajax({
                type: "GET",
                url: 'https://api.covid19api.com/summary',
                dataType: 'json',
                async: false,
                beforeSend: function () {
                },
                complete: function (e) {
                },
                success: function (data) {
                    //const { res: { Confirmed, Active, Province, Deaths } } = data;
                    const res = data;
                    if (count == 1) {
                        html += "<div class=\"row\">";
                    }
                    var datarecord = "<b>New Confirmed:</b> " + data.Global.NewConfirmed + " <br /><b> Total Confirmed:</b> " + data.Global.TotalConfirmed + " <br/><b>New Deaths:</b> " + data.Global.NewDeaths + " <br/><b>Total Deaths:</b> " + data.Global.TotalDeaths + " <br/><b>New Recovered:</b> " + data.Global.NewRecovered + " <br/><b>Total Recovered:</b> " + data.Global.TotalRecovered + " <br/><b>Date:</b> " + data.Date;
                    var rec = cardtemplate;
                    rec = rec.replace("#province", "Global");
                    rec = rec.replace("#data", datarecord);                   

                    html += rec;
                    count = count + 1;
                    if (count == 4) {
                        html += "</div>";
                        count = 1;
                    }
                    res.Countries.forEach(function (item) {
                        if (item.Country == "Canada") {
                            if (count == 1) {
                                html += "<div class=\"row\">";
                            }
                            var datarecord = "<b>New Confirmed:</b> " + item.NewConfirmed + " <br /><b> Total Confirmed:</b> " + item.TotalConfirmed + " <br/><b>New Deaths:</b> " + item.NewDeaths + " <br/><b>Total Deaths:</b> " + item.TotalDeaths + " <br/><b>New Recovered:</b> " + item.NewRecovered + " <br/><b>Total Recovered:</b> " + item.TotalRecovered + " <br/><b>Date:</b> " + item.Date;
                            var rec = cardtemplate;
                            rec = rec.replace("#province", "Canada");
                            rec = rec.replace("#data", datarecord);

                            html += rec;
                            count = count + 1;
                            if (count == 4) {
                                html += "</div>";
                                count = 1;
                            }

                        }
                        //etc
                    });                   
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(errorThrown);
                    res = false;

                }
            });

        }

        function FillDiv() {
            var today = new Date();
            var dd = String(today.getDate() - 1).padStart(2, '0');
            var dd1 = String(today.getDate()).padStart(2, '0');
            var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
            var yyyy = today.getFullYear();

            yesterday = yyyy + '-' + mm + '-' + dd;
            todaydate = yyyy + '-' + mm + '-' + dd1;

            $.ajax({
                type: "GET",
                url: 'https://api.covid19api.com/country/canada?from=' + yesterday + 'T00:00:00Z&to=' + todaydate + 'T00:00:00Z',
                dataType: 'json',
                async: false,
                beforeSend: function () {
                },
                complete: function (e) {
                },
                success: function (data) {
                    //const { res: { Confirmed, Active, Province, Deaths } } = data;
                    const res = data;
                    res.forEach(function (item) {
                        if (item.Province != "") {
                            if (count == 1) {
                                html += "<div class=\"row\">";
                            }
                            var datarecord = "<b>Confirmed:</b> " + item.Confirmed + " <br /><b> Deaths:</b> " + item.Deaths + " <br/><b>Recovered:</b> " + item.Recovered + " <br/><b>Active:</b> " + item.Active + " <br/><b>Date:</b> " + item.Date;
                            var rec = cardtemplate;
                            rec = rec.replace("#province", item.Province);
                            rec = rec.replace("#data", datarecord);
                            if (item.Confirmed > 10000)
                                rec = rec.replace("Cssawd", "card-pink");
                            else if (item.Confirmed > 2000)
                                rec = rec.replace("Cssawd", "card-blue-dark");

                            html += rec;
                            count = count + 1;
                            if (count == 4) {
                                html += "</div>";
                                count = 1;
                            }

                        }
                        //etc
                    });

                    console.log(html);
                    $("#divrecords").html(html);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(errorThrown);
                    res = false;

                }
            });

        }
    </script>
</asp:Content>
