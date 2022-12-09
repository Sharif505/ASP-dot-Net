<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="Project_07_1269074.CourseManegement.Students" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    
            <div class="row">
                <div class="col-12">
                    <h2 class="display-5" style="background-color: #767676; color: aqua; padding-left: 15px; font-weight: bold; text-align: left; border: outset;">Students</h2>
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="StudentId" DataSourceID="dsStudents" InsertItemPosition="LastItem" OnItemDataBound="ListView1_ItemDataBound" OnItemInserting="ListView1_ItemInserting" OnItemUpdating="ListView1_ItemUpdating">

                        <EditItemTemplate>
                            <tr style="">

                                <td>[Auto]</td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ValidationGroup="ge" ID="StudentNameTextBox" runat="server" Text='<%# Bind("StudentName") %>' />
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="ge" ControlToValidate="StudentNameTextBox" CssClass="text-danger" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Donor Name is Required"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ValidationGroup="ge" ID="StudentEmailTextBox" runat="server" Text='<%# Bind("StudentEmail") %>' />
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="ge" ControlToValidate="StudentEmailTextBox" CssClass="text-danger" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Donor Name is Required"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ValidationGroup="ge" ID="StudentPhoneTextBox" runat="server" Text='<%# Bind("StudentPhone") %>' />
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="ge" ControlToValidate="StudentPhoneTextBox" CssClass="text-danger" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Donor Name is Required"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <img src='<%# Eval("Picture", "/Uploads/{0}") %>' class="img-thumbnail" />
                                    <asp:FileUpload ValidationGroup="gi" ID="fu" runat="server" />
                                    <asp:HiddenField ID="PictureTextBox" runat="server" Value='<%# Bind("Picture") %>' />
                                </td>
                                <td>
                                    <asp:Button ValidationGroup="ge" CssClass="btn btn-primary btn-sm" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ValidationGroup="ge" CssClass="btn btn-secondary btn-sm" CausesValidation="false" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
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

                                <td>&nbsp;</td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ValidationGroup="gi" ID="StudentNameTextBox" runat="server" Text='<%# Bind("StudentName") %>' />
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="StudentNameTextBox" CssClass="text-danger" ID="RequiredFieldValidator8" runat="server" ErrorMessage="Donor Name is Required"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ValidationGroup="gi" ID="StudentEmailTextBox" runat="server" Text='<%# Bind("StudentEmail") %>' />
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="StudentEmailTextBox" CssClass="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Donor Name is Required"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ValidationGroup="gi" ID="StudentPhoneTextBox" runat="server" Text='<%# Bind("StudentPhone") %>' />
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="StudentPhoneTextBox" CssClass="text-danger" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Donor Name is Required"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                            <asp:FileUpload ValidationGroup="gi" ID="fu" runat="server" />
                            <asp:HiddenField ID="PictureTextBox" runat="server" Value='<%# Bind("Picture") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="fu" CssClass="text-danger" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Picture Required"></asp:RequiredFieldValidator>
                        </td>
                                <td style="width: 150px; text-align: center">
                                    <asp:Button CssClass="btn btn-primary btn-sm" ValidationGroup="gi" ID="Button1" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button CssClass="btn btn-secondary btn-sm" ValidationGroup="gi" ID="Button2" runat="server" CommandName="Cancel" Text="Clear" />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="">

                                <td>
                                    <asp:Label ID="StudentIdLabel" runat="server" Text='<%# Eval("StudentId") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="StudentNameLabel" runat="server" Text='<%# Eval("StudentName") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="StudentEmailLabel" runat="server" Text='<%# Eval("StudentEmail") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="StudentPhoneLabel" runat="server" Text='<%# Eval("StudentPhone") %>' />
                                </td>
                                <td>
                                    <img src='<%# Eval("Picture", "/Uploads/{0}") %>' class="img-thumbnail" style="width: 60px; height: 50px;" />
                                </td>
                                <td style="text-align: center">
                                    <asp:Button CssClass="btn btn-danger btn-sm" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                    <asp:Button CssClass="btn btn-secondary btn-sm" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server" class="table">
                                <tr runat="server">
                                    <td runat="server">
                                        <table class="table table-bordered table-striped" id="itemPlaceholderContainer" runat="server" border="0" style="text-align: center">
                                            <tr runat="server" style="">
                                                <th runat="server"></th>
                                                <th runat="server">StudentName</th>
                                                <th runat="server">StudentEmail</th>
                                                <th runat="server">StudentPhone</th>
                                                <th runat="server">Picture</th>
                                                <th runat="server">Button</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style="">
                                        <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>

                    </asp:ListView>
                    <asp:SqlDataSource ID="dsStudents" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [Students] WHERE [StudentId] = @StudentId" InsertCommand="INSERT INTO [Students] ([StudentName], [StudentEmail], [StudentPhone], [Picture]) VALUES (@StudentName, @StudentEmail, @StudentPhone, @Picture)" SelectCommand="SELECT * FROM [Students]" UpdateCommand="UPDATE [Students] SET [StudentName] = @StudentName, [StudentEmail] = @StudentEmail, [StudentPhone] = @StudentPhone, [Picture] = @Picture WHERE [StudentId] = @StudentId">
                        <DeleteParameters>
                            <asp:Parameter Name="StudentId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="StudentName" Type="String" />
                            <asp:Parameter Name="StudentEmail" Type="String" />
                            <asp:Parameter Name="StudentPhone" Type="String" />
                            <asp:Parameter Name="Picture" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="StudentName" Type="String" />
                            <asp:Parameter Name="StudentEmail" Type="String" />
                            <asp:Parameter Name="StudentPhone" Type="String" />
                            <asp:Parameter Name="Picture" Type="String" />
                            <asp:Parameter Name="StudentId" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT [TutorId], [TutorName] FROM [Tutors]"></asp:SqlDataSource>
                </div>
            </div>
       
</asp:Content>
