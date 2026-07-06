; func_ov002_022126c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_ov002_021ae584
        .extern func_ov002_021afff0
        .extern func_ov002_021d58dc
        .extern func_ov002_0226b13c
        .global func_ov002_022126c4
        .arm
func_ov002_022126c4:
    stmdb sp!, {r3, lr}
    ldrh r1, [r0, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr r1, _LIT0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7e
    beq .L_3d0
    cmp r1, #0x7f
    beq .L_3a4
    cmp r1, #0x80
    bne .L_404
    ldrh r1, [r0, #0x2]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_394
    mov r0, #0x2
    bl func_ov002_021afff0
    ldr r1, _LIT2
    str r0, [r1, #0xd44]
    b .L_39c
.L_394:
    mov r0, #0x38
    bl func_ov002_021ae584
.L_39c:
    mov r0, #0x7f
    ldmia sp!, {r3, pc}
.L_3a4:
    ldrh r1, [r0, #0x2]
    ldr r0, _LIT2
    mov r2, #0x1
    mov ip, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    ldr r3, [r0, #0xd44]
    mov r0, ip, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_0226b13c
    mov r0, #0x7e
    ldmia sp!, {r3, pc}
.L_3d0:
    ldr r1, _LIT3
    mov r3, #0x2
    ldrh r1, [r1, #0xb2]
    str r1, [sp]
    ldrh r1, [r0, #0x2]
    ldrh r2, [r0]
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d58dc
    mov r0, #0xa
    ldmia sp!, {r3, pc}
.L_404:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cd664
_LIT2: .word data_ov002_022d008c
_LIT3: .word data_ov002_022d0d8c
