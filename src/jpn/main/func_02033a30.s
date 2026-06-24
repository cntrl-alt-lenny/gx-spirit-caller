; func_02033a30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02033a30
        .arm
func_02033a30:
    ldrsb ip, [r0, #0x3]
    ldr r3, [r0, #0xc]
    mov r0, #0x0
    cmp ip, #0x0
    ble .L_38
.L_14:
    ldrsb r2, [r3]
    cmp r1, r2
    bxeq lr
    add r0, r0, #0x1
    mov r0, r0, lsl #0x18
    cmp ip, r0, asr #0x18
    mov r0, r0, asr #0x18
    add r3, r3, #0x4
    bgt .L_14
.L_38:
    mvn r0, #0x0
    bx lr
