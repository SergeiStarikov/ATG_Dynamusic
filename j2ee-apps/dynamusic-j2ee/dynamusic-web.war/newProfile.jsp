<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>

<!-------------------------------------------------------------
  Dynamusic Site Mockup
  
  NEW PROFILE
  
  Allows creation of new user profile
  
  ------------------------------------------------------------->
  

<HTML>
  <HEAD>
    <TITLE>Dynamusic Edit Profile</TITLE>
  </HEAD>
  <BODY>
    <dsp:include page="common/header.jsp">
       <dsp:param name="pagename" value="Register"/>
    </dsp:include>
    <table width="700" cellpadding="8">
      <tr>
        <!-- Sidebar -->
        <td width="100" bgcolor="ghostwhite">
            <dsp:include page="common/sidebar.jsp"></dsp:include>
        </td>
        <!-- Page Body -->
        <td valign="top">
          <font face="Verdana,Geneva,Arial" size="-1">
          
          <!-- *** Start page content *** -->

          <form>
          
            <h3>Login information (required)</h3>  
            Login:<br>
            <input size="24" type="text"/><br>
         
            Password:<br>
            <input size="24" type="password"/><br>
  
			Retype password to confirm:<br>
            <input size="24" type="password"/><br>
            <hr>
            <h3>Personal information (optional)</h3>   
            First name:<br>
            <input size="24" type="text"/><br>
          
            Last name:<br>
            <input size="24" type="text"/><br>
            <br>

            State:<br>
            <input size="2" type="text"/><br>
            <br>

            Your favorite genres:<br>
            <input type="checkbox" value="pop"/>Pop<br>
            <input type="checkbox" value="jazz"/>Jazz<br>
            <input type="checkbox" value="classical"/>Classical<br>
            <input type="checkbox" value="blues"/>Blues<br>
            <input type="checkbox" value="country"/>Country<br>
            <br>
            Make your profile viewable by others?<br>
            <input type="radio" value="true"/>yes<br>
            <input type="radio" value="false"/>no<br>
            <br>
            Personal info:<br>
            <textarea bean="/atg/userprofiling/ProfileFormHandler.value.info" name="info" rows="5" cols="40"></textarea><br>
            <br>
          
            <!-- defines the URL to go to on success (relative to 'action')-->
            <input type="Submit" value="Register"/>
            <input type="Submit" value="Cancel"/>
          
          <form>
                        
          <!-- *** End real content *** -->
          
          </font>
        </td>         
      </tr>
    </table>
  </BODY>
</HTML>
</dsp:page>
