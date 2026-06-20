; func_ov002_02235948 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_ov002_021ae664
        .extern func_ov002_021b00d0
        .extern func_ov002_021d93e0
        .extern func_ov002_0226b22c
        .global func_ov002_02235948
        .arm
func_ov002_02235948:
    stmdb sp!, {r3, r4, r5, lr}
    ldrh r2, [r0, #0x2]
    ldrh lr, [r0, #0x4]
    ldr r1, _LIT0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mov r4, r2, lsl #0x1a
    mul r2, r3, r1
    ldr r3, _LIT1
    mov r1, r4, lsr #0x1b
    add r4, r3, r2
    mov ip, #0x14
    mul r3, r1, ip
    add r4, r4, #0x30
    mov r5, lr, lsl #0x11
    ldr r4, [r4, r3]
    mov r5, r5, lsr #0x17
    mov lr, r4, lsl #0x2
    mov lr, lr, lsr #0x18
    mov r4, r4, lsl #0x12
    mov lr, lr, lsl #0x1
    add r4, lr, r4, lsr #0x1f
    cmp r5, r4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr lr, _LIT2
    add r2, lr, r2
    ldrh r2, [r3, r2]
    cmp r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r2, _LIT3
    ldr r2, [r2, #0x5a8]
    cmp r2, #0x7e
    beq .L_ec
    cmp r2, #0x7f
    beq .L_d4
    cmp r2, #0x80
    bne .L_10c
    ldr r1, _LIT4
    ldr r0, [r1, r0, lsl #0x2]
    cmp r0, #0x1
    bne .L_c4
    mov r0, #0x2
    bl func_ov002_021b00d0
    ldr r1, _LIT5
    str r0, [r1, #0xd44]
    b .L_cc
.L_c4:
    mov r0, #0x38
    bl func_ov002_021ae664
.L_cc:
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_d4:
    ldr r2, _LIT5
    ldr r3, [r2, #0xd44]
    mov r2, #0x1
    bl func_ov002_0226b22c
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, pc}
.L_ec:
    ldr r2, _LIT6
    ldrh r2, [r2, #0xb2]
    cmp r2, #0x0
    bne .L_104
    sub r2, ip, #0x15
    bl func_ov002_021d93e0
.L_104:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_10c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word data_ov002_022ce288
_LIT4: .word data_ov002_022cd744
_LIT5: .word data_ov002_022d016c
_LIT6: .word data_ov002_022d0e6c
