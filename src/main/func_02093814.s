; func_02093814: countdown loop — decrement r0 by 4 until it underflows.
; Used as a calibrated busy-wait.
;
;     subs r0, r0, #0x4
;     bhs func_02093814        ; while (r0 >= 0)
;     bx lr

        .text
        .global func_02093814
        .arm
func_02093814:
        subs    r0, r0, #0x4
        bhs     func_02093814
        bx      lr
