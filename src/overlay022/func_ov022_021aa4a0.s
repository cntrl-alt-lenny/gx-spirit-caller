; func_ov022_021aa4a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov022_021abae8
        .extern data_ov022_021acaa0
        .extern func_0207ec68
        .extern func_0207ed94
        .extern func_0208f2a8
        .extern func_0208f2f4
        .extern func_0208f368
        .extern func_0208f4c8
        .extern func_0208f52c
        .extern func_0208f5ac
        .global func_ov022_021aa4a0
        .arm
func_ov022_021aa4a0:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0, #0x198]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_68
    add r0, r4, #0x1000
    ldr r1, [r0, #0x150]
    bic r1, r1, #0x1
    str r1, [r0, #0x150]
    bl func_0208f5ac
    add r0, r4, #0x84
    add r0, r0, #0xc00
    mov r1, #0x4000
    mov r2, #0x200
    bl func_0208f52c
    bl func_0208f4c8
    bl func_0208f368
    add r0, r4, #0x284
    add r0, r0, #0xc00
    mov r1, #0x4000
    mov r2, #0x200
    bl func_0208f2f4
    bl func_0208f2a8
.L_68:
    add r5, r4, #0x10
    mov r4, #0x0
.L_70:
    mov r0, r5
    bl func_0207ed94
    mov r0, r5
    bl func_0207ec68
    add r0, r5, #0x1c
    add r4, r4, #0x1
    cmp r4, #0x2
    add r5, r0, #0x400
    blt .L_70
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov022_021acaa0
_LIT1: .word data_ov022_021abae8
