; func_ov015_021b3e14 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern data_ov015_021b5e44
        .extern func_ov005_021ab6ac
        .global func_ov015_021b3e14
        .arm
func_ov015_021b3e14:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    mov r5, r0
    ldrh r1, [r1]
    ldr r0, [r5]
    ldr r4, _LIT1
    strh r1, [sp]
    ldrh r1, [sp]
    cmp r0, #0x0
    strh r1, [sp, #0x2]
    beq .L_734
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r5]
.L_734:
    ldrh r0, [sp, #0x2]
    ldr r3, _LIT0
    bic r0, r0, #0x80
    strh r0, [sp, #0x2]
    ldrh r1, [sp, #0x2]
    ldrh r2, [r3]
    mov ip, r1, lsl #0x10
    mov lr, r1, lsl #0x18
    mov r5, r1, lsl #0x13
    mov r0, r1, lsl #0x1a
    mov r1, r1, lsl #0x12
    mov ip, ip, lsr #0x1e
    and r2, r2, #0x43
    mov lr, lr, lsr #0x1f
    orr r2, r2, ip, lsl #0xe
    mov r5, r5, lsr #0x1b
    orr r2, r2, lr, lsl #0x7
    mov ip, r0, lsr #0x1c
    orr r0, r2, r5, lsl #0x8
    mov r1, r1, lsr #0x1f
    orr r0, r0, ip, lsl #0x2
    orr r0, r0, r1, lsl #0xd
    strh r0, [r3]
    ldr r1, [r4, #0xa84]
    ldr r0, [r4, #0x878]
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    str r1, [r4, #0xa84]
    bl func_ov005_021ab6ac
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x04001008
_LIT1: .word data_ov015_021b5e44
