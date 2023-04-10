<?php
$server_name="localhost";
$username="root";
$password="";
$database_name="db_library";
$conn=mysqli_connect($server_name,$username,$password,$datab
ase_name,3307);
//now check the connection
if($_POST['save'])
{
$member_id = $_POST['member_id'];
$member_name = $_POST['member_name'];
$member_email = $_POST['member_email'];
$category_code = $_POST['category_code'];
if($member_id != "" && $member_name != "" && $member_email
!= "" && $category_code != "")
{
$sql_query = "INSERT INTO member
(member_id,member_name,member_email,category_code)
VALUES
('$member_id','$member_name','$member_email','$category_code')
";
$data= mysqli_query($conn, $sql_query);
if($data)
{
echo "New Details Entry inserted successfully !";
}
else
{
echo "Error: ";
}
}
else
{
echo "Please fill all the fields!";
}
}
?>