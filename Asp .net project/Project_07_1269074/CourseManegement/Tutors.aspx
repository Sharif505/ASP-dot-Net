<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Tutors.aspx.cs" Inherits="Project_07_1269074.CourseManegement.Tutors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <link href="../Content/Icons/font/bootstrap-icons.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row px-2">
        <div class="col-12">
            <h2 class="display-5">Tutors</h2>
        </div>
         <div class="col-6">
            <h2 class="display-6">Edit/Delete</h2>
             <asp:GridView CssClass="table table-borderd table-striped" ID="gvTutors" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="TutorId" DataSourceID="dsTutors" OnRowDataBound="gvTutors_RowDataBound">
                <HeaderStyle CssClass="table-light" />

                 <Columns>
                     <asp:TemplateField ShowHeader="False">
                         <EditItemTemplate>
                             <asp:LinkButton ValidationGroup="gv-ed" CssClass="btn btn-success btn-sm rounded-circle"  ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"><i class="bi bi-save"></i></asp:LinkButton>
                             &nbsp;<asp:LinkButton CssClass="btn btn-secondary btn-sm rounded-circle" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"><i class="bi bi-x"></asp:LinkButton>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:LinkButton CssClass="btn btn-success btn-sm rounded-circle" ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"><i class="bi bi-pencil"></i></asp:LinkButton>
                             &nbsp;<asp:LinkButton ID="LinkButton2" CssClass="btn btn-danger btn-sm rounded-circle" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"><i class="bi bi-trash"></i></asp:LinkButton>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:BoundField DataField="TutorId" HeaderText="TutorId" InsertVisible="False" ReadOnly="True" SortExpression="TutorId" />
                     <asp:TemplateField HeaderText="Tutor Name"  SortExpression="TutorName">
                        <EditItemTemplate>
                            <asp:TextBox ValidationGroup="gv-ed" CssClass="form-control form-control-sm" ID="TextBox1" runat="server" Text='<%# Bind("TutorName") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="gv-ed" ControlToValidate="TextBox1" Text="Tutor name is required" CssClass="text-danger err" ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("TutorName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Email">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("TutorEmail") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="gv-ed" ControlToValidate="TextBox2" CssClass="text-danger err" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Email is required"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("TutorEmail") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Phone">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("TutorPhone") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="gv-ed" ControlToValidate="TextBox2" CssClass="text-danger err" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Phone no is required"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("TutorPhone") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                 </Columns>
             </asp:GridView>
             <asp:SqlDataSource ID="dsTutors" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [Tutors] WHERE [TutorId] = @TutorId" InsertCommand="INSERT INTO [Tutors] ([TutorName], [TutorEmail], [TutorPhone]) VALUES (@TutorName, @TutorEmail, @TutorPhone)" SelectCommand="SELECT * FROM [Tutors]" UpdateCommand="UPDATE [Tutors] SET [TutorName] = @TutorName, [TutorEmail] = @TutorEmail, [TutorPhone] = @TutorPhone WHERE [TutorId] = @TutorId">
                 <DeleteParameters>
                     <asp:Parameter Name="TutorId" Type="Int32" />
                 </DeleteParameters>
                 <InsertParameters>
                     <asp:Parameter Name="TutorName" Type="String" />
                     <asp:Parameter Name="TutorEmail" Type="String" />
                     <asp:Parameter Name="TutorPhone" Type="String" />
                 </InsertParameters>
                 <UpdateParameters>
                     <asp:Parameter Name="TutorName" Type="String" />
                     <asp:Parameter Name="TutorEmail" Type="String" />
                     <asp:Parameter Name="TutorPhone" Type="String" />
                     <asp:Parameter Name="TutorId" Type="Int32" />
                 </UpdateParameters>
             </asp:SqlDataSource>
        </div>
         <div class="col-6">
            <h2 class="display-6">Add New</h2>
             <asp:FormView ID="fvTutors" DefaultMode="Insert" runat="server" DataKeyNames="TutorId" DataSourceID="dsTutors">
    
                 <InsertItemTemplate>
                     <div class="form-group row mb-1">
                        <label class="col-form-label col-form-label-sm col-3">Tutor Name</label>
                        <div class="col-9">
                            <asp:TextBox ValidationGroup="fv-in" CssClass="form-control form-control-sm" ID="TutorNameTextBox" runat="server" Text='<%# Bind("TutorName") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="fv-in" CssClass="text-danger err" ID="RequiredFieldValidator1" ControlToValidate="TutorNameTextBox"  runat="server" ErrorMessage="Tutor name is required"></asp:RequiredFieldValidator>
                        </div>

                    </div>
                     <div class="form-group row mb-1">
                        <label class="col-form-label col-form-label-sm col-3">Email</label>
                        <div class="col-9">
                            <asp:TextBox ValidationGroup="fv-in" CssClass="form-control form-control-sm" ID="TutorEmailTextBox" runat="server" Text='<%# Bind("TutorEmail") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="fv-in" CssClass="text-danger err" ID="RequiredFieldValidator2" ControlToValidate="TutorEmailTextBox"  runat="server" ErrorMessage="Email is required"></asp:RequiredFieldValidator>
                        </div>

                    </div>
                    <div class="form-group row mb-1">
                        <label class="col-form-label col-form-label-sm col-3">Phone</label>
                        <div class="col-9">
                            <asp:TextBox ValidationGroup="fv-in" CssClass="form-control form-control-sm" ID="TutorPhoneTextBox" runat="server" Text='<%# Bind("TutorPhone") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="fv-in" CssClass="text-danger err" ID="RequiredFieldValidator3" ControlToValidate="TutorPhoneTextBox"  runat="server" ErrorMessage="Phone no is required"></asp:RequiredFieldValidator>
                        </div>

                    </div>
                     <div class="col-12">
                       <div class="d-flex justify-content-end">
                            <asp:LinkButton ValidationGroup="fv-in" CssClass="btn btn-success btn-sm" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text=""><i class="bi bi-plus-circle"></i> Insert</asp:LinkButton>
                        &nbsp;<asp:LinkButton CssClass="btn btn-secondary btn-sm" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text=""><i class="bi bi-x"></i> Cancel</asp:LinkButton>
                       </div>
                 </InsertItemTemplate>
             </asp:FormView>
        </div>
    </div>
</asp:Content>
