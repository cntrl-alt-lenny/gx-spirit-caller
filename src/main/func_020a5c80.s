; func_020a5c80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020a5c80
        .arm
func_020a5c80:
    ldrb r3, [r0]
    mov r2, r1
    add r2, r2, #0x1
    strb r3, [r1]
    ldrb r1, [r0]
    cmp r1, #0x6
    addls pc, pc, r1, lsl #0x2
    b .L_464
    b .L_464
    b .L_46c
    b .L_46c
    b .L_46c
    b .L_428
    b .L_46c
    b .L_46c
.L_428:
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
    b .L_46c
.L_464:
    mov r0, #0x0
    bx lr
.L_46c:
    mov r0, r2
    bx lr
