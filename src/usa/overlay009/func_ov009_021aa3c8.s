; func_ov009_021aa3c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov009_021adaec
        .extern data_ov009_021adb74
        .extern func_02005ec4
        .extern func_0208e0c4
        .extern func_0208e118
        .extern func_02094410
        .extern func_ov009_021aabe4
        .global func_ov009_021aa3c8
        .arm
func_ov009_021aa3c8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    mov r4, r0
    ldr r1, _LIT0
    mov r0, #0x0
    mov r2, #0x28
    bl func_02094410
    bl func_0208e118
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094410
    bl func_0208e0c4
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094410
    mov r1, #0x0
    str r1, [r4]
    cmp r5, #0x3
    str r1, [r4, #0x18]
    addls pc, pc, r5, lsl #0x2
    b .L_e4
    b .L_74
    b .L_b4
    b .L_c4
    b .L_d8
.L_74:
    ldr r2, _LIT1
    ldr r0, _LIT2
    ldr r2, [r2, #0xa60]
    ldr r0, [r0]
    cmp r2, r0
    mov r0, r4
    bcc .L_a0
    mov r1, #0x1
    mov r2, #0x9
    bl func_ov009_021aabe4
    b .L_e4
.L_a0:
    mov r2, #0xa
    bl func_ov009_021aabe4
    mov r0, #0x1
    str r0, [r4, #0x18]
    b .L_e4
.L_b4:
    mov r0, r4
    mov r2, #0xb
    bl func_ov009_021aabe4
    b .L_e4
.L_c4:
    mov r1, #0x2
    mov r0, r4
    mov r2, r1
    bl func_ov009_021aabe4
    b .L_e4
.L_d8:
    mov r0, r4
    mov r2, #0xc
    bl func_ov009_021aabe4
.L_e4:
    bl func_02005ec4
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov009_021adaec
_LIT1: .word data_02104e6c
_LIT2: .word data_ov009_021adb74
