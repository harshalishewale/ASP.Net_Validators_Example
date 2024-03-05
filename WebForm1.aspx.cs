using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.Net_Validators_Example
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtName.Focus();
                CompareValidator3.ValueToCompare = DateTime.Now.AddYears(-18).ToShortDateString();
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if(cldDate.Visible)
            {
                cldDate.Visible = false;
            }
            else
            {
                cldDate.Visible=true;
            }
        }

        protected void cldDate_SelectionChanged(object sender, EventArgs e)
        {
            txtDOB.Text = cldDate.SelectedDate.ToShortDateString();
            cldDate.Visible = false;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if(IsValid)
            {
                lblSubmit.Text = "Your Registration Done Successfully...";
                lblSubmit.ForeColor = Color.Green;

            }
            else
            {
                lblSubmit.Text = "Check Validation Errors...";
                lblSubmit.ForeColor = Color.Red;
            }
        }

        protected void PhoneOrEmail_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if(txtMobile.Text.Trim().Length==0 && txtEmail.Text.Trim().Length==0) {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }
    }
}