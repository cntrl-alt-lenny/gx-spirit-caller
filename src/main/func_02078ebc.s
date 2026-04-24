; func_02078ebc: weird stub — loads u16 into r1 (not r0), sets r0 = 0, returns.
; Caller must use r1 as a side-output? Unusual ABI.
;
;     ldrh r1, [r0, #0x0]
;     mov  r0, #0x0
;     bx   lr

        .text
        .global func_02078ebc
        .arm
func_02078ebc:
        ldrh    r1, [r0, #0x0]
        mov     r0, #0x0
        bx      lr
