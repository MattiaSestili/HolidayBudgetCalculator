<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Holiday Budget Calculator</title>  
 
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/StyleSheet.css" rel="stylesheet" />

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-2.2.4.min.js"></script>
    <script src="Scripts/canvasjs.min.js"></script>
    <script src="Scripts/ChartJavaScript.js"></script>
    
</head>

<body>
 
<form id="form1" runat="server">

<div class="customContainer">
 
     <div class ="jumbotron">
       <h1>Holiday Budget Calculator</h1>
    </div>

</div>


    <div class="container">   
       
        <div class="row">
            <div class="col-sm-9 dataEntryArea">     
                 
                <div class="col-sm-3 flightCostStyle">  
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <p>Flight Costs</p>

                        <asp:Label ID="labelPlace" runat="server" Text="Where are you going?"></asp:Label>
                        <br/>
                        <asp:TextBox ID="TextBoxTravel" runat="server" CssClass="form-control txtBox" Width="180px" ForeColor="Black"></asp:TextBox>          
                        <br/>
                        <asp:Label ID="labelCostFlight" runat="server" Text="How much have you paid?"></asp:Label>
                        <br/>
                        <asp:TextBox ID="TextBoxCostFlight" runat="server" CssClass="form-control txtBox" Width="180px" ForeColor="Black"></asp:TextBox>          
                        <br/>
                        <br/>
                        <br/>
        
                    <p>How many people?</p>

                        <asp:Label ID="Label5" runat="server" Text="Adult:"></asp:Label>
                        <br/>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Button ID="ButtonLessPerson" runat="server" Text="-" ForeColor="Black" OnClick="ButtonLessPerson_Click" CssClass="btn btn-default" />
                            <asp:TextBox ID="TextBoxPeople" runat="server" OnTextChanged="TextBoxPeople_TextChanged" CssClass="form-control txtBox" AutoPostBack="True" ForeColor="Black" Width="180px"></asp:TextBox>
                            <asp:Button ID="ButtonAddPerson" runat="server" Text="+" OnClick="ButtonAddPerson_Click" ForeColor="Black" CssClass="btn btn-default"/>
                      
                         <asp:Image ID="ImagePerson1" runat="server" ImageUrl="person-icon.png" Height="42px" Width="20px"/>
                        &nbsp;
                        <asp:Image ID="ImagePerson2" runat="server" ImageUrl="person-icon.png" Height="42px" Width="20px"/>
                        &nbsp;
                        <asp:Image ID="ImagePerson3" runat="server" ImageUrl="person-icon.png" Height="42px" Width="20px"/>
                        &nbsp;
                        <asp:Image ID="ImagePerson4" runat="server" ImageUrl="person-icon.png" Height="42px" Width="20px"/>
                        &nbsp;
                        <asp:Image ID="ImagePlusPerson" runat="server" ImageUrl= "plus-icon-person.png" Height="22px" Width="25px"/>
                        </ContentTemplate>  
                    </asp:UpdatePanel> 
                        <br/>
                        <br/>
                        <asp:Label ID="Label6" runat="server" Text="Kids:"></asp:Label>
                        <br/>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                             <asp:Button ID="ButtonLessKid" runat="server" Text="-" ForeColor="Black" OnClick="ButtonLessKid_Click" CssClass="btn btn-default" />
                            <asp:TextBox ID="TextBoxKids" runat="server" OnTextChanged="TextBoxKids_TextChanged" CssClass="form-control txtBox" Width="180px" AutoPostBack="True" ForeColor="Black"></asp:TextBox>
                            <asp:Button ID="ButtonAddKid" runat="server" Text="+" ForeColor="Black" OnClick="ButtonAddKid_Click" CssClass="btn btn-default" />
                            <asp:Image ID="ImageKid1" runat="server" ImageUrl="039.png" Height="50px" Width="30px"/>
                             &nbsp;
                            <asp:Image ID="ImageKid2" runat="server" ImageUrl="039.png" Height="50px" Width="30px"/>
                             &nbsp;    
                            <asp:Image ID="ImageKid3" runat="server" ImageUrl="039.png" Height="50px" Width="30px"/>
                             &nbsp;    
                            <asp:Image ID="ImageKid4" runat="server" ImageUrl="039.png" Height="50px" Width="30px"/>
                              &nbsp;    
                             <asp:Image ID="ImagePlusKid" runat="server" ImageUrl= "plus-icon-person.png" Height="22px" Width="25px"/>
                         </ContentTemplate>
                 </asp:UpdatePanel>
                        <br/>
                        <br/>

                    <p>How many nights?</p>
                      <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <asp:Button ID="ButtonLessDays" runat="server" Text="-" ForeColor="Black" OnClick="ButtonLessDays_Click" CssClass="btn btn-default" />
                                <asp:TextBox ID="TextBoxDays" runat="server" CssClass="form-control txtBox" Width="180px" ForeColor="Black" OnTextChanged="TextBoxDays_TextChanged" AutoPostBack="True"></asp:TextBox>
                                <asp:Button ID="ButtonAddDays" runat="server" Text="+" ForeColor="Black" OnClick="ButtonAddDays_Click" CssClass="btn btn-default" />
                                <asp:Image ID="ImageHouse1" runat="server" ImageUrl="caldays-icon.png" Width="22px" height="25px"/>
                                &nbsp;<asp:Image ID="ImageHouse2" runat="server" ImageUrl="caldays-icon.png" Width="22px" Height="25px"/>
                                &nbsp;<asp:Image ID="ImageHouse3" runat="server" ImageUrl="caldays-icon.png" Width="22px" Height="25px"/>
                                &nbsp;<asp:Image ID="ImageHouse4" runat="server" ImageUrl="caldays-icon.png" Width="22px" Height="25px"/>
                                &nbsp;<asp:Image ID="ImagePlusHouse" runat="server" ImageUrl="plus-icon-person.png" Width="22px" Height="25px"/>
                            
                        <br/>
                        <asp:Label ID="Label7" runat="server" Text="Price per night"></asp:Label>
                        <br/>    
                        <asp:TextBox ID="TextBoxPerNight" runat="server" ForeColor="Black" CssClass="form-control txtBox" Width="180px"></asp:TextBox>                      
                    </ContentTemplate>
                        </asp:UpdatePanel>
            </div>
        
        

        
            <div class="col-sm-3 transportsStyle">  
                
                    
            <p>Transports</p>
                <asp:Label ID="LabelTrain" runat="server" Text="Train:"></asp:Label>
                <br/>
                <asp:TextBox ID="TextBoxTrain" runat="server" ForeColor="Black" CssClass="form-control txtBox" Width="180px"></asp:TextBox>
                <br/>
                <asp:Label ID="LabelTaxi" runat="server" Text="Taxi:" ></asp:Label>
                <br/>
                <asp:TextBox ID="TextBoxTaxi" runat="server" CssClass="form-control txtBox" Width="180px" ForeColor="Black"></asp:TextBox>
                <br/>
                <asp:Label ID="Label8" runat="server" Text="Bus:"></asp:Label>
                <br/>
                <asp:TextBox ID="TextBoxBus" runat="server" CssClass="form-control txtBox" Width="180px" ForeColor="Black"></asp:TextBox>        
                <br/>
                <br/>   
            </div>   
       
        
       
        <div class ="col-sm-3 daycostParagraph">
                <p> Days Costs</p>              
                    <asp:Label ID="Label2" runat="server" Text="Budget meals out?"></asp:Label>
                    <br/>               
                    <asp:TextBox ID="TextBoxEatAmount" runat="server" CssClass="form-control txtBox" Width="180px" ForeColor="Black"></asp:TextBox>
                    <br/>
                    <asp:Label ID="Label9" runat="server" Text="How many time will you eat out?"></asp:Label>
                    <br/>
                    <asp:TextBox ID="TextBoxEatDays" runat="server" CssClass="form-control txtBox" Width="180px" ForeColor="Black"></asp:TextBox>
                    <br/>
                    <asp:Label ID="LabelKidsCheck" runat="server" Text="Kids meal? Less 50%"></asp:Label>
                    <asp:CheckBox ID="CheckBoxKids" runat="server" />           
                    <br/>
                    <br/>

                <p>Budget for Activities:</p>
                    <asp:TextBox ID="TextBoxActivities" runat="server"  CssClass="form-control txtBox" Width="180px" ForeColor="Black"></asp:TextBox>
                    <br/>
                    <br/>
                    <asp:Label ID="Label4" runat="server" Text="Shopping Budget"></asp:Label>
                    <br/>
                    <asp:TextBox ID="TextBoxShopping"  CssClass="form-control txtBox" Width="180px" runat="server" ForeColor="Black"></asp:TextBox>

                    <br />
                    <br />                             
                    <asp:Button ID="ButtonCalculate" href="#chartContainer" runat="server" Text="Calculate" OnClick="ButtonCalculate_Click" ForeColor="Black" CssClass="btn btn-default" />

             </div>
        </div>
        
       
         <div class ="col-sm-3 description">
            
            <h2>Things to think about</h2>
                <p>
                Deciding how much money to take on holiday can feel like plucking a figure out of the air.
                But if you break it down and think about <br />
                what you might spend in a few key areas,
                you can get a realistic travel budget in mind. 
                Use our travel budget calculator, so you can plan ahead and avoid any spending shocks along the way.
                </p>
        </div>  
     </div>      

        <div class="row">
            <div class="col-sm-12">
                <br/>
                 <br/>
                <div id="chartContainer" style="height: 400px; width: 100%;"></div>
            </div>
         </div>
        

         <div class="row">
            <div class="col-sm-4 col-sm-offset-1">
                <asp:label ID="lblChartType" runat="server" Visible="False">Change chart type</asp:label>
             </div>
             <div class="col-sm-6">
                <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true"
                         Font-Size="Medium" ForeColor="Black" Visible="False" CausesValidation="True">
                <asp:ListItem Value="pie" Selected="True">Pie</asp:ListItem>
                <asp:ListItem Value="doughnut">Doughnut</asp:ListItem>
                </asp:DropDownList>
              </div>
            </div>            
       
    </div>
   
</form>
</body>

</html>