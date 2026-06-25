; func_0208624c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02084d24
        .global func_0208624c
        .arm
func_0208624c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r6, r0
    ldr r0, [r6]
    mov r5, #0x0
    ands r4, r0, #0x18
    bne .L_418
    add r1, r6, #0x1c
    mov r0, #0x1b
    mov r2, #0x3
    bl func_02084d24
.L_418:
    ldr r0, [r6]
    ands r0, r0, #0x4
    bne .L_488
    cmp r4, #0x0
    movne r5, #0x1
    bne .L_488
    ldr r2, [r6, #0x4c]
    ldr r0, [r6, #0x10]
    add r1, sp, #0x0
    smull r3, r0, r2, r0
    mov r2, r3, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    str r2, [sp]
    ldr r3, [r6, #0x50]
    ldr r2, [r6, #0x14]
    mov r0, #0x1c
    smull ip, r2, r3, r2
    mov r3, ip, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    str r3, [sp, #0x4]
    ldr ip, [r6, #0x54]
    ldr r3, [r6, #0x18]
    mov r2, #0x3
    smull lr, r3, ip, r3
    mov ip, lr, lsr #0xc
    orr ip, ip, r3, lsl #0x14
    str ip, [sp, #0x8]
    bl func_02084d24
.L_488:
    ldr r0, [r6]
    ands r0, r0, #0x2
    bne .L_4c4
    cmp r5, #0x0
    beq .L_4b0
    add r1, r6, #0x28
    mov r0, #0x19
    mov r2, #0xc
    bl func_02084d24
    b .L_4dc
.L_4b0:
    add r1, r6, #0x28
    mov r0, #0x1a
    mov r2, #0x9
    bl func_02084d24
    b .L_4dc
.L_4c4:
    cmp r5, #0x0
    beq .L_4dc
    add r1, r6, #0x4c
    mov r0, #0x1c
    mov r2, #0x3
    bl func_02084d24
.L_4dc:
    cmp r4, #0x0
    bne .L_4f4
    add r1, r6, #0x10
    mov r0, #0x1b
    mov r2, #0x3
    bl func_02084d24
.L_4f4:
    ldr r0, [r6]
    ands r0, r0, #0x1
    addne sp, sp, #0x10
    ldmneia sp!, {r4, r5, r6, pc}
    add r1, r6, #0x4
    mov r0, #0x1b
    mov r2, #0x3
    bl func_02084d24
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
