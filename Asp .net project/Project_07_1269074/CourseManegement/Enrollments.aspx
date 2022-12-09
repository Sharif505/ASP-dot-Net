<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Enrollments.aspx.cs" Inherits="Project_07_1269074.CourseManegement.Enrollments" %>
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
        <div class="col-6">
            <h3 class="display-6">Select Course</h3>
            <asp:GridView ID="GridView1" CssClass="table table-bordered table-striped" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="CourseId" DataSourceID="dsManyCourse" OnRowDataBound="GridView1_RowDataBound">
                <SelectedRowStyle CssClass="bg-secondary text-white" />
                <HeaderStyle CssClass="bg-light" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" CssClass="btn btn-dark btn-outline-primary btn-sm" Text="Select"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CourseId" InsertVisible="False" SortExpression="CourseId">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("CourseId") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("CourseId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="CourseName" HeaderText="Course Name" SortExpression="CourseName" />
                    <asp:BoundField DataField="TspName" HeaderText="Tsp Name" SortExpression="TspName" />
                    <asp:BoundField DataField="TutorName" HeaderText="Tutor Name" SortExpression="TutorName" />
                    <asp:BoundField DataField="DurationInWeek" HeaderText="Duration (In week)" SortExpression="DurationInWeek" />
                    <asp:BoundField DataField="Fee" DataFormatString="{0:0.00}" HeaderText="Fee" SortExpression="Fee" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="dsManyCourse" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT Courses.CourseId, Courses.CourseName, Courses.DurationInWeek, Courses.Fee, Tutors.TutorName, Tsp.TspName FROM Courses INNER JOIN Tutors ON Courses.TutorId = Tutors.TutorId INNER JOIN Tsp ON Tutors.TutorId = Tsp.TutorId"></asp:SqlDataSource>
        </div>
         <div class="col-6">
            <h3 class="display-6">Select Student</h3>
             <asp:ListView ID="ListView1" runat="server" DataKeyNames="StudentId,CourseId" DataSourceID="dsManyStudents" InsertItemPosition="LastItem" OnItemInserting="ListView1_ItemInserting">
                 <AlternatingItemTemplate>
                     <tr style="">
                         <td>
                             <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                             <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                         </td>
                         <td>
                             <asp:Label ID="StudentIdLabel" runat="server" Text='<%# Eval("StudentId") %>' />
                         </td>
                         <td>
                             <asp:Label ID="CourseIdLabel" runat="server" Text='<%# Eval("CourseId") %>' />
                         </td>
                         <td>
                             <asp:Label ID="EnrolldateLabel" runat="server" Text='<%# Eval("Enrolldate") %>' />
                         </td>
                     </tr>
                 </AlternatingItemTemplate>
                 <EditItemTemplate>
                     <tr style="">
                         <td>
                             <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                             <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                         </td>
                         <td>
                             <asp:Label ID="StudentIdLabel1" runat="server" Text='<%# Eval("StudentId") %>' />
                         </td>
                         <td>
                             <asp:Label ID="CourseIdLabel1" runat="server" Text='<%# Eval("CourseId") %>' />
                         </td>
                         <td>
                             <asp:TextBox ID="EnrolldateTextBox" runat="server" Text='<%# Bind("Enrolldate") %>' />
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
                         <td>
                             <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                             <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                         </td>
                         <td>
                             <asp:TextBox ID="StudentIdTextBox" runat="server" Text='<%# Bind("StudentId") %>' />
                         </td>
                          <td>
                             <asp:TextBox ID="EnrolldateTextBox" runat="server" Text='<%# Bind("Enrolldate") %>' />
                         </td>
                         <td>
                             <asp:HiddenField ID="CourseIdTextBox" runat="server" Value='<%# Bind("CourseId") %>' />
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
                             <asp:Label ID="StudentIdLabel" runat="server" Text='<%# Eval("StudentId") %>' />
                         </td>
                         <td>
                             <asp:Label ID="CourseIdLabel" runat="server" Text='<%# Eval("CourseId") %>' />
                         </td>
                         <td>
                             <asp:Label ID="EnrolldateLabel" runat="server" Text='<%# Eval("Enrolldate") %>' />
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
                                         <th runat="server">StudentId</th>       
                                         <th runat="server">Enrolldate</th>
                                         <th runat="server">CourseId</th>
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
             <asp:SqlDataSource ID="dsManyStudents" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [Enrollments] WHERE [StudentId] = @StudentId AND [CourseId] = @CourseId" InsertCommand="INSERT INTO [Enrollments] ([StudentId], [CourseId], [Enrolldate]) VALUES (@StudentId, @CourseId, @Enrolldate)" SelectCommand="SELECT * FROM [Enrollments] WHERE ([CourseId] = @CourseId)" UpdateCommand="UPDATE [Enrollments] SET [Enrolldate] = @Enrolldate WHERE [StudentId] = @StudentId AND [CourseId] = @CourseId">
                 <DeleteParameters>
                     <asp:Parameter Name="StudentId" Type="Int32" />
                     <asp:Parameter Name="CourseId" Type="Int32" />
                 </DeleteParameters>
                 <InsertParameters>
                     <asp:Parameter Name="StudentId" Type="Int32" />
                     <asp:Parameter Name="CourseId" Type="Int32" />
                     <asp:Parameter DbType="Date" Name="Enrolldate" />
                 </InsertParameters>
                 <SelectParameters>
                     <asp:ControlParameter ControlID="GridView1" Name="CourseId" PropertyName="SelectedValue" Type="Int32" />
                 </SelectParameters>
                 <UpdateParameters>
                     <asp:Parameter DbType="Date" Name="Enrolldate" />
                     <asp:Parameter Name="StudentId" Type="Int32" />
                     <asp:Parameter Name="CourseId" Type="Int32" />
                 </UpdateParameters>
             </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
