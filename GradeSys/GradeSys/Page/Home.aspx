<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Main.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="GradeSys.Home" %>

<%@ Register Assembly="AjaxControls" Namespace="AjaxControls" TagPrefix="ajaxCtrl" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxCTK" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <b style="font-size: 25px; color: darkred">NILAI UJIAN SISWA</b>
    <br />
    <br />
    <label>SiswaID</label>
    <asp:TextBox runat="server" ID="NIM"></asp:TextBox>
    <asp:Button CssClass="button" ID="Cari" runat="server" Text="Cari" OnClick="Cari_Click" />
    <br />
    <br />
    <asp:Panel runat="server" ID="Field" Visible="false" GroupingText="Data Siswa" >
        <table style="width:600px">
            <tr>
                <td>Nama</td>
                <td>
                <asp:TextBox style="border:none; border-color:transparent; outline:none" runat="server" ID="txtName" ReadOnly="true"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Tanggal Lahir</td>
                <td>
                    <asp:TextBox runat="server" ID="txtDOB"></asp:TextBox>
                    <ajaxCTK:CalendarExtender runat="server" ID="ajaxCalender" PopupButtonID="txtDOB" TargetControlID="txtDOB"></ajaxCTK:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td>Jenis Kelamin</td>
                <td>
                    <asp:DropDownList runat="server" ID="txtGender">
                        <asp:ListItem Value="Pria"></asp:ListItem>
                        <asp:ListItem Value="Wanita"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Agama</td>
                <td>
                    <asp:DropDownList runat="server" ID="txtReligion"  >
                        <asp:ListItem Value="Islam"></asp:ListItem>
                        <asp:ListItem Value="Kristen"></asp:ListItem>
                        <asp:ListItem Value="Katolik"></asp:ListItem>
                        <asp:ListItem Value="Budha"></asp:ListItem>
                        <asp:ListItem Value="Hindu"></asp:ListItem>
                        <asp:ListItem Value="Konghucu"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Email</td>
                <td>
                    <asp:TextBox Width="350px" runat="server" ID="Email"></asp:TextBox>
                </td>
            </tr>
            <tr style="vertical-align:top">
                <td>Alamat</td>
                <td>
                    <textarea runat="server" id="address" cols="40" rows="2" > </textarea>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br /><br />
    <asp:Panel runat="server" ID="GradePanel" Visible="false">
    <table runat="server" class="grade">
        <tr>
            <td rowspan="2">Mata Pelajaran</td>
            <td colspan="2">Nilai Semester</td>
            <td rowspan="2">Nilai Akhir</td>
        </tr>
        <tr>
            <td>Semester 1</td>
            <td>Semester 2</td>
        </tr>
        <tr class="white">
            <td>Bahasa Indonesia</td>
            <td>
                <asp:TextBox Width="50px" runat="server" ID="BahasaIndo1" AutoPostBack="true" OnPreRender="Grade_TextChanged" >0</asp:TextBox>
            </td>
            <td>
                <asp:TextBox Width="50px" runat="server" ID="BahasaIndo2" AutoPostBack="true" OnPreRender="Grade_TextChanged">0</asp:TextBox>
            </td>
            <td>
                <asp:Label runat="server" ID="TotalBI">0</asp:Label>
            </td>
        </tr>
        <tr class="gray">
            <td>Matematika</td>
            <td>
                <asp:TextBox Width="50px" runat="server" ID="Matematika1" AutoPostBack="true" >0</asp:TextBox>
            </td>
            <td>
                <asp:TextBox Width="50px" runat="server" ID="Matematika2" AutoPostBack="true">0</asp:TextBox>
            </td>
            <td>
                <asp:Label runat="server" ID="TotalMat">0</asp:Label>
            </td>
        </tr>
         <tr class="white">
            <td>Inggris</td>
            <td>
                <asp:TextBox Width="50px" runat="server" ID="Inggris1"  AutoPostBack="true">0</asp:TextBox>
            </td>
            <td>
                <asp:TextBox Width="50px" runat="server" ID="Inggris2"  AutoPostBack="true">0</asp:TextBox>
            </td>
            <td>
                <asp:Label runat="server" ID="TotalInggris">0</asp:Label>
            </td>
        </tr>
         <tr class="gray">
            <td>IPA</td>
            <td>
                <asp:TextBox Width="50px" runat="server" ID="Alam1" AutoPostBack="true">0</asp:TextBox>
            </td>
            <td>
                <asp:TextBox Width="50px" runat="server" ID="Alam2" AutoPostBack="true">0</asp:TextBox>
            </td>
            <td>
                <asp:Label runat="server" ID="TotalIPA">0</asp:Label>
            </td>
        </tr>
        <tr class="white">
            <td colspan="3">Nilai Ujian Rata-Rata</td>
            <td>
                <asp:Label runat="server" ID="Rata2">0</asp:Label>
            </td>
        </tr>
         <tr class="gray">
            <td colspan="3">Grade</td>
             <td>
                 <asp:Label runat="server" ID="TotalGrade">F</asp:Label>
             </td>
        </tr>
    </table>
    </asp:Panel>
        <asp:Button CssClass="button" ID="Save" runat="server" Text="Save" Visible="false" OnClick="Save_Click" />
        <br />
        <asp:Label runat="server" ID="checksave"></asp:Label>
    <style>
        .button {
            background-color:#721642;
            border: none;
            color: white;
            display: inline-block;
            padding: 8px 17px;
            border-radius: 12px;
}
        .grade td{
           border: 1px thin black;
           background-color: #721642;
           color:white;
           white-space:nowrap;
           padding:7px 60px;
           text-align:center;

        }
        .white td{
            color:black;
            background-color:white;
            text-align:center;
        }
        .gray td{
            color:black;
            background-color:lightgray;
            text-align:center;
        }
    </style>
</asp:Content>
