; func_ov016_021b7718 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern data_ov016_021bb1b0
        .extern func_0208f38c
        .extern func_0208f3e4
        .extern func_0208f458
        .global func_ov016_021b7718
        .arm
func_ov016_021b7718:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r8, #0x0
    ldr r5, _LIT0
    mov fp, #0x3
    mov sl, #0x2
    mov r6, #0x1
    mov r7, r8
    mov r4, r8
.L_170:
    cmp r8, #0x4
    addls pc, pc, r8, lsl #0x2
    b .L_1b4
    b .L_190
    b .L_198
    b .L_1a0
    b .L_1a8
    b .L_1b0
.L_190:
    mov r9, r7
    b .L_1b4
.L_198:
    mov r9, r6
    b .L_1b4
.L_1a0:
    mov r9, sl
    b .L_1b4
.L_1a8:
    mov r9, fp
    b .L_1b4
.L_1b0:
    mov r9, #0x4
.L_1b4:
    ldr r0, [r5, r8, lsl #0x2]
    cmp r0, #0x0
    beq .L_1e8
    bl func_0208f458
    ldr r0, [r5, r8, lsl #0x2]
    mov r1, r9, lsl #0x9
    add r0, r0, #0x28
    mov r2, #0x200
    bl func_0208f3e4
    bl func_0208f38c
    ldr r0, [r5, r8, lsl #0x2]
    bl Task_InvokeLocked
    str r4, [r5, r8, lsl #0x2]
.L_1e8:
    add r8, r8, #0x1
    cmp r8, #0x5
    blt .L_170
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov016_021bb1b0
