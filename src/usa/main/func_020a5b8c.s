; func_020a5b8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020a5b8c
        .arm
func_020a5b8c:
    ldrb r3, [r0]
    mov r2, r1
    add r2, r2, #0x1
    strb r3, [r1]
    ldrb r1, [r0]
    cmp r1, #0x6
    addls pc, pc, r1, lsl #0x2
    b .L_264
    b .L_264
    b .L_26c
    b .L_26c
    b .L_26c
    b .L_228
    b .L_26c
    b .L_26c
.L_228:
    ldrh r3, [r0, #0x2]
    add r1, r2, #0x3
    strb r3, [r2]
    ldrh r3, [r0, #0x2]
    and r3, r3, #0xff00
    mov r3, r3, asr #0x8
    strb r3, [r2, #0x1]
    ldrh r3, [r0, #0x4]
    strb r3, [r2, #0x2]
    ldrh r0, [r0, #0x4]
    add r2, r2, #0x4
    and r0, r0, #0xff00
    mov r0, r0, asr #0x8
    strb r0, [r1]
    b .L_26c
.L_264:
    mov r0, #0x0
    bx lr
.L_26c:
    mov r0, r2
    bx lr
