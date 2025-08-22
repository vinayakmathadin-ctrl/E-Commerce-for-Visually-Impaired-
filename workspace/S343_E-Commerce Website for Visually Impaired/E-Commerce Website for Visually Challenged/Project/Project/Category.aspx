﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMain.master" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <title>Category</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="style.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="well form-horizontal">
    <h2><b>Category</b></h2>
                <br>

                <!-- Text input-->
                <div class="wrapper">

                    <div class="form-group">
                        <label class="col-md-4 control-label">Category :</label>
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                
                                <asp:DropDownList ID="TextBox1" runat="server" cssclass="form-control">
                                    <asp:ListItem Selected="True" disabled="disabled">-- Select --</asp:ListItem>
                                    <asp:ListItem>Electronics</asp:ListItem>
                                    <asp:ListItem>Home Appliances</asp:ListItem>
                                    <asp:ListItem>Clothing</asp:ListItem>
                                    <asp:ListItem>Furniture</asp:ListItem>
                                    <asp:ListItem>Life Style</asp:ListItem>
                                    <asp:ListItem>Accessories</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label">Sub Category :</label>
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <asp:textbox id="TextBox2" placeholder="Product Name" cssclass="form-control" runat="server" required></asp:textbox>
                            </div>
                        </div>
                    </div>

                    <!-- Text input-->

                  

                    <!-- Button -->
                    <div class="form-group">
                        <label class="col-md-4 control-label"></label>
                        <div class="col-md-4">
                            <br>
                            <asp:button id="ButtonSubmit" cssclass="btn btn-success" runat="server" 
                                text="SUBMIT" onclick="ButtonSubmit_Click" />
                        </div>
                    </div>

                </div>
        </div>
</asp:Content>

