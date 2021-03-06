﻿<%@ Page Title="Print Known File Formats" Language="VB" MasterPageFile="~/MasterPage.master" %>


<script runat="server">

    
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" Runat="Server">

    <div class="container">
    <div class="row">
        
            <h3>Print Known File Formats without displaying any Print dialog! <small>(if needed)</small></h3>
            <p>
                With <strong>WebClientPrint for ASP.NET</strong> solution you can <strong>print most common file formats</strong> <em>(PDF, TXT, DOC/X, XLS/X, JPG/JPEG, PNG, TIF/TIFF)</em> right to any installed printer at the client side.
            </p>

            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="btn btn-info btn-lg">
                                Client System Requirements
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body">
                            <table class="table table-bordered">
                                <thead>
                                    <tr style="background-color:#ececec; font-weight:bold;color:#666">
                                        <td style="width:20%">File Format</td>
                                        <td style="width:40%">Windows Clients</td>
                                        <td style="width:40%">Linux, Raspberry Pi &amp; Mac Clients</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>DOC, DOCX</td>
                                        <td><span class="badge alert-warning"><i class="glyphicon glyphicon-info-sign"></i></span> Microsoft Word is required</td>
                                        <td><span class="badge alert-warning"><i class="glyphicon glyphicon-info-sign"></i></span> LibreOffice is required</td>
                                    </tr>
                                    <tr>
                                        <td>XLS, XLSX</td>
                                        <td><span class="badge alert-warning"><i class="glyphicon glyphicon-info-sign"></i></span> Microsoft Excel is required</td>
                                        <td><span class="badge alert-warning"><i class="glyphicon glyphicon-info-sign"></i></span> LibreOffice is required</td>
                                    </tr>
                                    <tr>
                                        <td>PDF</td>
                                        <td><span class="badge alert-warning"><i class="glyphicon glyphicon-info-sign"></i></span> Adobe Acrobat or Foxit Reader is required</td>
                                        <td><span class="badge alert-success"><i class="glyphicon glyphicon-ok-sign"></i></span> Natively supported!</td>
                                    </tr>
                                    <tr>
                                        <td>TXT</td>
                                        <td><span class="badge alert-warning"><i class="glyphicon glyphicon-info-sign"></i></span> Notepad is required</td>
                                        <td><span class="badge alert-success"><i class="glyphicon glyphicon-ok-sign"></i></span> Natively supported!</td>
                                    </tr>
                                    <tr>
                                        <td>JPEG</td>
                                        <td><span class="badge alert-success"><i class="glyphicon glyphicon-ok-sign"></i></span> Natively supported!</td>
                                        <td><span class="badge alert-success"><i class="glyphicon glyphicon-ok-sign"></i></span> Natively supported!</td>
                                    </tr>
                                    <tr>
                                        <td>PNG</td>
                                        <td><span class="badge alert-success"><i class="glyphicon glyphicon-ok-sign"></i></span> Natively supported!</td>
                                        <td><span class="badge alert-success"><i class="glyphicon glyphicon-ok-sign"></i></span> Natively supported!</td>
                                    </tr>
                                    <tr>
                                        <td>BMP</td>
                                        <td><span class="badge alert-success"><i class="glyphicon glyphicon-ok-sign"></i></span> Natively supported!</td>
                                        <td><span class="badge alert-success"><i class="glyphicon glyphicon-ok-sign"></i></span> Natively supported!</td>
                                    </tr>
                                    <tr>
                                        <td>Printer Support</td>
                                        <td><span class="badge alert-warning"><i class="glyphicon glyphicon-info-sign"></i></span> You can print files to local installed printers ONLY! Parallel, Serial and IP/Ethernet printers are NOT supported.</td>
                                        <td><span class="badge alert-success"><i class="glyphicon glyphicon-ok-sign"></i></span> You can print files to any installed printers through CUPS system.</td>
                                    </tr>
                                </tbody>
                            </table>
                            
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingTwo">
                        <h4 class="panel-title">
                            <a class="collapsed btn btn-info btn-lg" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                Test Printing Now!
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body">
                            <p>
                                The following are pre-selected files to test WebClientPrint File Printing feature.
                            </p>
                            <div class="row">
                                <div class="col-md-4 col-md-offset-2">
                                    <hr />
                                    <label class="checkbox">
                                        <input type="checkbox" id="useDefaultPrinter" /> <strong>Print to Default printer</strong> or...
                                    </label>
                                    <div id="loadPrinters">
                                        Click to load and select one of the installed printers!
                                        <br />
                                        <a onclick="javascript:jsWebClientPrint.getPrinters();" class="btn btn-success">Load installed printers...</a>
                                        <br /><br />
                                    </div>
                                    <div id="installedPrinters" style="visibility:hidden">
                                        <label for="installedPrinterName">Select an installed Printer:</label>
                                        <select name="installedPrinterName" id="installedPrinterName"></select>
                                    </div>
                                    <script type="text/javascript">
                                        var wcppGetPrintersDelay_ms = 5000; //5 sec
                                        function wcpGetPrintersOnSuccess(){
                                            // Display client installed printers
                                            if(arguments[0].length > 0){
                                                var p=arguments[0].split("|");
                                                var options = '';
                                                for (var i = 0; i < p.length; i++) {
                                                    options += '<option>' + p[i] + '</option>';
                                                }
                                                $('#installedPrinters').css('visibility','visible');
                                                $('#installedPrinterName').html(options);
                                                $('#installedPrinterName').focus();
                                                $('#loadPrinters').hide();
                                            }else{
                                                alert("No printers are installed in your system.");
                                        }
                                        }
                                        function wcpGetPrintersOnFailure() {
                                            // Do something if printers cannot be got from the client
                                            alert("No printers are installed in your system.");
                                        }
                                    </script>
                                </div>
                                <div class="col-md-4">
                                    <hr />
                                    <div id="fileToPrint">
                                        <label for="ddlFileType">Select a sample File to print:</label>
                                        <select id="ddlFileType">
                                            <option>PDF</option>
                                            <option>TXT</option>
                                            <option>DOC</option>
                                            <option>XLS</option>
                                            <option>JPG</option>
                                            <option>PNG</option>
                                            <option>TIF</option>
                                        </select>
                                        <br />
                                        <a class="btn btn-success btn-large" onclick="javascript:jsWebClientPrint.print('useDefaultPrinter=' + $('#useDefaultPrinter').attr('checked') + '&printerName=' + $('#installedPrinterName').val() + '&filetype=' + $('#ddlFileType').val());">Print File...</a>
                                    </div>
                                </div>
                            </div>
                            <h5>File Preview</h5>
                            <iframe id="ifPreview" style="width:100%; height:500px;" frameborder="0"></iframe>
                        
                        </div>
                    </div>
                </div>
                
            </div>


            
        
    </div>
</div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderScripts" Runat="Server">

    <%-- Register the WebClientPrint script code --%>
    <%=Neodynamic.SDK.Web.WebClientPrint.CreateScript(HttpContext.Current.Request.Url.Scheme & "://" & HttpContext.Current.Request.Url.Host & ":" & HttpContext.Current.Request.Url.Port & "/WebClientPrintAPI.ashx", HttpContext.Current.Request.Url.Scheme & "://" & HttpContext.Current.Request.Url.Host & ":" & HttpContext.Current.Request.Url.Port & "/DemoPrintFileHandler.ashx", HttpContext.Current.Session.SessionID)%>

    <script type="text/javascript">
        $("#ddlFileType").change(function () {
            var s = $("#ddlFileType option:selected").text();
            if (s == 'DOC') $("#ifPreview").attr("src", "//docs.google.com/gview?url=http://webclientprint.azurewebsites.net/files/LoremIpsum.doc&embedded=true");
            if (s == 'PDF') $("#ifPreview").attr("src", "//docs.google.com/gview?url=http://webclientprint.azurewebsites.net/files/LoremIpsum.pdf&embedded=true");
            if (s == 'TXT') $("#ifPreview").attr("src", "//docs.google.com/gview?url=http://webclientprint.azurewebsites.net/files/LoremIpsum.txt&embedded=true");
            if (s == 'TIF') $("#ifPreview").attr("src", "//docs.google.com/gview?url=http://webclientprint.azurewebsites.net/files/patent2pages.tif&embedded=true");
            if (s == 'XLS') $("#ifPreview").attr("src", "//docs.google.com/gview?url=http://webclientprint.azurewebsites.net/files/SampleSheet.xls&embedded=true");
            if (s == 'JPG') $("#ifPreview").attr("src", "//webclientprint.azurewebsites.net/files/penguins300dpi.jpg");
            if (s == 'PNG') $("#ifPreview").attr("src", "//webclientprint.azurewebsites.net/files/SamplePngImage.png");
        }).change();
    </script>

</asp:Content>

