; func_ov002_022751c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022cd664
        .extern data_ov002_022d008c
        .extern func_ov002_021ae3a4
        .extern func_ov002_021baf88
        .extern func_ov002_021bca30
        .extern func_ov002_021fd180
        .extern func_ov002_022719c4
        .global func_ov002_022751c8
        .arm
func_ov002_022751c8:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x18
    ldr r1, _LIT0
    ldr r2, [r1, #0x18]
    mov r0, r2, lsl #0x18
    movs r0, r0, lsr #0x18
    beq .L_724
    cmp r0, #0x1
    beq .L_88c
    cmp r0, #0x1e
    bne .L_8a8
.L_724:
    ldr r1, _LIT1
    mov r2, #0x0
    ldr r0, _LIT0
    str r2, [r1, #0xd44]
    ldrh r1, [r0, #0x16]
    mov r1, r1, lsl #0x1a
    movs r1, r1, lsr #0x1e
    bne .L_868
    ldr r0, [r0]
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x1e
    beq .L_764
    ldr r0, _LIT2
    bl func_ov002_021baf88
    cmp r0, #0x0
    beq .L_868
.L_764:
    ldr r0, _LIT0
    mov r2, #0x1
    ldr r0, [r0]
    mov r3, r0, lsl #0x1f
    mov r1, r0, lsl #0x9
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x11
    bl func_ov002_021bca30
    cmp r0, #0x3
    blt .L_868
    ldr r1, _LIT0
    add r0, sp, #0x0
    ldr r2, [r1]
    mov r1, #0x0
    str r1, [r0]
    mov r3, r2, lsl #0x1f
    mov r3, r3, lsr #0x1f
    ldrh r4, [sp, #0x2]
    mov r3, r3, lsl #0x10
    mov r3, r3, lsr #0x10
    bic r4, r4, #0x1
    and r3, r3, #0x1
    orr r3, r4, r3
    strh r3, [sp, #0x2]
    ldrh r4, [sp, #0x2]
    mov r3, r2, lsr #0x17
    mov r3, r3, lsl #0x10
    bic r4, r4, #0x3e
    strh r4, [sp, #0x2]
    str r1, [r0, #0x4]
    mov lr, r3, lsr #0x10
    mov r3, r2, lsl #0x9
    ldrh ip, [sp, #0x2]
    mov r5, r3, lsr #0x11
    ldrh r4, [sp, #0x4]
    bic r2, ip, #0x3000
    orr r3, r2, #0x1000
    ldr r2, _LIT3
    mov ip, lr, lsl #0x17
    and r2, r4, r2
    orr r2, r2, ip, lsr #0x11
    str r1, [r0, #0x8]
    str r1, [r0, #0xc]
    str r1, [r0, #0x10]
    str r1, [r0, #0x14]
    strh r5, [sp]
    strh r2, [sp, #0x4]
    strh r3, [sp, #0x2]
    bl func_ov002_021fd180
    cmp r0, #0x0
    beq .L_868
    ldr r0, _LIT0
    ldr r1, _LIT4
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r0, [r1, r0, lsl #0x2]
    cmp r0, #0x1
    bne .L_860
    ldr r0, _LIT1
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_868
.L_860:
    ldr r0, _LIT5
    bl func_ov002_021ae3a4
.L_868:
    ldr r1, _LIT0
    mov r0, #0x0
    strb r0, [r1, #0x8]
    ldr r2, [r1, #0x18]
    add sp, sp, #0x18
    bic r2, r2, #0xff
    orr r2, r2, #0x1
    str r2, [r1, #0x18]
    ldmia sp!, {r3, r4, r5, pc}
.L_88c:
    ldr r0, _LIT1
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    bic r0, r2, #0xff
    orrne r0, r0, #0x1f
    strne r0, [r1, #0x18]
    streq r0, [r1, #0x18]
.L_8a8:
    bl func_ov002_022719c4
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word data_ov002_022d008c
_LIT2: .word 0x0000135d
_LIT3: .word 0xffff803f
_LIT4: .word data_ov002_022cd664
_LIT5: .word 0x00000123
