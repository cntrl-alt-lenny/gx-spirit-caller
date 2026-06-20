; func_ov002_022a7f54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021afb90
        .extern func_ov002_021c9650
        .extern func_ov002_022a7e00
        .global func_ov002_022a7f54
        .arm
func_ov002_022a7f54:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    ldr r4, [sp, #0x20]
    mov r8, r0
    mov r7, r1
    mov r6, r2
    mov r5, r3
    cmp r4, #0x0
    beq .L_1c0
    add r0, r5, #0x1
    str r0, [r8, #0x5bc]
    ldr r1, [r8, #0x5b4]
    mov r0, #0x20
    sub r1, r1, #0x1
    str r1, [r8, #0x5b4]
    str r0, [r8, #0x5c0]
    ldr r0, [r8, #0x5b4]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r8, #0x5b8]
    mov r0, r5
    bl func_ov002_021afb90
    ldr r1, [r0]
    add sp, sp, #0x4
    orr r1, r1, #0x4000
    str r1, [r0]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_1c0:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_ov002_021c9650
    mvn r1, #0x0
    str r1, [r8, #0x5bc]
    ldr ip, [sp, #0x20]
    mov r4, r0
    mov r0, r8
    mov r1, r7
    mov r2, r6
    mov r3, r5
    str ip, [sp]
    bl func_ov002_022a7e00
    ldr r3, [r8, #0x5b4]
    mov r2, #0x0
    cmp r3, #0x0
    addle sp, sp, #0x4
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_20c:
    add r0, r8, r2, lsl #0x1
    add r1, r0, #0x500
    ldrh r0, [r1, #0xa0]
    cmp r4, r0
    bne .L_270
    ldr r2, [r8, #0x5b4]
    mov r0, #0x20
    sub r2, r2, #0x1
    str r2, [r8, #0x5b4]
    ldr r2, [r8, #0x5b8]
    add sp, sp, #0x4
    sub r2, r2, #0x1
    str r2, [r8, #0x5b8]
    str r0, [r8, #0x5c0]
    ldr r0, [r8, #0x5b4]
    ldrh r2, [r1, #0xa0]
    add r0, r8, r0, lsl #0x1
    add r0, r0, #0x500
    ldrh r0, [r0, #0xa0]
    strh r0, [r1, #0xa0]
    ldr r0, [r8, #0x5b4]
    add r0, r8, r0, lsl #0x1
    add r0, r0, #0x500
    strh r2, [r0, #0xa0]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_270:
    add r2, r2, #0x1
    cmp r2, r3
    blt .L_20c
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
