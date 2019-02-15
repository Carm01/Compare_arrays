#include <Array.au3>
Local $a[11] = [1, 1, 3, 5, 6, 7, 8, 9, 10, 11, 12]
Local $b[12] = [1, 2, 2, 3, 4, 5, 6, 8, 10, 12, 13, 14]

_ArrayDisplay(_Separate($a, $b))

Func _Separate(ByRef $in0, ByRef $in1)
    $in0 = _ArrayUnique($in0, 0, Default, Default, 0)
    $in1 = _ArrayUnique($in1, 0, Default, Default, 0)
    Local $z[2] = [UBound($in0), UBound($in1)], $low = 1 * ($z[0] > $z[1]), $aTemp[$z[Not $low]][3], $aOut = $aTemp, $aNdx[3]
    For $i = 0 To $z[Not $low] - 1
        If $i < $z[0] Then $aTemp[$i][0] = $in0[$i]
        If $i < $z[1] Then $aTemp[$i][1] = $in1[$i]
    Next
    For $i = 0 To $z[$low] - 1
        $x = _ArrayFindAll($aTemp, $aTemp[$i][$low], 0, 0, 1, 0, Not $low)
        If Not @error Then ; both
            For $j = 0 To UBound($x) - 1
                $aTemp[$x[$j]][2] = 1
            Next
            $aOut[$aNdx[2]][2] = $aTemp[$i][$low]
            $aNdx[2] += 1
        Else ; only in $low
            $aOut[$aNdx[$low]][$low] = $aTemp[$i][$low]
            $aNdx[$low] += 1
        EndIf
    Next
    For $i = 0 To $z[Not $low] - 1
        If $aTemp[$i][2] <> 1 Then
            $aOut[$aNdx[Not $low]][Not $low] = $aTemp[$i][Not $low]
            $aNdx[Not $low] += 1
        EndIf
    Next
    ReDim $aOut[_ArrayMax($aNdx)][3]
    Return $aOut
EndFunc   ;==>_Separate

; https://www.autoitscript.com/forum/topic/164728-compare-2-arrays-with-3-arrays-as-a-result/
; https://www.autoitscript.com/forum/topic/189927-which-is-the-fastest-method-to-compare-two-array/
;https://www.autoitscript.com/wiki/Arrays
