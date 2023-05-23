<%@page import="java.sql.ResultSet"%>
<%@page import="org.nlt.controller.ParentInterface"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>Person Registration</title>
<jsp:include page="head.jsp"/>
<body>
<form action="./nlt" method="post">
<input type="hidden" name="page" value="PersonPage"/>
<!------ Include the above in your HEAD tag ---------->

<div class="container register">
                <div class="row">
                    <div class="col-md-3 register-left">
                        <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt=""/>
                        <h3>NLT Infotech Pvt Ltd</h3>
                        <p>Works Like A Dream<br>
                        Login:<%=session.getAttribute("LoginName") %>
                        Your Ip:<%=session.getAttribute("Ip") %>
                        </p>
                    </div>
                    <div class="col-md-9 register-right">
                        <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Employee</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Hirer</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <h3 class="register-heading">Person Registration</h3>
                                <div class="row register-form">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Full Name *" name="fname" />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Person Age *" name="age" />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Phone No *" name="phone" />
                                        </div>
                                        <div class="form-group">
                                            <div class="maxl">
                                                <label class="radio inline"> 
                                                    <input type="radio" name="gender" value="male" checked>
                                                    <span> Male </span> 
                                                </label>
                                                <label class="radio inline"> 
                                                    <input type="radio" name="gender" value="female">
                                                    <span>Female </span> 
                                                </label>
                                            </div>
                                        </div>
                                        <div>
                                            <input type="submit" class="btnRegister"  placeholder="Confirm Password *" value="SUBMIT" />
                                        </div>
                                        
                                    </div>
                                  <div class="col-md-8">
                                        <table class="table">
                                        	<thead>
                                        	 <tr>
                                        	 	<th>ACTION</th>
                                        		<th>NAME</th>
                                        		<th>AGE</th>
                                        		<th>PHONE</th>
                                        		<th>GENDER</th>
                                        	</tr>
                                        	</thead>
                                        	<tbody>
                                        	
                                        	<%
                                        	Statement smt = ParentInterface.con.createStatement();
                                        	ResultSet rs= smt.executeQuery("select * from persons where status=1");
                                        	while(rs.next())
                                        	{
                                        	%>
                                        	<tr>
                                        		<td>
                                        			<a href="edit.jsp?id=<%=rs.getInt("id") %>&name=<%=rs.getString("name")%>&age=<%=rs.getInt("age") %>&phone=<%=rs.getString("phone") %>&gender=<%=rs.getString("gender") %>"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-brush-fill" viewBox="0 0 16 16">
													<path d="M15.825.12a.5.5 0 0 1 .132.584c-1.53 3.43-4.743 8.17-7.095 10.64a6.067 6.067 0 0 1-2.373 1.534c-.018.227-.06.538-.16.868-.201.659-.667 1.479-1.708 1.74a8.118 8.118 0 0 1-3.078.132 3.659 3.659 0 0 1-.562-.135 1.382 1.382 0 0 1-.466-.247.714.714 0 0 1-.204-.288.622.622 0 0 1 .004-.443c.095-.245.316-.38.461-.452.394-.197.625-.453.867-.826.095-.144.184-.297.287-.472l.117-.198c.151-.255.326-.54.546-.848.528-.739 1.201-.925 1.746-.896.126.007.243.025.348.048.062-.172.142-.38.238-.608.261-.619.658-1.419 1.187-2.069 2.176-2.67 6.18-6.206 9.117-8.104a.5.5 0 0 1 .596.04z"/>
													</svg></a>&nbsp;&nbsp;&nbsp;&nbsp;
													<a href="delete.jsp?id=<%=rs.getInt("id") %>&name=<%=rs.getString("name")%>&age=<%=rs.getInt("age") %>&phone=<%=rs.getString("phone") %>&gender=<%=rs.getString("gender") %>"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
													<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6Z"/>
													<path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1ZM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118ZM2.5 3h11V2h-11v1Z"/>
													</svg></a>&nbsp;&nbsp;&nbsp;&nbsp;
                                        		</td>
                                        		
                                        		<td><%=rs.getString("name")%></td>
                                        		<td><%=rs.getInt("age")%></td>
                                        		<td><%=rs.getString("phone")%></td>
                                        		<td><%=rs.getString("gender")%></td>
                                        		
                                        	</tr>
                                        	<% 
                                        	}
                                        	rs.close();
                                        	smt.close();
                                        	%>
                                        	</tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade show" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                <h3  class="register-heading">Apply as a Hirer</h3>
                                <div class="row register-form">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="First Name *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Last Name *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <input type="email" class="form-control" placeholder="Email *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" maxlength="10" minlength="10" class="form-control" placeholder="Phone *" value="" />
                                        </div>


                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="password" class="form-control" placeholder="Password *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control" placeholder="Confirm Password *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <select class="form-control">
                                                <option class="hidden"  selected disabled>Please select your Sequrity Question</option>
                                                <option>What is your Birthdate?</option>
                                                <option>What is Your old Phone Number</option>
                                                <option>What is your Pet Name?</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="`Answer *" value="" />
                                        </div>
                                        <input type="submit" class="btnRegister"  value="Register"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
   </form>	         
</body>
</html>