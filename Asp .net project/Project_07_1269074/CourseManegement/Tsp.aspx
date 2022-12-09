<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Tsp.aspx.cs" Inherits="Project_07_1269074.CourseManegement.Tsp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <link href="/Content/icons/font/bootstrap-icons.css" rel="stylesheet" />
    <style>
        
        th a {
            text-decoration: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">
        <div class="col-12">
            <h2 class="display-6" Style="background-color:#767676; color: aqua; padding-left:15px; font-weight: bold; text-align: left; border: outset;">Tsp</h2>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="TspId" DataSourceID="dsTsp" InsertItemPosition="LastItem" OnItemDataBound="ListView1_ItemDataBound">
                
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="TspIdLabel1" runat="server" Text='<%# Eval("TspId") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TspNameTextBox" runat="server" Text='<%# Bind("TspName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TutorIdTextBox" runat="server" Text='<%# Bind("TutorId") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="StudentIdTextBox" runat="server" Text='<%# Bind("StudentId") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                 
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="gi" ID="TspNameTextBox" runat="server" Text='<%# Bind("TspName") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="TspNameTextBox" CssClass="text-danger" ID="RequiredFieldValidator8" runat="server" ErrorMessage="Donor Name is Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:DropDownList CssClass="form-control" ValidationGroup="lv-in" ID="TutorIdTextBox" DataSourceID="SqlDataSource1" AppendDataBoundItems="true" runat="server" SelectedValue='<%# Bind("TutorId") %>' DataValueField="TutorId" DataTextField="TutorName" >
                                <asp:ListItem Text="Select" Value="" Selected="True"></asp:ListItem>
                            </asp:DropDownList>                           
                        </td>
                        <td>
                            <asp:DropDownList CssClass="form-control" ValidationGroup="lv-in" ID="StudentIdTextBox" DataSourceID="SqlDataSource2" AppendDataBoundItems="true" runat="server" SelectedValue='<%# Bind("StudentId") %>' DataValueField="StudentId" DataTextField="StudentName" >
                                <asp:ListItem Text="Select" Value="" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                         <td>
                            <asp:Button CssClass="btn btn-primary btn-sm" ValidationGroup="gi" ID="Button1" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button CssClass="btn btn-secondary btn-sm" ValidationGroup="gi" ID="Button2" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="TspIdLabel" runat="server" Text='<%# Eval("TspId") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TspNameLabel" runat="server" Text='<%# Eval("TspName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TutorIdLabel" runat="server" Text='<%# Eval("TutorId") %>' />
                        </td>
                        <td>
                            <asp:Label ID="StudentIdLabel" runat="server" Text='<%# Eval("StudentId") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server"></th>
                                        <th runat="server">TspId</th>
                                        <th runat="server">TspName</th>
                                        <th runat="server">TutorId</th>
                                        <th runat="server">StudentId</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
               
            </asp:ListView>
            <asp:SqlDataSource ID="dsTsp" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [Tsp] WHERE [TspId] = @TspId" InsertCommand="INSERT INTO [Tsp] ([TspName], [TutorId], [StudentId]) VALUES (@TspName, @TutorId, @StudentId)" SelectCommand="SELECT * FROM [Tsp]" UpdateCommand="UPDATE [Tsp] SET [TspName] = @TspName, [TutorId] = @TutorId, [StudentId] = @StudentId WHERE [TspId] = @TspId">
                <DeleteParameters>
                    <asp:Parameter Name="TspId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TspName" Type="String" />
                    <asp:Parameter Name="TutorId" Type="Int32" />
                    <asp:Parameter Name="StudentId" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TspName" Type="String" />
                    <asp:Parameter Name="TutorId" Type="Int32" />
                    <asp:Parameter Name="StudentId" Type="Int32" />
                    <asp:Parameter Name="TspId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT * FROM [Tutors]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT * FROM [Students]"></asp:SqlDataSource>
            <br />

        </div>
    </div>
</asp:Content>
