; func_ov002_021d119c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce870
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021b2718
        .extern func_ov002_0229acd0
        .global func_ov002_021d119c
        .arm
func_ov002_021d119c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, _LIT0
    mov r2, #0x0
    ldrh r0, [r0]
    mov r3, r2
    tst r0, #0x8000
    movne r1, #0x1
    moveq r1, #0x0
    mov r0, #0x48
    bl func_ov002_0229acd0
    mov ip, #0x0
    ldr r2, _LIT1
    ldr r1, _LIT2
    mov r3, ip
.L_38:
    and r0, ip, #0x1
    mla r4, r0, r1, r2
    mov lr, r3
.L_44:
    ldr r0, [r4, #0x40]
    add lr, lr, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r4, #0x40]
    cmp lr, #0xb
    add r4, r4, #0x14
    ble .L_44
    add ip, ip, #0x1
    cmp ip, #0x2
    blt .L_38
    ldr r1, _LIT3
    mov r3, #0x0
    ldr r0, [r1, #0xd0]
    mov lr, r3
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r1, #0xd0]
    ldr r0, _LIT1
    mov r1, r3
.L_94:
    ldr r2, _LIT2
    and ip, r3, #0x1
    mla r2, ip, r2, r0
    ldr ip, [r2, #0x14]
    mov r5, r1
    cmp ip, #0x0
    bls .L_d4
    add ip, r2, #0x18
    add r4, ip, #0x400
.L_b8:
    ldr ip, [r4]
    add r5, r5, #0x1
    orr ip, ip, #0x100000
    str ip, [r4], #0x4
    ldr ip, [r2, #0x14]
    cmp r5, ip
    bcc .L_b8
.L_d4:
    ldr ip, [r2, #0x1c]
    mov r5, lr
    cmp ip, #0x0
    bls .L_104
    add r4, r2, #0x5d0
.L_e8:
    ldr ip, [r4]
    add r5, r5, #0x1
    orr ip, ip, #0x100000
    str ip, [r4], #0x4
    ldr ip, [r2, #0x1c]
    cmp r5, ip
    bcc .L_e8
.L_104:
    add r3, r3, #0x1
    cmp r3, #0x2
    blt .L_94
    bl func_ov002_021b2718
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce870
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022d008c
