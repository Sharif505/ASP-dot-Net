<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="Project_07_1269074.CourseManegement.Courses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
     <link href="/Content/icons/font/bootstrap-icons.css" rel="stylesheet" />
    <style>
        
        th a {
            text-decoration: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <button class="btn btn-primary" type="button" disabled>
  <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
  <span class="visually-hidden">Loading...</span>
</button>
<button class="btn btn-primary" type="button" disabled>
  <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
  Loading...
</button>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel class="w-100" ID="UpdatePanel1" runat="server" RenderMode="Block">
        <ContentTemplate>
                <div class="row">
        <div class="col-12">
            <h2 class="display-5" Style="background-color:#767676; color: aqua; padding-left:15px; font-weight: bold; text-align: left; border: outset;">Employees</h2>
        </div>

         <div class="col-12">
             <asp:ListView ID="ListView1" runat="server" DataSourceID="odsCourses" InsertItemPosition="LastItem" OnItemDataBound="ListView1_ItemDataBound">               
                 <EditItemTemplate>
                     <tr style="">
                         <td>
                             <asp:Button  ValidationGroup="ge" CssClass="btn btn-primary btn-sm" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                             <asp:Button ValidationGroup="ge" CssClass="btn btn-secondary btn-sm" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                         </td>
                         <td>
                             <asp:Label ID="CourseIdLabel1" runat="server" Text='<%# Eval("CourseId") %>' />
                         </td>
                         <td>
                             <asp:TextBox CssClass="form-control" ValidationGroup="ge" ID="CourseNameTextBox" runat="server" Text='<%# Bind("CourseName") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="ge" ControlToValidate="CourseNameTextBox" CssClass="text-danger" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Course Name is Required"></asp:RequiredFieldValidator>
                        </td>
                         <td>
                             <asp:TextBox CssClass="form-control" ValidationGroup="ge" ID="DurationInWeekTextBox" runat="server" Text='<%# Bind("DurationInWeek") %>' />
                                <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="ge" ControlToValidate="DurationInWeekTextBox" CssClass="text-danger" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Donor Name is Required"></asp:RequiredFieldValidator>
                        </td>
                         <td>
                             <asp:TextBox CssClass="form-control" ValidationGroup="ge" ID="FeeTextBox" runat="server" Text='<%# Bind("Fee") %>' />
                                <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="ge" ControlToValidate="FeeTextBox" CssClass="text-danger" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Donor Name is Required"></asp:RequiredFieldValidator>
                        </td>
                         <td>
                             <asp:CheckBox ID="AvailableCheckBox" runat="server" Checked='<%# Bind("Available") %>' />
                         </td>
                         <td>
                              <asp:DropDownList CssClass="form-select form-select-sm" ValidationGroup="lv-in" ID="TutorIdTextBox" DataSourceID="odsTutors" runat="server"  SelectedValue='<%# Bind("TutorId") %>' DataTextField="TutorName" DataValueField="TutorId">
                                
                             </asp:DropDownList>
                         </td>
                     </tr>
                 </EditItemTemplate>
                 <EmptyDataTemplate>
                     <table runat="server" class="table table-bordered">
                         <tr>
                             <td>No data was returned.</td>
                         </tr>
                     </table>
                 </EmptyDataTemplate>
                 <InsertItemTemplate>
                     <tr style="">
                         <td>
                             <asp:Button CssClass="btn btn-primary btn-sm" ValidationGroup="gi" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                             <asp:Button CssClass="btn btn-secondary btn-sm" ValidationGroup="gi" ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                         </td>
                         <td>&nbsp;</td>
                         <td>
                             <asp:TextBox CssClass="form-control" ValidationGroup="gi" ID="CourseNameTextBox" runat="server" Text='<%# Bind("CourseName") %>' />
                             <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="CourseNameTextBox" CssClass="text-danger" ID="RequiredFieldValidator8" runat="server" ErrorMessage="Course Name is Required"></asp:RequiredFieldValidator>
                        </td>
                         <td>
                             <asp:TextBox CssClass="form-control" ValidationGroup="gi" ID="DurationInWeekTextBox" runat="server" Text='<%# Bind("DurationInWeek") %>' />
                          <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="DurationInWeekTextBox" CssClass="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Course Name is Required"></asp:RequiredFieldValidator>
                        </td>
                         <td>
                             <asp:TextBox  CssClass="form-control" ValidationGroup="gi" ID="FeeTextBox" runat="server" Text='<%# Bind("Fee") %>' />
                         <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="FeeTextBox" CssClass="text-danger" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Course Name is Required"></asp:RequiredFieldValidator>
                        </td>
                         <td>
                             <asp:CheckBox ID="AvailableCheckBox" runat="server" Checked='<%# Bind("Available") %>' />
                         </td>
                         <td>
                             <asp:DropDownList CssClass="form-select form-select-sm" ValidationGroup="lv-in" ID="TutorIdTextBox" DataSourceID="odsTutors" AppendDataBoundItems="true" runat="server"  SelectedValue='<%# Bind("TutorId") %>' DataTextField="TutorName" DataValueField="TutorId">
                                 <asp:ListItem Text="Select" Value="" Selected="True"></asp:ListItem>
                             </asp:DropDownList>
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
                             <asp:Label ID="CourseIdLabel" runat="server" Text='<%# Eval("CourseId") %>' />
                         </td>
                         <td>
                             <asp:Label ID="CourseNameLabel" runat="server" Text='<%# Eval("CourseName") %>' />
                         </td>
                         <td>
                             <asp:Label ID="DurationInWeekLabel" runat="server" Text='<%# Eval("DurationInWeek") %>' />
                         </td>
                         <td>
                             <asp:Label ID="FeeLabel" runat="server" Text='<%# Eval("Fee") %>' />
                         </td>
                         <td>
                             <asp:CheckBox ID="AvailableCheckBox" runat="server" Checked='<%# Eval("Available") %>' Enabled="false" />
                         </td>
                         <td>
                             <asp:Label ID="TutorIdLabel" runat="server" Text='<%# Eval("TutorId") %>' />
                         </td>
                     </tr>
                 </ItemTemplate>
                 <LayoutTemplate>
                     <table runat="server" class="table">
                         <tr runat="server">
                             <td runat="server">
                                 <table class="table table-bordered table-striped" id="itemPlaceholderContainer" runat="server" border="0" style="text-align:center">
                                     <tr runat="server" style="">
                                         <th runat="server"></th>
                                         <th runat="server">CourseId</th>
                                         <th runat="server">CourseName</th>
                                         <th runat="server">DurationInWeek</th>
                                         <th runat="server">Fee</th>
                                         <th runat="server">Available</th>
                                         <th runat="server">TutorId</th>
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
                 <SelectedItemTemplate>
                     <tr style="">
                         <td>
                             <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                             <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                         </td>
                         <td>
                             <asp:Label ID="CourseIdLabel" runat="server" Text='<%# Eval("CourseId") %>' />
                         </td>
                         <td>
                             <asp:Label ID="CourseNameLabel" runat="server" Text='<%# Eval("CourseName") %>' />
                         </td>
                         <td>
                             <asp:Label ID="DurationInWeekLabel" runat="server" Text='<%# Eval("DurationInWeek") %>' />
                         </td>
                         <td>
                             <asp:Label ID="FeeLabel" runat="server" Text='<%# Eval("Fee") %>' />
                         </td>
                         <td>
                             <asp:CheckBox ID="AvailableCheckBox" runat="server" Checked='<%# Eval("Available") %>' Enabled="false" />
                         </td>
                         <td>
                             <asp:Label ID="TutorIdLabel" runat="server" Text='<%# Eval("TutorId") %>' />
                         </td>
                     </tr>
                 </SelectedItemTemplate>
             </asp:ListView>
             <asp:ObjectDataSource ID="odsCourses" runat="server" DataObjectTypeName="Project_07_1269074.BLL.CourseDTO" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="GetAll" TypeName="Project_07_1269074.BLL.CourseAuthor" UpdateMethod="Update"></asp:ObjectDataSource>
             <asp:ObjectDataSource ID="odsTutors" runat="server" SelectMethod="CourseDropItem" TypeName="Project_07_1269074.BLL.CourseAuthor"></asp:ObjectDataSource>
        </div>
    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
