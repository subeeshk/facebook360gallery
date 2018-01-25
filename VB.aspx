<%@ Page Language="VB" AutoEventWireup="false" CodeFile="VB.aspx.vb" Inherits="VB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <br />
    <br />
    <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine"></asp:TextBox>
    <hr />
    <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="UploadPhoto" />
    </form>
</body>
</html>
