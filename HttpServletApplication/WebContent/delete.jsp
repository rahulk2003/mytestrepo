
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="org.nlt.controller.ParentInterface"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="head.jsp"/>
<body>
	<form action="./nlt" method="post">
<!------ Include the above in your HEAD tag ---------->

<div class="container register">
                <div class="row">
                    <div class="col-md-3 register-left">
                        <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt=""/>
                        <h3>NLT Infotech Pvt Ltd</h3>
                        <p>
                        Works Like A Dream<br>
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
                                <h3 class="register-heading">Person Registration: Delete</h3>
                                <div class="row register-form">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                        <input type="hidden" name="page" value="PersonDeletePage"/>
                                        <input type="hidden" name="id" value="<%=request.getParameter("id") %>"/>
                                            <input type="text" class="form-control" placeholder="Full Name *" name="fname" value="<%=request.getParameter("name") %>" />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Person Age *" name="age" value="<%=request.getParameter("age") %>"/>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Phone No *" name="phone" value="<%=request.getParameter("phone") %>"/>
                                        </div>
                                        <div class="form-group">
                                            <div class="maxl">
                                                <label class="radio inline"> 
                                                    <input type="radio" name="gender" value="male" value="<%=request.getParameter("gender").equals("male")?"checked":"" %>">
                                                    <span> Male </span> 
                                                </label>
                                                <label class="radio inline"> 
                                                    <input type="radio" name="gender" value="female" value="<%=request.getParameter("gender").equals("female")?"checked":""%>">
                                                    <span>Female </span> 
                                                </label>
                                            </div>
                                        </div>
                                        <div>
                                        <a href="index.jsp"><input type="button" class="btnRegister"   value="HOME" /></a>
                                            <input type="submit" class="btnRegister"   value="DELETE" />
                                        </div>
                                        
                                    </div>
                                     <div class="col-md-8">
                                         <table class="table">
                                        	<tr>
                                        		<th>NAME</th>
                                        		<th>AGE</th>
                                        		<th>PHONE</th>
                                        		<th>GENDER</th>
                                        	</tr>
                                        	
    										 <%
                                        	
                                        	Statement smt = ParentInterface.con.createStatement();
                                        	ResultSet rs = smt.executeQuery("select * from persons");
                                        	
                                        	while(rs.next())
                                        	{
                                            %>
                                        	<tr>
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
                                        <input type="submit" class="btnRegister"  value="REGISTER"/>
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