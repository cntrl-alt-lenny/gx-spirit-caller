; func_020b0fec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b0358
        .extern func_020b0e6c
        .global func_020b0fec
        .arm
func_020b0fec:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r3
    ldrsh r5, [r0, #0x2]
    mov r0, r4
    bl func_020b0e6c
    ldrb r0, [r4, #0x5]
    cmp r0, #0x9
    ldmhiia sp!, {r3, r4, r5, pc}
    cmp r5, #0x20
    movgt r5, #0x20
    mov r0, r4
    mov r1, r5
    bl func_020b0358
    ldrb r0, [r4, #0x4]
    cmp r0, r5
    bge .L_9cc
    mov r1, #0x0
.L_9ac:
    ldrb r2, [r4, #0x4]
    add r0, r4, r0
    add r2, r2, #0x1
    strb r2, [r4, #0x4]
    strb r1, [r0, #0x5]
    ldrb r0, [r4, #0x4]
    cmp r0, r5
    blt .L_9ac
.L_9cc:
    ldrsh r1, [r4, #0x2]
    sub r0, r0, #0x1
    mov r2, #0x0
    sub r0, r1, r0
    strh r0, [r4, #0x2]
    ldrb r0, [r4, #0x4]
    cmp r0, #0x0
    ldmleia sp!, {r3, r4, r5, pc}
.L_9ec:
    add r1, r4, r2
    ldrb r0, [r1, #0x5]
    add r2, r2, #0x1
    add r0, r0, #0x30
    strb r0, [r1, #0x5]
    ldrb r0, [r4, #0x4]
    cmp r2, r0
    blt .L_9ec
    ldmia sp!, {r3, r4, r5, pc}
