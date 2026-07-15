; func_ov017_021b6674 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern data_ov017_021b867c
        .extern func_0208f2a4
        .extern func_0208f2fc
        .extern func_0208f370
        .global func_ov017_021b6674
        .arm
func_ov017_021b6674:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r9, #0x0
    ldr r5, _LIT0
    mov r6, #0x4
    mov r7, #0x3
    mov r8, #0x2
    mov fp, #0x200
    mov r4, r9
.L_328:
    cmp r9, #0x0
    beq .L_344
    cmp r9, #0x1
    beq .L_34c
    cmp r9, #0x2
    moveq sl, r6
    b .L_350
.L_344:
    mov sl, r8
    b .L_350
.L_34c:
    mov sl, r7
.L_350:
    ldr r0, [r5, r9, lsl #0x2]
    cmp r0, #0x0
    beq .L_384
    bl func_0208f370
    ldr r0, [r5, r9, lsl #0x2]
    mov r2, fp
    add r0, r0, #0x28
    mov r1, sl, lsl #0x9
    bl func_0208f2fc
    bl func_0208f2a4
    ldr r0, [r5, r9, lsl #0x2]
    bl Task_InvokeLocked
    str r4, [r5, r9, lsl #0x2]
.L_384:
    add r9, r9, #0x1
    cmp r9, #0x3
    blt .L_328
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov017_021b867c
