#include <Array.au3>
#include <File.au3>
#include <MsgBoxConstants.au3>


while 1 	
EncodeDir()
sleep(1000)
wend

; find a string within a string
; Author - This-is-me

Func stringbetween($str, $start, $end)
    $pos = StringInStr($str, $start)
    If Not @error Then
        $str = StringTrimLeft($str, $pos + StringLen($start) - 1)
        $pos = StringInStr($str, $end)
        If Not @error Then
            $str = StringTrimRight($str, StringLen($str) - $pos + 1)
            Return $str
        EndIf
    EndIf
EndFunc

Func EncodeDir()
	Local $aFileList = _FileListToArray(".", "*.mp4")
    If @error = 1 Then
        MsgBox($MB_SYSTEMMODAL, "", "Path was invalid.")
        Exit
    EndIf
    If @error = 4 Then
        MsgBox($MB_SYSTEMMODAL, "", "No file(s) were found.")
        Exit
    EndIf
    ; Display the results returned by _FileListToArray.
    ;_ArrayDisplay($aFileList, "$aFileList")
	
	for $i=1 to $aFileList[0]
		$file = $aFileList[$i] 
		
		Dim $szDrive, $szDir, $szFName, $szExt
		$TestPath = _PathSplit($file, $szDrive, $szDir, $szFName, $szExt)
		;_ArrayDisplay($TestPath,"Demo _PathSplit()")


		$params ='-i "' & $file 	& '" -c:v libx264 -preset slow -crf 23 -c:a copy "compressed\' & $szFName & "(ffmpeg).mp4" & '"'
		;MsgBox($MB_SYSTEMMODAL, "",  $params)
		Local $iReturn =ShellExecuteWait("ffmpeg.exe ", $params, "" )
		if $iReturn then
			MsgBox($MB_SYSTEMMODAL, "", "The return code from Notepad was: " & $iReturn)
		else
			$iReturn = RunWait(@ComSpec & " /c " & 'del "' & $file &'"' ) 
		EndIf
	Next
EndFunc   ;==>Example
