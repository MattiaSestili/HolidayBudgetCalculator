using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    int numberPeople;
    int numberKids;
    int numberDays;

    string travel;
    double accomodation;
    double hotelPerDays;
    double hotelPerNight;
    double bus;
    double taxi;
    double train;
    double activities;
    double shopping;
    double meal;
    double kidsMeal;



    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            ImagePerson1.Visible = false;
            ImagePerson2.Visible = false;
            ImagePerson3.Visible = false;
            ImagePerson4.Visible = false;

            ImageKid1.Visible = false;
            ImageKid2.Visible = false;
            ImageKid3.Visible = false;
            ImageKid4.Visible = false;

            ImageHouse1.Visible = false;
            ImageHouse2.Visible = false;
            ImageHouse3.Visible = false;
            ImageHouse4.Visible = false;

            ImagePlusHouse.Visible = false;
            ImagePlusPerson.Visible = false;
            ImagePlusKid.Visible = false;

            TextBoxPeople.Text = "0";
            TextBoxKids.Text = "0";
            TextBoxDays.Text = "0";
        }
    }

    protected void TextBoxPeople_TextChanged(object sender, EventArgs e)
    {
        numberPeople = Convert.ToInt32(TextBoxPeople.Text);

        callPerson(numberPeople);
    }

    protected void ButtonAddPerson_Click(object sender, EventArgs e)
    {
        numberPeople = Convert.ToInt32(TextBoxPeople.Text);
        numberPeople = numberPeople + 1;
        TextBoxPeople.Text = numberPeople.ToString();

        callPerson(numberPeople);
    }

    protected void ButtonLessPerson_Click(object sender, EventArgs e)
    {
        numberPeople = Convert.ToInt32(TextBoxPeople.Text);
        numberPeople = numberPeople - 1;
        TextBoxPeople.Text = numberPeople.ToString();

        callPerson(numberPeople);
      
    }

    protected void TextBoxKids_TextChanged(object sender, EventArgs e)
    {
        numberKids = Convert.ToInt32(TextBoxKids.Text);

        callKid(numberKids);
    }

    protected void ButtonLessKid_Click(object sender, EventArgs e)
    {
        numberKids = Convert.ToInt32(TextBoxKids.Text);
        numberKids = numberKids - 1;
        TextBoxKids.Text = numberKids.ToString();

        callKid(numberKids);
    }

    protected void ButtonAddKid_Click(object sender, EventArgs e)
    {
        numberKids = Convert.ToInt32(TextBoxKids.Text);
        numberKids = numberKids + 1;
        TextBoxKids.Text = numberKids.ToString();

        callKid(numberKids);
    }

    protected void TextBoxDays_TextChanged(object sender, EventArgs e)
    {
        numberDays = Convert.ToInt32(TextBoxDays.Text);

        callCalendar(numberDays);
    }

    protected void ButtonLessDays_Click(object sender, EventArgs e)
    {
        numberDays = Convert.ToInt32(TextBoxDays.Text);
        numberDays = numberDays -1;
        TextBoxDays.Text = numberDays.ToString();

        callCalendar(numberDays);
    }

    protected void ButtonAddDays_Click(object sender, EventArgs e)
    {
        numberDays = Convert.ToInt32(TextBoxDays.Text);
        numberDays = numberDays + 1;
        TextBoxDays.Text = numberDays.ToString();

        callCalendar(numberDays);
    }

    protected void ButtonCalculate_Click(object sender, EventArgs e)
    {
        lblChartType.Visible = true;
        DropDownList1.Visible = true;
        travel = TextBoxTravel.Text;
        drawChart(getChartType());
        
    }   


    private void drawChart(string chartType)
    {
        hotelPerDays = getData(TextBoxDays);
        hotelPerNight = getData(TextBoxPerNight);
        accomodation = hotelPerDays * hotelPerNight;
        taxi = getData(TextBoxTaxi);
        bus = getData(TextBoxBus);
        train = getData(TextBoxTrain);
        activities = getData(TextBoxActivities);
        shopping = getData(TextBoxShopping);
        meal = getData(TextBoxEatAmount) * getData(TextBoxEatDays);

        if (CheckBoxKids.Checked == true)
        {
            kidsMeal = meal * 0.2;
        }
        else
        {
            kidsMeal = 0;
        }

        double result = accomodation + taxi + bus + train + activities + shopping + meal + kidsMeal;


        ClientScript.RegisterStartupScript(GetType(), "draw", "draw('" + chartType + "','" + travel + "','" + result + "','" + accomodation + "','" + bus + "','" +
                                            meal + "','" + activities + "','" + train + "','" + taxi + "','" + shopping + "','" + kidsMeal + "');", true);
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (DropDownList1.SelectedValue)
        {
            case "pie":
                drawChart("pie");
                break;
            case "doughnut":
                drawChart("doughnut");
                break;
        }
    }

    private string getChartType()
    {
        return DropDownList1.SelectedValue;
    }

    private double getData(TextBox txtBoxValue)
    {
        if (!string.IsNullOrWhiteSpace(txtBoxValue.Text))
        {
            return double.Parse(txtBoxValue.Text);
        }
        else
        {
            txtBoxValue.Text = "0";
            return 0;
        }
    }

//the rest of the file is to do with displaying icons
    public void callCalendar(int number)
    {
        switch (number)
        {
            case 1:
                ImageHouse1.Visible = true;
                ImageHouse2.Visible = false;
                ImageHouse3.Visible = false;
                ImageHouse4.Visible = false;
                break;
            case 2:
                ImageHouse1.Visible = true;
                ImageHouse2.Visible = true;
                ImageHouse3.Visible = false;
                ImageHouse4.Visible = false;
                break;
            case 3:
                ImageHouse1.Visible = true;
                ImageHouse2.Visible = true;
                ImageHouse3.Visible = true;
                ImageHouse4.Visible = false;
                break;
            case 4:
                ImageHouse1.Visible = true;
                ImageHouse2.Visible = true;
                ImageHouse3.Visible = true;
                ImageHouse4.Visible = true;
                break;
            default:
                ImageHouse1.Visible = false;
                ImageHouse2.Visible = false;
                ImageHouse3.Visible = false;
                ImageHouse4.Visible = false;
                break;

        }

        if (number > 4)
        {
            ImageHouse1.Visible = true;
            ImageHouse2.Visible = true;
            ImageHouse3.Visible = true;
            ImageHouse4.Visible = true;
            ImagePlusHouse.Visible = true;
        }
        else
        {
            ImagePlusHouse.Visible = false;
        }
    }

    public void callPerson(int number)
    {
        switch (number)
        {
            case 1:
                ImagePerson1.Visible = true;
                ImagePerson2.Visible = false;
                ImagePerson3.Visible = false;
                ImagePerson4.Visible = false;
                break;
            case 2:
                ImagePerson1.Visible = true;
                ImagePerson2.Visible = true;
                ImagePerson3.Visible = false;
                ImagePerson4.Visible = false;
                break;
            case 3:
                ImagePerson1.Visible = true;
                ImagePerson2.Visible = true;
                ImagePerson3.Visible = true;
                ImagePerson4.Visible = false;
                break;
            case 4:
                ImagePerson1.Visible = true;
                ImagePerson2.Visible = true;
                ImagePerson3.Visible = true;
                ImagePerson4.Visible = true;
                break;
            default:
                ImagePerson1.Visible = false;
                ImagePerson2.Visible = false;
                ImagePerson3.Visible = false;
                ImagePerson4.Visible = false;
                break;

        }

        if (number > 4)
        {
            ImagePerson1.Visible = true;
            ImagePerson2.Visible = true;
            ImagePerson3.Visible = true;
            ImagePerson4.Visible = true;
            ImagePlusPerson.Visible = true;
        }
        else
        {
            ImagePlusPerson.Visible = false;
        }
    }

    public void callKid(int number)
    {
        switch (number)
        {
            case 1:
                ImageKid1.Visible = true;
                ImageKid2.Visible = false;
                ImageKid3.Visible = false;
                ImageKid4.Visible = false;
                break;
            case 2:
                ImageKid1.Visible = true;
                ImageKid2.Visible = true;
                ImageKid3.Visible = false;
                ImageKid4.Visible = false;
                break;
            case 3:
                ImageKid1.Visible = true;
                ImageKid2.Visible = true;
                ImageKid3.Visible = true;
                ImageKid4.Visible = false;
                break;
            case 4:
                ImageKid1.Visible = true;
                ImageKid2.Visible = true;
                ImageKid3.Visible = true;
                ImageKid4.Visible = true;
                break;
            default:
                ImageKid1.Visible = false;
                ImageKid2.Visible = false;
                ImageKid3.Visible = false;
                ImageKid4.Visible = false;
                break;

        }

        if (number > 4)
        {
            ImageKid1.Visible = true;
            ImageKid2.Visible = true;
            ImageKid3.Visible = true;
            ImageKid4.Visible = true;
            ImagePlusKid.Visible = true;
        }
        else
        {
            ImagePlusKid.Visible = false;
        }
    }
}