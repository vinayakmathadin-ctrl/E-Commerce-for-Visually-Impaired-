<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMain.master" AutoEventWireup="true" CodeFile="UserDetails.aspx.cs" Inherits="UserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
             <div class="col-lg-4" style="text-align:center">
        <h2>User Details</h2>
                 </div>
             </div>
    
     <div class="container">
         <br /><br />
        <asp:GridView ID="GridView1" runat="server" BackColor="#CCCCCC" BorderColor="#999999"
            BorderStyle="Solid" BorderWidth="3px" CellPadding="4" AutoGenerateColumns="false" CellSpacing="2" ForeColor="Black"
            Width="100%">
            <Columns>
                <asp:BoundField HeaderText="Id" DataField="Uid" />
                <asp:BoundField HeaderText="Name" DataField="Username" />
                <asp:BoundField HeaderText="Email" DataField="Email" />
                <asp:BoundField HeaderText="Contact" DataField="Contact" />
                <asp:BoundField HeaderText="Address" DataField="Address" />
                
                <asp:BoundField HeaderText="Age" DataField="Age" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
          <br /><br />
         <div style="text-align:center">
         <asp:Label ID="LabelError" runat="server" Visible="false" Text="Currently, none of the user registered...!!"></asp:Label>
             </div>
         <br /><br />
    </div>
</asp:Content>

