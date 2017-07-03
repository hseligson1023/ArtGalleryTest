<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArtGallery.aspx.cs" Inherits="ArtGallery.ArtGallery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Art Gallery</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
   <%-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.0/css/bootstrap-datepicker3.standalone.css" />--%>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Panel runat="server" CssClass="table-responsive">
                    <!-- Artist GridView -->
                    <asp:GridView runat="server" ID="grdArtist" AllowPaging="true" PageSize="3" OnPageIndexChanging="grdArtist_PageIndexChanging" PagerStyle-CssClass="bs-pagination" AutoGenerateColumns="false" DataKeyNamee="ArtistId" OnRowCommand="grdArtist_RowCommand" CssClass="table table-hover table-striped grdViewTable">
                        <Columns>
                            <asp:BoundField DataField="ArtistId" HeaderText="ArtistId" SortExpression="ArtistId" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" ItemStyle-CssClass="hidden-md" HeaderStyle-CssClass="hidden-md" />
                            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" ItemStyle-CssClass="visible-lg" HeaderStyle-CssClass="visible-lg" />
                            <asp:BoundField DataField="DateofBirth" HeaderText="DateOfBirth" SortExpression="DateOfBirth" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" ItemStyle-CssClass="hidden-md" HeaderStyle-CssClass="hidden-md" />
                            <asp:TemplateField HeaderText="Art">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID="lnkArt" href="#artModal" data-toggle="modal">View Art</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-CssClass="sorting_disabled">
                                <ItemTemplate>
                                    <div class="form-inline">
                                        <div class=""></div>
                                        <asp:LinkButton ID="gvLnkEdit" CommandName="editRecord" CommandArgument='<%#((GridViewRow)Container).RowIndex%>' CssClass="btn btn-info" runat="server">
                                            <i class="fa fa-floppy-o" title="save"></i> 
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="gvLnkDelete" CommandName="deleteRecord" CommandArgument='<%#((GridViewRow)Container).RowIndex%>' CssClass="btn btn-info" runat="server">
                                            <i class="fa fa-trash" title="delete"></i> 
                                        </asp:LinkButton>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle CssClass="rowStyle" />
                        <HeaderStyle CssClass="headerStyle" />
                        <FooterStyle CssClass="footerStyle" />
                        <PagerStyle HorizontalAlign="Center" />
                        <PagerSettings Mode="NumericFirstLast" PageButtonCount="4" FirstPageText="First" LastPageText="Last" />
                    </asp:GridView>
                    <!-- Artist Modal Popup Detail / Edit-->
                    <div class="modal fade" id="artistModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title text-center" id="H1">
                                        <asp:Label runat="server" ID="lbl1" Text="View/Edit Artist"></asp:Label>
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                                        <ContentTemplate>
                                            <div class="form-horizontal">
                                                <div class="form-group">
                                                    <label for="txtArtistId" class="col-lg-2 control-label">Artist ID</label>
                                                    <div class="col-lg-10">
                                                        <asp:TextBox runat="server" ID="txtArtistId" disabled="disabled"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtArtistId" class="col-lg-2 control-label">First Name</label>
                                                    <div class="col-lg-10">
                                                        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtArtistId" class="col-lg-2 control-label">Last Name</label>
                                                    <div class="col-lg-10">
                                                        <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtArtistId" class="col-lg-2 control-label">Date Of Birth</label>
                                                    <div class='input-group date' id="birthdate"></div>
                                                    <input type="text" class="form-control" />
                                                    <span class="input-group-addon"></span>
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtArtistId" class="col-lg-2 control-label">Email</label>
                                                    <div class="col-lg-10">
                                                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="modal-footer">
                                    <asp:LinkButton runat="server" ID="lnkSave" CssClass="btn btn-info">Save
                                        <i class="fa fa-floppy-o" title="save"></i> 
                                    </asp:LinkButton>
                                    <button type="button" class="btn btn-info" data-dismiss="modal">Cancel</button>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
                    <!-- /.modal -->
                    <!-- Modal Delete -->
                    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="artistModal" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismis="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title text-center" id="H2">
                                        <asp:Label ID="lblDelete" runat="server" Text="Delete Artist"></asp:Label>
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <asp:UpdatePanel ID="UpdatePane3" runat="server">
                                        <ContentTemplate>
                                            <asp:HiddenField ID="hf_DeleteID" runat="server" />
                                            f
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="modal-footer">
                                    <asp:LinkButton ID="lnkDelete" CssClass="btn btn-info" runat="server">Delete
                                    <i class="fa fa-trash" title="delete"></i> 
                                    </asp:LinkButton>
                                    <button type="button" class="btn btn-info" data-dismiss="modal">Cancel</button>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
                    <!-- /.modal -->
                </asp:Panel>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="grd1" />
            </Triggers>
        </asp:UpdatePanel>
        <div>
        </div>
        <!-- Art Modal Popup -->
        <div id="artModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/bs.pagination.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.1/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#birthdate").datepicker({
                autoclose: true,
                format: 'yyyy-mm-dd',
                todayHighlight: true,
                clearBtn: true,
                orientation: 'bottom'
            });
        });
        function GridViewFix() {
            var tableClass = $('[class*="grdViewTable"]');
            var tableId = $(tableClass).attr('id');
            var table = $('#' + String(tableId));
            var thead = table.find("thead");
            if (thead.length === 0) {
                table.prepend("<thead></thead>").find("thead").addClass('headerStyle' + tableId);
                $('#' + tableId + 'tr:first').prependTo("thead.headerStyle" + tableId);
                $('#' + tableId).unwrap();
            }
        }
    </script>
    <script src="Scripts/jquery-1.9.1.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
