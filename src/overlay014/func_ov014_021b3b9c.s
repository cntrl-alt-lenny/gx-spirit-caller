; func_ov014_021b3b9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern data_ov014_022350e0
        .extern func_0208f38c
        .extern func_0208f3e4
        .extern func_0208f458
        .global func_ov014_021b3b9c
        .arm
func_ov014_021b3b9c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r7, #0x0
    ldr r4, _LIT0
    mov r5, #0x1
    mov r6, r7
    mov sl, #0x200
    mov r9, r7
.L_650:
    cmp r7, #0x0
    beq .L_664
    cmp r7, #0x1
    moveq r8, r5
    b .L_668
.L_664:
    mov r8, r6
.L_668:
    ldr r0, [r4, r7, lsl #0x2]
    cmp r0, #0x0
    beq .L_69c
    bl func_0208f458
    ldr r0, [r4, r7, lsl #0x2]
    mov r2, sl
    add r0, r0, #0x28
    mov r1, r8, lsl #0x9
    bl func_0208f3e4
    bl func_0208f38c
    ldr r0, [r4, r7, lsl #0x2]
    bl Task_InvokeLocked
    str r9, [r4, r7, lsl #0x2]
.L_69c:
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_650
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov014_022350e0
