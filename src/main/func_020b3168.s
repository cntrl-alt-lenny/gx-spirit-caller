; func_020b3168 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b3168
        .arm
func_020b3168:
    bic r1, r0, #-2147483648
    mov r2, #0x9e
    subs r2, r2, r1, lsr #0x17
    ble .L_818
    mov r1, r1, lsl #0x8
    orr r1, r1, #-2147483648
    cmp r0, #0x0
    mov r0, r1, lsr r2
    rsbmi r0, r0, #0x0
    bx lr
.L_818:
    mvn r0, r0, asr #0x1f
    add r0, r0, #-2147483648
    bx lr
