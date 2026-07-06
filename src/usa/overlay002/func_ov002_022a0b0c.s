; func_ov002_022a0b0c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102bb0
        .extern func_02001cec
        .extern func_0200516c
        .extern func_0202b778
        .extern func_0208dd64
        .extern func_020aace8
        .extern func_ov002_021afaf4
        .extern func_ov002_0229ce90
        .global func_ov002_022a0b0c
        .arm
func_ov002_022a0b0c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x108
    mov r7, r0
    ldr r0, [r7, #0x24]
    mov r4, #0x0
    mov r5, r4
    mov r6, r4
    cmp r0, #0x0
    ble .L_149c
    add r8, sp, #0x8
.L_145c:
    mov r0, r6
    bl func_ov002_021afaf4
    movs r9, r0
    beq .L_148c
    mov r0, r8
    mov r1, r9
    bl func_ov002_0229ce90
    mov r0, r8
    bl func_020aace8
    cmp r5, r0
    movlt r5, r0
    movlt r4, r9
.L_148c:
    ldr r0, [r7, #0x24]
    add r6, r6, #0x1
    cmp r6, r0
    blt .L_145c
.L_149c:
    bl func_0208dd64
    ldr r2, [r7, #0x30]
    mov r1, #0x18
    mov r2, r2, lsl #0x5
    add r2, r2, #0x1
    add r5, r0, r2, lsl #0x6
    ldr r0, _LIT0
    mov r2, #0x12
    bl func_02001cec
    mov r0, r4
    bl func_0202b778
    mov r1, r0
    mov r0, #0x4
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT0
    mov r2, r5
    mov r3, #0x0
    bl func_0200516c
    ldr r0, _LIT0
    ldr r1, _LIT0
    ldr r0, [r0, #0x8]
    ldr r1, [r1, #0xc]
    cmp r0, #0x0
    movne r2, #0x1
    moveq r2, #0x0
    mov r0, #0xc
    mla r0, r2, r0, r1
    add r0, r0, #0x7
    mov r0, r0, lsr #0x3
    sub r0, r0, #0x1
    add sp, sp, #0x108
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_02102bb0
