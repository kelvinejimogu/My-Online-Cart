<DOCTYPE HTML Public "-//W3C DTD HTML 4.01 Transitional EN'"/>

<%

Function GenerateNewReleases()

Dim HTMLString as string

Dim sqlQuerry 'as string

Dim rs 'as ADOBEDB.Recordset

sqlQuery = " up_GetNewReleases Top5 "

Set rs = Sever.CreatObject("ADOBE.Recordset")

Set rs = dbConn.Execute(sqlQuery)

if rs.EOF and rs.BOF Then

Then HTMLString = "An Error Occured"

Else

Do While Not rs.Eof

HTMLString = & ""& rs("ArtistName")& "--"

HTMLString = & rs("ProductGroupTitle") &"--"

HTMLString = & rs("ReleaseDate") & ""

HTMLString = & "" & vbcrlf

rs.MoveNext

Loop

End IF 

Set rs = NOTHING

GeneratNewReleases = HTMLString

End Function

Function GenerateUpcomingShows()

Dim HTMLString 'as String

Dim sqlQuerry 'as string

Dim rs 'as ADODBE.Recordset

Dim sqlQuerry2 'as string

Dim rs2 'as ADODB.Recordset

sqlquerry = "up_GetUpcomingShows Top5"

Set rs = Server.CreatObject("ADODBE.Recordset")

Set rs2 = Server.CreatObject("ADODBE.Recordset")

Set rs = dbConn.Execute(sqlQuery)

If rs.EOF and rs.BOF Then

HTMLString = "An Error Occurred"

Else

Do While Not rs.Eof

HTMLString = HTMLString & "" & rs("EventName") & "__"

sqlQurey2 = "up_GetDenrmalizedArtistForEvent" & rs("EventID")

Set rs2 = dbConn.Execute(sqlQuery2)

HTMLString = HTMLString & "" & rs2("Artists") & "__"

rs2.close

HTMLString = HTMLString & "" & rs("City") & "__"

HTMLSTring = HTMLString & "" & rs("EventDateTime") &"__"

HTMLString = HTMLSting & "(More Info)" & vbcrlf

rs.MoveNext

Loop

End If

rs.close

Set rs = Nothing

Set rs2 = Nothing

GenerateUpComingShows = HTMLString 

End Functions

Function GenerateMusicNews()

Dim HTMLSting 'as String

Dim sqlQuery'as String

Dim rs 'as ("ADODBE.Recordset")

sqlQuery = "up_GetMusicNews Top5"

Set rs = Server.CreateObject("ADODBE.Recordset")

Set rs = dbConn.Execute(sqlQuery)

If rs.EOF and rs.BOF Then

HTMLString = HTMLString "An Error Occured"

Else 

Do While Not rs.Eof

HTMLString = HTMLString & "" & rs("HedLine") & "__"

HTMLString = HTMLString & "(Story)" & vbcrlf

rs.MoveNext

Loop

End If

Set rs = Nothing

GenerateMusicNews = HTMLString

End Function

Function GenerateSpecialOffers()

Dim HTMLString 'as String 

Dim sqlQuery 'as String

Dim rs 'as ADODBE.RecordSet

sqlQuery = "up_GetSpecialOffers Top5"

Set rs = Server.CreatObject("ADODBE.RecordSet")

Set rs = dbConn.Execute(sqlQuery)

If rs.EOF and rs.BOF Then

HTMLString = "An Error Occutred"

Else

Do While rs Not Eof

HTMLString = HTMLString & "" & rs("ShortDiscreption") & "__"

HTMLString = HTMLString &"()" & vbcrlf

rs.MoveNext

Loop

End IF

GenerateSpecialOffers = HTMLString

End Function

Dim NewReleasesHTML 'as String

Dim UpCommingShowsHTML 'as String

Dim MusicNewsHTML 'as String

Dim SpecialoffersHTML 'as String


NewReleasesHTML = GenerateNewReleases()

UpcomingShowsHTML = GenerateUpcComming

MusicNewsHTML = GenerateMusicNews()

SpecialOffersHTML = GenerateSpecialOffers()

%>
<html>
<head>
    <title>Tune - In - Order - Page</title>
    <link rel = "Stylsheet" href = "tunin" type "text/css">
</head>

<body>

    <tabe width = "100%" border "0" cellSpacing "0" cellpading"0">
      <tr><---Masthead table row-->
        <td bgcolor = "#cccccc" colspan = "2">
          <!--Breadcrumd trail goes here-->
                <!--#include file = "include\breadcrumb.asp"-->
        </td>
        <td bgcolor = "#cccccc" align = "right">
                <!--search goes here-->
                <!--#include file="include\search.asp"
        </td>
      </tr>  
    </table>
    <table width="100%" cellspacing="0" cellpadding="0">
    <tr>
        <td Valign="top" align="right" width="120"  bgcolor"#cccccc">
            <!--Navigation goes here-->
            <div class="tunein">
                TuneIn!<br>
                <hr width="80" align="center" noshade>
         </div>
            <!--navigation goes here-->
            <!--#include file="include\navigation.asp"
    </td>
    <td valign="top">
                <table width="99%" cellspacing=5 cellpadding=5 border=0>
                    <tr>
                            <td valign="top">
                                <h1>New Release</h1>
                                <%=NewReleasesHTML%>
                            </td>
                            <td valign="top">
                                <h1>Upcoming Shows</h1>
                                <%=UpcomingShowsHTML%>
				            </td
                    </tr>
                    <tr>
    			            <td valign="top">
					            <h1>Music News</h1>
					            <%=MusicNewsHTML%>
				            </td>
				            <td valign="top">
					            <h1>Special Offers</h1>
					            <%=SpecialOffersHTML%>
				            </td>
			        </tr>
                </table>
    </td>
    <td valign="top" align="right" width=200> 
        <table border="1" cellspacing="0" cellpadding="0">
          <tr> 
            <td bgcolor="#CCCCCC"> 
    		<!-- Shopping Cart Include Goes Here -->
            <!-- #include file="include\cartinfo.asp" -->  
        </td>
      </tr>
      </table>
	</td>
	</tr>
    </table>
</body>
</html>
<!-- include virtual="include/deconfig.asp" -->