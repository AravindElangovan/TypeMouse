alphabet := [" ","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
alphabetCap := [" ","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
numbers := [" ","0","1","2","3","4","5","6","7","8","9"]
brackets := [" ","(",")","[","]","{{}","{}}","<",">"]
punctuation := [" ","{.}","{,}","{?}","{!}","{-}","{_}","{/}","{\}","{|}","{:}","{;}","""","'"]
symbols := [" ","{+}","{=}","{@}","{#}","{$}","{%}","{^}","{&}","{*}","{~}"]

typeLists := [alphabet, alphabetCap, numbers, brackets, punctuation, symbols]

modeEnabled := false
curListInd := typeLists.minIndex()
charInd := typeLists[curListInd].minIndex()

+^!C::
	modeEnabled := !modeEnabled
	return

wrapAround(val, lst)
{
	modVal := mod(val - lst.minIndex(), lst.maxIndex())
	return ((modVal >= 0 ? modVal : (lst.maxIndex() + modVal)) + lst.minIndex())
}

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


