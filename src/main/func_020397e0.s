; func_020397e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219c480
        .extern data_0219c494
        .extern data_0219c4a0
        .extern data_0219c4e8
        .extern func_0207d1b8
        .extern func_020945f4
        .extern func_02097ff0
        .extern func_02098038
        .extern func_02098388
        .global func_020397e0
        .arm
func_020397e0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x48
    mov r6, r0
    mov r7, r1
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r4, _LIT1
    ldr r5, _LIT2
    bl func_0207d1b8
    cmp r6, #0x0
    ldr r0, _LIT3
    mov r2, #0x0
    str r2, [r0, #0x10]
    str r2, [r0, #0xc]
    strh r2, [r0]
    strh r2, [r0, #0x2]
    strh r2, [r0]
    cmpeq r7, #0x0
    bne .L_bc4
    mov r1, #0x1
    strh r1, [r0, #0x4]
    mov r1, r2
.L_ba0:
    str r1, [r4]
    add r2, r2, #0x1
    str r1, [r4, #0x4]
    cmp r2, #0x6
    add r4, r4, #0xc
    blt .L_ba0
    ldr r0, _LIT3
    str r1, [r0, #0x8]
    b .L_c24
.L_bc4:
    ldr r0, _LIT3
    mov r1, #0x0
    strh r1, [r0, #0x4]
    cmp r6, #0x0
    beq .L_c24
    add r0, sp, #0x0
    bl func_02098388
    add r0, sp, #0x0
    mov r1, r6
    bl func_02098038
    ldr r1, [sp, #0x24]
    mov r2, #0x6
    mov r0, #0x0
.L_bf8:
    str r1, [r4]
    sub r2, r2, #0x1
    str r0, [r4, #0x4]
    cmp r2, #0x0
    add r4, r4, #0xc
    bgt .L_bf8
    ldr r2, [sp, #0x24]
    ldr r1, _LIT3
    add r0, sp, #0x0
    str r2, [r1, #0x8]
    bl func_02097ff0
.L_c24:
    mov r8, #0x0
    mov r7, r8
    mov r6, #0x5c
    mov r4, r8
.L_c34:
    mov r0, r5
    mov r1, r7
    mov r2, r6
    bl func_020945f4
    str r4, [r5, #0x4]
    strb r4, [r5, #0x58]
    str r4, [r5]
    str r4, [r5, #0x10]
    add r8, r8, #0x1
    str r4, [r5, #0xc]
    cmp r8, #0x20
    add r5, r5, #0x5c
    blt .L_c34
    mov r0, #0x1
    add sp, sp, #0x48
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_0219c494
_LIT1: .word data_0219c4a0
_LIT2: .word data_0219c4e8
_LIT3: .word data_0219c480
