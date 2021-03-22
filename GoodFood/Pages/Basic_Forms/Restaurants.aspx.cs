using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GoodFood.Pages.Basic_Forms
{
    public partial class Restaurants : System.Web.UI.Page
    {

        List<String> primaryKeys = new List<String>();
        protected void Page_Load(object sender, EventArgs e)
        {
            for (int j = 0; j < RestaurantGridView.Rows.Count; j++)
            {
                primaryKeys.Add(RestaurantGridView.Rows[j].Cells[0].Text);
            }
        }

        protected void PrimaryKeyValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            CustomValidator customValidator = (CustomValidator)RestaurantFormView.FindControl("PrimaryKeyValidator");
            if(args.Value.Trim().ToString().Length == 0)
            {
                customValidator.ErrorMessage = "* Pan Number is requried";
                args.IsValid = false;   
            }
            foreach (String key in primaryKeys)
            {
                if (args.Value.Trim().ToString().Equals(key))
                {
                    args.IsValid = false;
                    break;
                }
            }
        }
    }
}