; func_ov017_021b6774 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern data_ov017_021b877c
        .extern func_0208f38c
        .extern func_0208f3e4
        .extern func_0208f458
        .global func_ov017_021b6774
        .arm
func_ov017_021b6774:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r9, #0x0
    ldr r5, _LIT0
    mov r6, #0x4
    mov r7, #0x3
    mov r8, #0x2
    mov fp, #0x200
    mov r4, r9
.L_20:
    cmp r9, #0x0
    beq .L_3c
    cmp r9, #0x1
    beq .L_44
    cmp r9, #0x2
    moveq sl, r6
    b .L_48
.L_3c:
    mov sl, r8
    b .L_48
.L_44:
    mov sl, r7
.L_48:
    ldr r0, [r5, r9, lsl #0x2]
    cmp r0, #0x0
    beq .L_7c
    bl func_0208f458
    ldr r0, [r5, r9, lsl #0x2]
    mov r2, fp
    add r0, r0, #0x28
    mov r1, sl, lsl #0x9
    bl func_0208f3e4
    bl func_0208f38c
    ldr r0, [r5, r9, lsl #0x2]
    bl Task_InvokeLocked
    str r4, [r5, r9, lsl #0x2]
.L_7c:
    add r9, r9, #0x1
    cmp r9, #0x3
    blt .L_20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov017_021b877c
