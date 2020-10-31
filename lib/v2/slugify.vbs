Function Slugify(Rng As Range)
	If Len(Rng) = 0 Then
		Slugify = ""
	Else
		Dim trimStr As String
		Dim strTemp As String
		Dim n As Long

		For n = 1 To Len(Rng)
			trimStr = trimStr & Mid(Rng, n, 1)
		Next

		trimStr = Trim(trimStr)

		For n = 1 To Len(trimStr)
			Select Case Asc(Mid(trimStr, n, 1))
				Case 32
					strTemp = strTemp & "-"
				Case 45
					strTemp = strTemp & Mid(trimStr, n, 1)
				Case 48 To 57, 65 To 90, 97 To 122
					strTemp = strTemp & Mid(LCase(trimStr), n, 1)
			End Select
		Next
		Slugify = strTemp
	End If
End Function

