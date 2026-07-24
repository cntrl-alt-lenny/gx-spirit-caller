; func_ov004_021c9fcc - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_02200dbc
        .extern data_ov004_02209ad4
        .extern func_0201ef90
        .extern OS_SPrintf
        .extern func_ov004_021c9f94
        .global func_ov004_021c9fcc
        .arm
func_ov004_021c9fcc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xbc
    mov sl, r0
    mov r9, r1
    str r2, [sp, #0x18]
    mov fp, r3
    bl func_ov004_021c9f94
    ldr r0, _LIT0
    add r6, sp, #0x1c
    ldmia r0, {r0, r1, r2, r3}
    stmia r6, {r0, r1, r2, r3}
    ldr r5, _LIT1
    add r8, sp, #0x3c
    mov r7, #0x0
    add r4, sp, #0x2c
.L_3c:
    ldr r3, [r6, r7, lsl #0x2]
    mov r0, r8
    mov r1, r5
    mov r2, r9
    bl OS_SPrintf
    str r8, [r4, r7, lsl #0x2]
    add r7, r7, #0x1
    cmp r7, #0x4
    add r8, r8, #0x20
    blt .L_3c
    ldr r0, [sp, #0x18]
    ldr r1, [sp, #0xe0]
    cmp r0, #0x1
    moveq r2, #0x1
    movne r2, #0x2
    ldr r0, [sp, #0xe0]
    mov r1, r1, lsl #0x9
    stmia sp, {r1, r2}
    cmp r0, #0x0
    movgt r3, #0x1
    add r0, sp, #0x2c
    str r0, [sp, #0x8]
    movle r3, #0x0
    str r3, [sp, #0xc]
    mov r0, #0x200
    str r0, [sp, #0x10]
    add r4, sl, #0x90
    mov r3, fp
    add r0, sl, #0x8
    add r1, sl, #0xc
    add r2, sl, #0x10
    str r4, [sp, #0x14]
    bl func_0201ef90
    ldr r0, [sp, #0xe0]
    stmia sl, {r0, fp}
    add sp, sp, #0xbc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov004_02200dbc
_LIT1: .word data_ov004_02209ad4
