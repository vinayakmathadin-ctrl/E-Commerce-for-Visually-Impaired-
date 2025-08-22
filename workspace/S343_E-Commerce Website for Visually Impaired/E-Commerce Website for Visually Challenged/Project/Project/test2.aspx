<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMain.master" AutoEventWireup="true" CodeFile="test2.aspx.cs" Inherits="test2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form-group">
                        <label class="col-md-4 control-label">Product Image</label>
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <asp:FileUpload ID="FileUpload1" CssClass="btn btn-default" runat="server"/>
                                <asp:Button ID="ButtonUpload" runat="server" CssClass="btn btn-info" Text="Upload" onclick="ButtonUpload_Click" />
                                <br />
                                <asp:Image ID="Image1" Visible="false" runat="server" Height="100px" Width="99px" />
                            </div>
                        </div>
                    </div>
</asp:Content>

