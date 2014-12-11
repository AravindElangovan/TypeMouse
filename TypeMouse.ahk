;declare the various character sets that will be used
alphabet := [" ","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
alphabetCap := [" ","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
numbers := [" ","0","1","2","3","4","5","6","7","8","9"]
brackets := [" ","(",")","[","]","{{}","{}}","<",">"]
punctuation := [" ","{.}","{,}","{?}","{!}","{-}","{_}","{/}","{\}","{|}","{:}","{;}","""","'"]
symbols := [" ","{+}","{=}","{@}","{#}","{$}","{%}","{^}","{&}","{*}","{~}"]

;declare the array of character sets
typeLists := [alphabet, alphabetCap, numbers, brackets, punctuation, symbols]

;initialize global variables
modeEnabled := false
curListInd := typeLists.minIndex()
charInd := typeLists[curListInd].minIndex()

;Shift-CTRL-ALT-C enables mouse typing mode
+^!C::
	modeEnabled := !modeEnabled
	return

;Function that wraps around negative/out-of-bounds numbers
;to the size of the array
wrapAround(val, lst)
{
	modVal := mod(val - lst.minIndex(), lst.maxIndex())
	return ((modVal >= 0 ? modVal : (lst.maxIndex() + modVal)) + lst.minIndex())
}

;Shift-CTRL-ALT-A/B change the character set
;Middle Mouse/Scroll Button hits enter
;Left Mouse Button moves selection left
;Right Mouse Button moves selection right
;Scroll Wheel iterates thruogh the character set
;Forward Thumb Button hits space
;Backward Thumb Button hits backspace
#If modeEnabled
	+^!A::
		curListInd := wrapAround(curListInd + 1, typeLists)
		charInd := typeLists[curListInd].minIndex()
		return
	+^!B::
		curListInd := wrapAround(curListInd - 1, typeLists)
		charInd := typeLists[curListInd].minIndex()
		return
	MButton::
		charInd := typeLists[curListInd].minIndex()
		SendInput {Enter}
		return
	LButton::
		charInd := typeLists[curListInd].minIndex()
		SendInput {Left}
		return
	RButton::
		charInd := typeLists[curListInd].minIndex()
		SendInput {Right}
		return
	WheelDown::
		charInd := wrapAround(charInd - 1, typeLists[curListInd])
		SendInput % "{BS}" . typeLists[curListInd][charInd]
		return
	WheelUp::
		charInd := wrapAround(charInd + 1, typeLists[curListInd])
		SendInput % "{BS}" . typeLists[curListInd][charInd]
		return
	XButton2::
		SendInput {Space}
		return
	XButton1::
		SendInput {BS}
		return
#If


