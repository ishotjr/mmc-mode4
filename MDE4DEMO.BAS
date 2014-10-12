' MODE 4 Example from OBC's Instructable

I2C open 400,100                          ' open I2C comm channel
PC = &h42                                 '
I2C write PC,0,3,1,2,4                    ' Switch to mode4.mde
Do While Asc(a$) <> 42 : a$=Inkey$ : Loop  ' wait for mode switch

LoadResource "demo.spr",180
LoadSpr 1,4,100,175,0,0

Sub LoadResource file$,cmd
  I2C WRITE PC,0,2,1,230                  ' clear I2C registers
  For X = 1 To Len(file$)                 ' send filename
    I2C WRITE PC,0,2,x+1,Asc(Mid$(file$,x,1)) : Next X
  I2C WRITE PC,0,2,1,cmd                  ' initiate load 180 or 181
  a$="" : Do While a$ <> "*" : a$=Inkey$ : Loop : Pause 1000
End Sub

Sub LoadSpr sprite,graphic,x,y,mirror,palette
  I2C WRITE PC,0,8,1,202,sprite,graphic,x,y,mirror,palette
End Sub                                                                                      
