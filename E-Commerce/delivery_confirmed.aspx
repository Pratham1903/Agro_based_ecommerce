<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="delivery_confirmed.aspx.cs" Inherits="Final_Project.WebForm14" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="delivery-section">
            <div class="delivery-header">
                <h1>Delivery Address</h1>
            </div>
            <div class="delivery-form">
                <label for="Name">Name<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="Name" ForeColor="Red"></asp:RequiredFieldValidator>
                </label>
                &nbsp;<asp:TextBox ID="Name" runat="server"  />

                <label for="Mobile">Mobile Number        <asp:TextBox ID="Mobile" runat="server" TextMode="Phone"/>

                <label for="Country">Country<asp:RequirCountry<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="Country" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </label>
&nbsp;<asp:DropDownList ID="Country" runat="server">
                    <asp:ListItem Text="India" Value="India" />
                    
                </asp:DropDownList>

                <label for="Pincode">Pincode*        <asp:TextBox ID="Pincode" runat="server"  />

                <label for="State">State*</label>
                <asp:DropDownList ID="State" runat="server">
                    <asp:ListItem Text="Bihar" Value="Bihar" />
                    
                </asp:DropDownList>

                <label for="District">District<asp:RequiDistrict</asp:RequiDistrict><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="District" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </label>
&nbsp;<asp:TextBox ID="District" runat="server" />

                <label for="City">City / Village / Mandal / Taluk<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="City" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </label>
&nbsp;<asp:TextBox ID="City" runat="server" />

                <label for="Address">Address<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="Address" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </label>&nbsp;<asp:TextBox ID="Address" runat="server" TextMode="MultiLine" />

                <label for="Landmark">Landmark</label>
                <asp:TextBox ID="Landmark" runat="server"  />

                <div class="checkbox-container">
                    <asp:CheckBox ID="SaveInfo" runat="server" />
                    <label for="SaveInfo">Save this information for next timetion for next time        
                </div>

                <asp:Button ID="SubmitButton" runat="server" Text="Submit" CssClass="submit-button" OnClick="Button1_Click" />
            </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*Enter PINCODE" ControlToValidate="Pincode" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*Enter State" ControlToValidate="State" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
</asp:Content>
