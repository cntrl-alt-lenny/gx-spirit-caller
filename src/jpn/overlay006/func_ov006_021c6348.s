; func_ov006_021c6348 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov000_021b1c4c
        .extern data_ov006_021cb714
        .extern func_ov005_021aa3d0
        .global func_ov006_021c6348
        .arm
func_ov006_021c6348:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x28
    ldr r1, [r0, #0x4c]
    add r0, r0, #0x6c
    add r4, r0, r1, lsl #0x4
    ldr r0, [r4, #0xc]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_c8
    ldr r5, _LIT0
    ldr ip, _LIT1
    add r3, sp, #0x0
    mov r2, #0xa
.L_34:
    ldrh r1, [ip]
    ldrh r0, [ip, #0x2]
    add ip, ip, #0x4
    strh r1, [r3]
    strh r0, [r3, #0x2]
    add r3, r3, #0x4
    subs r2, r2, #0x1
    bne .L_34
    ldr r0, _LIT0
    bl func_ov005_021aa3d0
    ldr r0, _LIT0
    mov lr, #0x0
    str lr, [r0]
    add ip, sp, #0x0
.L_6c:
    mov r0, lr, lsl #0x3
    add r2, ip, lr, lsl #0x3
    ldrsh r1, [ip, r0]
    add r3, r5, lr, lsl #0x3
    ldrsh r0, [r2, #0x2]
    strh r1, [r3, #0x34]
    add lr, lr, #0x1
    ldrsh r1, [r2, #0x4]
    strh r0, [r3, #0x36]
    ldrsh r0, [r2, #0x6]
    strh r1, [r3, #0x38]
    cmp lr, #0x5
    strh r0, [r3, #0x3a]
    blt .L_6c
    ldr r1, [r4, #0x4]
    mov r0, #0x6
    str r1, [r5, #0x4]
    ldr r1, [r4, #0x8]
    sub r1, r1, #0x6
    str r1, [r5, #0x8]
    str r0, [r5, #0xc]
    ldr r0, [r4]
    str r0, [r5, #0x10]
.L_c8:
    mov r0, #0x1
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov000_021b1c4c
_LIT1: .word data_ov006_021cb714
