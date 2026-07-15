; func_ov005_021af9c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov005_021b1484
        .extern data_ov005_021b1c4c
        .extern func_ov005_021aa3d0
        .extern func_ov005_021aadc8
        .global func_ov005_021af9c0
        .arm
func_ov005_021af9c0:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x28
    ldr r4, _LIT0
    ldr ip, _LIT1
    add r3, sp, #0x0
    mov r5, r0
    mov r2, #0xa
.L_b70:
    ldrh r1, [ip]
    ldrh r0, [ip, #0x2]
    add ip, ip, #0x4
    strh r1, [r3]
    strh r0, [r3, #0x2]
    add r3, r3, #0x4
    subs r2, r2, #0x1
    bne .L_b70
    ldr r0, [r5, #0x20]
    cmp r0, #0x6
    ble .L_c18
    mov r0, r4
    bl func_ov005_021aa3d0
    mov lr, #0x0
    str lr, [r4]
    add ip, sp, #0x0
.L_bb0:
    mov r0, lr, lsl #0x3
    add r2, ip, lr, lsl #0x3
    ldrsh r1, [ip, r0]
    add r3, r4, lr, lsl #0x3
    ldrsh r0, [r2, #0x2]
    strh r1, [r3, #0x34]
    add lr, lr, #0x1
    ldrsh r1, [r2, #0x4]
    strh r0, [r3, #0x36]
    ldrsh r0, [r2, #0x6]
    strh r1, [r3, #0x38]
    cmp lr, #0x5
    strh r0, [r3, #0x3a]
    blt .L_bb0
    ldr r1, [r5, #0x24]
    mov r0, r4
    str r1, [r4, #0x4]
    ldr r1, [r5, #0x20]
    mov r2, #0x6
    sub r3, r1, #0x6
    mov r1, #0x0
    str r3, [r4, #0x8]
    str r2, [r4, #0xc]
    str r1, [r4, #0x10]
    bl func_ov005_021aadc8
    str r0, [r5, #0x2c]
.L_c18:
    mov r0, #0x1
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov005_021b1c4c
_LIT1: .word data_ov005_021b1484
