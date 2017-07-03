<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GalleryTest.aspx.cs" Inherits="ArtGalleryTest.GalleryTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Art Gallery</title>
</head>
<body>
    <form id="form1" runat="server">
        <div align="center">
            <table>
                <tr>
                    <td>ArtistId</td>
                    <td>
                        <asp:TextBox ID="txtArtistId" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>First Name</td>
                    <td>
                        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Last Name</td>
                    <td>
                        <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Date of Birth</td>
                    <td>
                        <asp:TextBox ID="txtBirthDate" runat="server" ToolTip="MM/dd/yyyy"></asp:TextBox>                        
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <div align="center">
                <asp:Button ID="btnInsert" runat="server" Text="Add New Artist" Height="30" Width="100" OnClick="btnInsert_Click" OnClientClick="return validate();" />
            </div>
            <div>
                <asp:GridView ID="grdArtist" HeaderStyle-BackColor="SlateGray" runat="server" HeaderStyle-ForeColor="White" AutoGenerateColumns="false" OnRowEditing="grdArtist_RowEditing">
                    <Columns>
                        <asp:BoundField DataField="ArtistId" HeaderText="Artist ID" ReadOnly="true" />
                        <asp:BoundField DataField="FirstName" HeaderText="FirstName" />
                        <asp:BoundField DataField="LastName" HeaderText="LastName" />
                        <asp:BoundField DataField="DateofBirth" HeaderText="Date Of Birth" DataFormatString="{0:MM/dd/yyyy}" HtmlEncode="false" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton Text="Edit" runat="server" CommandName="Edit"></asp:LinkButton>
                                <asp:LinkButton Text="Delete" runat="server" OnClick="OnDelete"></asp:LinkButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:LinkButton Text="Update" runat="server" OnClick="OnUpdate"></asp:LinkButton>
                                <asp:LinkButton Text="Cancel" runat="server" OnClick="OnCancel"></asp:LinkButton>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Art">
                            <ItemTemplate>
                                <asp:Button ID="btnArt" runat="server" Text="Art" />
                                <asp:Panel ID="pnlArt" runat="server" CssClass="modalPopup" HorizontalAlign="Center">
                                    <table>
                                        <tr>
                                        </tr>
                                    </table>
                                </asp:Panel>
<%--                                <asp:ModalPopupExtender ID="artModal" runat="server" TargetControlID="btnArt" PopupControlID="pnlArt" BackgroundCssClass="modalBackground" CancelControlID="btnCancel" DropShadow="true">
                                </asp:ModalPopupExtender>--%>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
        <script type="text/javascript">     
        function validate() {
            var artistid = document.getElementById("txtArtistId").value;
            var firstname = document.getElementById("txtFirstName").value;
            var lastname = document.getElementById("txtLastName").value;
            var birthday = document.getElementById("txtBirthDate")
            var email = document.getElementById("txtEmail").value;
            if (artistid == "" || firstname == "" || lastname == "" || email == "") {
                alert("Fill All the Fields");
                return false;
            }
            else {
                return true;
            }
        }
    </script>
</body>
</html>
