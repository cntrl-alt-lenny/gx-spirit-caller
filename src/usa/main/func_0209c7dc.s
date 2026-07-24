; func_0209c7dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_02000b60
        .extern func_020918f0
        .extern func_02091924
        .extern func_020927e4
        .extern func_0209281c
        .extern DC_WaitWriteBufferEmpty
        .extern func_02094688
        .extern func_0209c6d4
        .extern func_0209d194
        .global func_0209c7dc
        .arm
func_0209c7dc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    mov r9, r0
    ldr r8, [r9, #0x2c]
    ldr r0, _LIT0
    ldr r7, [r9, #0x34]
    ldr sl, [r9, #0x30]
    mov r6, #0x100
    bl func_02000b60
    cmp r8, #0xb
    bne .L_34
    bl func_0209c6d4
    mov r6, r0
.L_34:
    mov r0, #0x1
    add r4, r9, #0x120
    mov fp, #0x9
    str r0, [sp]
.L_44:
    ldr r5, [r9, #0x24]
    ldr r0, [r9]
    cmp r6, r5
    movcc r5, r6
    str r5, [r0, #0x14]
    ldr r0, [r9, #0x114]
    ands r0, r0, #0x40
    beq .L_80
    ldr r0, [r9, #0x114]
    mov r1, #0x7
    bic r0, r0, #0x40
    str r0, [r9, #0x114]
    ldr r0, [r9]
    str r1, [r0]
    b .L_194
.L_80:
    cmp r7, #0x3
    addls pc, pc, r7, lsl #0x2
    b .L_110
    b .L_9c
    b .L_c0
    b .L_c0
    b .L_f8
.L_9c:
    mov r1, r5
    add r0, r9, #0x120
    bl func_020927e4
    ldr r1, [r9, #0x1c]
    ldr r0, [r9]
    str r1, [r0, #0xc]
    ldr r0, [r9]
    str r4, [r0, #0x10]
    b .L_110
.L_c0:
    ldr r0, [r9, #0x1c]
    mov r1, r4
    mov r2, r5
    bl func_02094688
    mov r1, r5
    add r0, r9, #0x120
    bl func_0209281c
    bl DC_WaitWriteBufferEmpty
    ldr r0, [r9]
    str r4, [r0, #0xc]
    ldr r1, [r9, #0x20]
    ldr r0, [r9]
    str r1, [r0, #0x10]
    b .L_110
.L_f8:
    ldr r1, [r9, #0x1c]
    ldr r0, [r9]
    str r1, [r0, #0xc]
    ldr r1, [r9, #0x20]
    ldr r0, [r9]
    str r1, [r0, #0x10]
.L_110:
    mov r0, r9
    mov r1, r8
    mov r2, sl
    bl func_0209d194
    cmp r0, #0x0
    beq .L_194
    cmp r7, #0x2
    bne .L_14c
    ldr r2, [sp]
    mov r0, r9
    mov r1, fp
    bl func_0209d194
    cmp r0, #0x0
    bne .L_164
    b .L_194
.L_14c:
    cmp r7, #0x0
    bne .L_164
    ldr r1, [r9, #0x20]
    mov r2, r5
    add r0, r9, #0x120
    bl func_02094688
.L_164:
    ldr r0, [r9, #0x1c]
    add r0, r0, r5
    str r0, [r9, #0x1c]
    ldr r0, [r9, #0x20]
    add r0, r0, r5
    str r0, [r9, #0x20]
    ldr r0, [r9, #0x24]
    sub r0, r0, r5
    str r0, [r9, #0x24]
    ldr r0, [r9, #0x24]
    cmp r0, #0x0
    bne .L_44
.L_194:
    ldr r6, [r9, #0x38]
    ldr r5, [r9, #0x3c]
    bl OS_DisableIrq
    ldr r1, [r9, #0x114]
    mov r4, r0
    bic r0, r1, #0x4c
    str r0, [r9, #0x114]
    add r0, r9, #0x10c
    bl func_02091924
    ldr r0, [r9, #0x114]
    ands r0, r0, #0x10
    beq .L_1cc
    add r0, r9, #0x44
    bl func_020918f0
.L_1cc:
    mov r0, r4
    bl OS_RestoreIrq
    cmp r6, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
    mov r0, r5
    blx r6
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word 0x02000c1c
