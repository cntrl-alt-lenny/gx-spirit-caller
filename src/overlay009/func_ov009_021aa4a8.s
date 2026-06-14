; func_ov009_021aa4a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov009_021adbcc
        .extern data_ov009_021adc54
        .extern func_02005ee0
        .extern func_0208e1ac
        .extern func_0208e200
        .extern func_02094504
        .extern func_ov009_021aacc4
        .global func_ov009_021aa4a8
        .arm
func_ov009_021aa4a8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    mov r4, r0
    ldr r1, _LIT0
    mov r0, #0x0
    mov r2, #0x28
    bl func_02094504
    bl func_0208e200
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094504
    bl func_0208e1ac
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094504
    mov r1, #0x0
    str r1, [r4]
    cmp r5, #0x3
    str r1, [r4, #0x18]
    addls pc, pc, r5, lsl #0x2
    b .L_dc
    b .L_6c
    b .L_ac
    b .L_bc
    b .L_d0
.L_6c:
    ldr r2, _LIT1
    ldr r0, _LIT2
    ldr r2, [r2, #0xa60]
    ldr r0, [r0]
    cmp r2, r0
    mov r0, r4
    bcc .L_98
    mov r1, #0x1
    mov r2, #0x9
    bl func_ov009_021aacc4
    b .L_dc
.L_98:
    mov r2, #0xa
    bl func_ov009_021aacc4
    mov r0, #0x1
    str r0, [r4, #0x18]
    b .L_dc
.L_ac:
    mov r0, r4
    mov r2, #0xb
    bl func_ov009_021aacc4
    b .L_dc
.L_bc:
    mov r1, #0x2
    mov r0, r4
    mov r2, r1
    bl func_ov009_021aacc4
    b .L_dc
.L_d0:
    mov r0, r4
    mov r2, #0xc
    bl func_ov009_021aacc4
.L_dc:
    bl func_02005ee0
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov009_021adbcc
_LIT1: .word data_02104f4c
_LIT2: .word data_ov009_021adc54
