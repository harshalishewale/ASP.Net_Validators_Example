<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ASP.Net_Validators_Example.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        function PhoneOrEmail(source,args) {
            if (txtMobile.value.Trim().Length == 0 && txtEmail.value.Trim().Length == 0) {
                args.IsValid = false;
            }
            else {
                args.IsValid = true;
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label Text="Registration Form" runat="server" ID="lblregform" Font-Bold="true" Font-Size="XX-Large" ForeColor="#0000ff" ></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Name" ForeColor="Red" SetFocusOnError="True" ControlToValidate="txtName"></asp:RequiredFieldValidator>
            <br />
            <br />

            <asp:Label ID="lblMobile" runat="server" Text="Mobile"></asp:Label>
            <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Mobile Number is not valid" ForeColor="Red" SetFocusOnError="True" ControlToValidate="txtMobile" ValidationExpression="(0|91)?[6-9][0-9]{9}" Display="Dynamic"></asp:RegularExpressionValidator>
            <asp:CustomValidator ID="PhoneOrEmail" runat="server" ErrorMessage="Please Enter Mobile No or Email ID" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" OnServerValidate="PhoneOrEmail_ServerValidate" ClientValidationFunction="PhoneOrEmail"></asp:CustomValidator>
            <br />
            <br />

            <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Email ID is not valid" ForeColor="Red" SetFocusOnError="true" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
            <br />
            <br />

            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <asp:Label runat="server" ID="lblDOB" Text="DOB"></asp:Label>
                    <asp:TextBox ID="txtDOB" runat="server"></asp:TextBox>
                    <asp:ImageButton ID="ImageButton1" runat="server" Width="25" Height="25" ImageUrl="~/img/Calender.png" OnClick="ImageButton1_Click" ValidationGroup="A" ImageAlign="AbsMiddle" />
                    <asp:Calendar ID="cldDate" runat="server" Visible="false" OnSelectionChanged="cldDate_SelectionChanged" ValidationGroup="A" BorderStyle="Solid"></asp:Calendar>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter DOB" ControlToValidate="txtDOB" ForeColor="Red" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Enter DOB in Proper Format" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" Operator="DataTypeCheck" Type="Date" ControlToValidate="txtDOB"></asp:CompareValidator>
                    <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="Candidate age must be more than 18 years" SetFocusOnError="true" ForeColor="Red" Display="Dynamic" Type="Date" ControlToValidate="txtDOB" Operator="LessThanEqual" ></asp:CompareValidator>

                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
            <br />

            <asp:Label ID="lblPwd" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="txtPwd" TextMode="Password" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Password" ForeColor="Red" ControlToValidate="txtPwd" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <br />
            <br />

            <asp:Label ID="lblConfirmPwd" runat="server" Text="Confirm Password"></asp:Label>
            <asp:TextBox ID="txtConfirmPwd" TextMode="Password" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Enter Confirm Password" ForeColor="Red" ControlToValidate="txtConfirmPwd" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator><asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Confirm Password should be same as Password" ForeColor="Red" ControlToValidate="txtConfirmPwd" ControlToCompare="txtPwd" Display="Dynamic"></asp:CompareValidator>
            <br />
            <br />

            <asp:Button Text="Submit" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" />
            <br />
            <br />

            <asp:Label ID="lblSubmit" Text="" runat="server"></asp:Label>

        </div>
    </form>
</body>
</html>
