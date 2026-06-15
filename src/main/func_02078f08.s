; func_02078f08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02078f08
        .arm
func_02078f08:
    sub r3, r2, #0x1
    cmp r2, #0x1
    add r0, r0, r3
    ble .L_38
.L_10:
    ldrh r3, [r1]
    sub r2, r2, #0x2
    sub ip, r0, #0x1
    strb r3, [r0]
    ldrh r3, [r1], #0x2
    cmp r2, #0x1
    sub r0, r0, #0x2
    mov r3, r3, asr #0x8
    strb r3, [ip]
    bgt .L_10
.L_38:
    cmp r2, #0x0
    ldrgth r1, [r1]
    strgtb r1, [r0]
    bx lr
