; func_ov016_021b75ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern data_ov016_021bb050
        .extern func_0208f2a4
        .extern func_0208f2fc
        .extern func_0208f370
        .global func_ov016_021b75ac
        .arm
func_ov016_021b75ac:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r8, #0x0
    ldr r5, _LIT0
    mov fp, #0x3
    mov sl, #0x2
    mov r6, #0x1
    mov r7, r8
    mov r4, r8
.L_20:
    cmp r8, #0x4
    addls pc, pc, r8, lsl #0x2
    b .L_64
    b .L_40
    b .L_48
    b .L_50
    b .L_58
    b .L_60
.L_40:
    mov r9, r7
    b .L_64
.L_48:
    mov r9, r6
    b .L_64
.L_50:
    mov r9, sl
    b .L_64
.L_58:
    mov r9, fp
    b .L_64
.L_60:
    mov r9, #0x4
.L_64:
    ldr r0, [r5, r8, lsl #0x2]
    cmp r0, #0x0
    beq .L_98
    bl func_0208f370
    ldr r0, [r5, r8, lsl #0x2]
    mov r1, r9, lsl #0x9
    add r0, r0, #0x28
    mov r2, #0x200
    bl func_0208f2fc
    bl func_0208f2a4
    ldr r0, [r5, r8, lsl #0x2]
    bl Task_InvokeLocked
    str r4, [r5, r8, lsl #0x2]
.L_98:
    add r8, r8, #0x1
    cmp r8, #0x5
    blt .L_20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov016_021bb050
