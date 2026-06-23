; func_ov006_021c3f1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov006_021c3f1c
        .arm
func_ov006_021c3f1c:
    ldr r1, [r0, #0x64]
    add r0, r0, #0x9c
    ldr r3, [r0, r1, lsl #0x4]
    add r2, r0, r1, lsl #0x4
    cmp r3, #0x0
    mov r0, #0x0
    bge .L_23b4
    cmp r3, #0x0
    mov r0, #0x1
    bge .L_23b4
.L_2390:
    ldr r1, [r2]
    add r1, r1, #0x1
    str r1, [r2]
    ldr r1, [r2, #0x4]
    sub r1, r1, #0x1
    str r1, [r2, #0x4]
    ldr r3, [r2]
    cmp r3, #0x0
    blt .L_2390
.L_23b4:
    cmp r3, #0x6
    bxlt lr
    cmp r3, #0x6
    mov r0, #0x1
    bxlt lr
.L_23c8:
    ldr r1, [r2]
    sub r1, r1, #0x1
    str r1, [r2]
    ldr r1, [r2, #0x4]
    add r1, r1, #0x1
    str r1, [r2, #0x4]
    ldr r1, [r2]
    cmp r1, #0x6
    bge .L_23c8
    bx lr
