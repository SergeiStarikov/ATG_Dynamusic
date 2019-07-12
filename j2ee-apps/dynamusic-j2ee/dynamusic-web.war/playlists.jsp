<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/atg/userprofiling/Profile"/>

<html>
<head>
<!-------------------------------------------------------------
  Dynamusic Site Mockup
  
  Playlists
  
  Lists the user's playlists.
  
  ------------------------------------------------------------->
</head>
<body>
       <dsp:include page="common/header.jsp">
          <dsp:param name="pagename" value="Your Playlists"/>
       </dsp:include>

       <table CELLPADDING=8 WIDTH="700" >
          <tr>
             <!-- Sidebar -->
             <td width="100" bgcolor="ghostwhite" valign="top">
                 <dsp:include page="common/sidebar.jsp"></dsp:include>

                 <dsp:droplet name="/atg/dynamo/droplet/Switch">
                   <dsp:param bean="Profile.transient" name="value"/>
                   <dsp:oparam name="false">
                       <hr>
                       <a href="newPlaylist.jsp">Add Playlist</a>
                   </dsp:oparam>
                 </dsp:droplet>


				     </td>

             <!-- Page Body -->
             <td VALIGN=TOP>
               <!-- *** Start page content *** -->
               <h3>Your Playlists</h3>
               <dsp:droplet name="/atg/dynamo/droplet/ForEach">
                  <dsp:param bean="Profile.playlists" name="array"/>
                  <dsp:oparam name="outputStart">
                     <ul>
                  </dsp:oparam>
                  <dsp:oparam name="outputEnd">
                    </ul>
                  </dsp:oparam>
                  <dsp:oparam name="output">
                     <li><dsp:a href="playlistDetails.jsp">
                        <dsp:param name="itemId" param="element.repositoryId"/>
                        <dsp:valueof param="element.name"/>
                     </dsp:a>
            
                  </dsp:oparam>
                  <dsp:oparam name="empty">
                      You have no playlists defined.
                  </dsp:oparam>
                </dsp:droplet>


             </td>
          </tr>
       </table>
</body>
</html>
</dsp:page>