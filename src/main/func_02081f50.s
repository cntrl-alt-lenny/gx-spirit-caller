; func_02081f50: u16 getter × 8 at obj[0x30].
;
;     ldrh r0, [r0, #0x30]
;     mov  r0, r0, lsl #0x3
;     bx   lr
;
; 3 ARM instructions, 0xc bytes.
;
; Ships as .s because mwcc elides the ldrh (treats the load as pure
; and DCE's it when the downstream shift happens to produce the same
; value without it — register rename confusion). The natural C form
; `return (*(u16 *)(obj + OFF)) << 3;` produces 2 insns.

        .text
        .global func_02081f50
        .arm
func_02081f50:
        ldrh    r0, [r0, #0x30]
        mov     r0, r0, lsl #0x3
        bx      lr
