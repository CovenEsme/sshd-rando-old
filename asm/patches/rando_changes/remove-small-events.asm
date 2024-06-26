; Rocks
; Don't play event when blowing up rocks
.offset 0x7100737a64
mov w8, #0xFF


; Logs
; Don't play event when pushing logs
.offset 0x71008440e8
mov x19, x0 ; move self into x19 early

.offset 0x71008440f4
add x0, x0, #0x1000 ; add offset to w0 instead of in the strb
strb w11, [x0, #0x3FD]

mov w9, #0xFF ; use now free w9 to store -1 for the event index

.offset 0x7100844104
strb w9, [x0, #0x3FC] ; store new event index


; Ropes
; Don't play event when knocking down ivy ropes
.offset 0x71008154e8
mov w8, #0xFF


; Arrow Switches
; DOESN'T WORK
; don't play event when shooting arrow switches (eyes)
; .offset 0x71006f5aac
; mov w8, #0xFF


; Don't open collection screen when getting treasures/gratitude crystals
.offset 0x7100bf0590
b 0x7100bf0674 ; skip to the end of the function


; Timeshift Stones
; Don't play first time timeshift stone cutscenes
.offset 0x710097ef50
mov w8, #18
bl additions_jumptable


; Skip basketball statue cutscenes
.offset 0x710090cbcc
mov w8, #0xFF


; Don't play event when breaking ropes holding boxes in the air
.offset 0x71007397d8
b 0x71007396d8


; Minecarts
; Don't play event when pushing minecarts off ledges
.offset 0x71009a2ec4 ; in dAcOTrolley::statePushPullEnter
b 0x71009a30bc
.offset 0x71009a310c ; dAcOTrolley::statePushPullUpdate
b 0x71009a31a8
