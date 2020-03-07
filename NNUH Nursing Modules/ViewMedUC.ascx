<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ViewMedUC.ascx.vb" Inherits="NNUH_Nursing_Modules.ViewMedUC" %>
<script>
function printdiv(printpage)
{
var headstr = "<html><head><title></title></head><body>Copy Write Ala Dawood";
var footstr = "Copy Write Ala Dawood</body>";
var newstr = document.all.item(printpage).innerHTML;
var oldstr = document.body.innerHTML;
document.body.innerHTML = headstr+newstr+footstr;
window.print(); 
document.body.innerHTML = oldstr;
return false;
} 
</script>
<asp:FormView runat="server" DataSourceID="SDSMed" CssClass="container-fluid" ID="formMed" Width="100%" DefaultMode="ReadOnly">
    <ItemTemplate>
        <a class="btn btn-primary text-center text-white" onclick="printdiv('content');"><span aria-hidden="true" class="glyphicon glyphicon-print"></span>  Print</a>
        <div class="card" id="content">
            <asp:Image runat="server" CssClass="card-img-top mx-auto d-block" ID="imgMed" src='<%# Eval("MImg")%>' Width="150" />
            <h2 class="card-header text-info"><asp:Label runat="server" ID="lblName" Text='<%# Eval("MName")%>' ></asp:Label></h2>            
            <div class="card-body text-dark">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <h5 class="card-title text-success">Category</h5>
                        <p class="card-text"><asp:Label ID="lblCat" runat="server" Text='<%# Eval("Categ")%>' ></asp:Label></p>
                    </li>
                    <li class="list-group-item">
                        <h5 class="card-title text-success">Preparation</h5>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Preparation")%>' CssClass="card-text"></asp:Label></p>
                    </li>
                    <li class="list-group-item">
                        <h5 class="card-title text-success">Indecations</h5>
                        <p class="card-text"><asp:Label ID="Label2" runat="server" Text='<%# Eval("Indecation")%>' ></asp:Label></p>
                    </li>
                    <li class="list-group-item">
                        <h5 class="card-title text-success">Side Effects</h5>
                        <p class="card-text"><asp:Label ID="Label3" runat="server" Text='<%# Eval("SideEffect")%>' ></asp:Label></p>
                    </li>
                    <li class="list-group-item">
                        <h5 class="card-title text-success">Reconsitution</h5>
                        <p class="card-text"><asp:Label ID="Label4" runat="server" Text='<%# Eval("Reconsitution")%>'></asp:Label></p>
                    </li>
                    <li class="list-group-item">
                        <h5 class="card-title text-success">Dilution</h5>
                        <p class="card-text"><asp:Label ID="Label5" runat="server" Text='<%# Eval("Dilution")%>' ></asp:Label></p>
                    </li>
                    <li class="list-group-item">
                        <h5 class="card-title text-success">Administration</h5>
                        <p class="card-text"><asp:Label ID="Label6" runat="server" Text='<%# Eval("Administration")%>' ></asp:Label></p>
                    </li>
                    <li class="list-group-item">
                        <h5 class="card-title text-success">Notes</h5>
                        <p class="card-text"><asp:Label ID="Label7" runat="server" Text='<%# Eval("Notes")%>' ></asp:Label></p>
                    </li>
                </ul>
            </div>         
        </div>
        
    </ItemTemplate>
</asp:FormView>

<asp:SqlDataSource ID="SDSMed" runat="server" SelectCommand="Select Id,MName,(Select Category From MCategory Where Id=tblMedication.MCatId) As Categ,Preparation,Indecation,SideEffect,Reconsitution,Dilution,Administration,Notes,MImg From tblMedication Where Id=@Id">
    <SelectParameters>
        <asp:SessionParameter Name="Id" SessionField="MNo" />
    </SelectParameters>
</asp:SqlDataSource>
