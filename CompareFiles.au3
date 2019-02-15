#include <Array.au3>
#include <File.au3>

; basically says whats in file one that is unique to file one. Whats in file 2 that is unique to file 2, and what is common to both
;Local $a[11] = [1, 1, 3, 5, 6, 7, 8, 9, 10, 11, 12]
;Local $b[12] = [1, 2, 2, 3, 4, 5, 6, 8, 10, 12, 13, 14]
Local $a, $b
_FileReadToArray('ADRENALINE-2.4_VZWPortFinal.txt', $a)
_FileReadToArray('6.22.605.3_M7_WL_L50_SENSE60_MR_Debloated.txt', $b)

Local $sda = ObjCreate("Scripting.Dictionary")
Local $sdb = ObjCreate("Scripting.Dictionary")
Local $sdc = ObjCreate("Scripting.Dictionary")

For $i In $a
	$sda.Item($i)
Next

For $i In $b
	$sdb.Item($i)
Next

For $i In $a
	If $sdb.Exists($i) Then $sdc.Item($i)
Next
$asd3 = $sdc.Keys()

For $i In $asd3
	If $sda.Exists($i) Then $sda.Remove($i)
	If $sdb.Exists($i) Then $sdb.Remove($i)
Next
$asd1 = $sda.Keys()
$asd2 = $sdb.Keys()

;_ArrayDisplay($asd1, "What's in $a not $b")
;_ArrayDisplay($asd2, "What's in $b not $a")
;_ArrayDisplay($asd3, "What's Common between both")

Dim $q[3], $r
$q[0] = UBound($asd1)
$q[1] = UBound($asd2)
$q[2] = UBound($asd3)
$r = _ArrayMax($q, 1, 1)

Dim $s[$r][3]

ReDim $asd1[$r]
ReDim $asd2[$r]
ReDim $asd2[$r]

For $i = 1 To UBound($asd1) -1
	$s[$i][0] = $asd1[$i]
Next

For $i = 1 To UBound($asd2) -1
	$s[$i][1] = $asd2[$i]
Next

For $i = 1 To UBound($asd3) -1
	$s[$i][2] = $asd3[$i]
Next

_FileWriteFromArray("Android.csv",$s,1,Default,",")
_ArrayDisplay($s)


; https://www.autoitscript.com/forum/topic/178118-optimizing-array-difference-search-speed-or-other-solutions-welcome/
; https://www.autoitscript.com/forum/topic/164728-compare-2-arrays-with-3-arrays-as-a-result/#comment-1201986
