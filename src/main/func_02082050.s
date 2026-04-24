; func_02082050: u16 getter × 8 at obj[0xc].
;
;     ldrh r0, [r0, #0xc]
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
        .global func_02082050
        .arm
func_02082050:
        ldrh    r0, [r0, #0xc]
        mov     r0, r0, lsl #0x3
        bx      lr
