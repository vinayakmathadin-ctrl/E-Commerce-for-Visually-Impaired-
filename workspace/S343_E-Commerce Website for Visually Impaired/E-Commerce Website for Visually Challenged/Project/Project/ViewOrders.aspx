﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMain.master" AutoEventWireup="true" CodeFile="ViewOrders.aspx.cs" Inherits="ViewOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div >
     <div class="row" >
             <div class="col-lg-4" style="text-align:center">
        <h2>Order Details</h2>
                 </div>
             </div>
     <div class="container">
       <br />
         <br />
     <asp:GridView ID="GridView1" runat="server" BackColor="#CCCCCC" 
             BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" 
             CellSpacing="2" ForeColor="Black" Width="100%" 
             AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField HeaderText="Id" DataField="Oid"/>
             <asp:BoundField HeaderText="Product Name" DataField="ProductName"/>
            <asp:BoundField HeaderText="Quantity" DataField="Qty"/>
              <asp:BoundField HeaderText="Total Cost" DataField="Cost"/>
               <asp:BoundField HeaderText="Date" DataField="Date"/>
               <asp:BoundField HeaderText="Time" DataField="Time"/>
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
         <asp:Label ID="LabelError" runat="server" Text="Currently, there are no orders...!!"></asp:Label>
             </div>
         <br /><br />
    </div>
        </div>
</asp:Content>

