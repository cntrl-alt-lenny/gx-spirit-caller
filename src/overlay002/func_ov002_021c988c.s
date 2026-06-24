; func_ov002_021c988c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd4b8
        .extern data_ov002_022cd4cc
        .extern data_ov002_022cd73c
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf8f4
        .extern data_ov002_022d016c
        .extern func_ov002_021b3fd8
        .extern func_ov002_021c3cc8
        .global func_ov002_021c988c
        .arm
func_ov002_021c988c:
    stmdb sp!, {r3, lr}
    sub r3, r1, #0xb
    cmp r3, #0x4
    addls pc, pc, r3, lsl #0x2
    b .L_104
    b .L_d8
    b .L_28
    b .L_30
    b .L_80
    b .L_88
.L_28:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_30:
    ldr ip, _LIT0
    ldr r1, _LIT1
    and r3, r0, #0x1
    mla r1, r3, r1, ip
    add r1, r1, #0x260
    ldr r3, [r1, r2, lsl #0x2]
    ldr r2, _LIT2
    mov r1, r3, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r1, r1, lsl #0x1
    add r3, r1, r3, lsr #0x1f
    mov r1, #0xb
    bl func_ov002_021b3fd8
    ldr r1, _LIT3
    ldr r1, [r1, #0xd0]
    mov r1, r1, lsr #0x2
    and r1, r1, #0x1
    eor r0, r1, r0
    ldmia sp!, {r3, pc}
.L_80:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_88:
    ldr r1, _LIT1
    ldr r3, _LIT4
    and ip, r0, #0x1
    mla r0, ip, r1, r3
    mov r1, r2, lsl #0x1
    ldrh r1, [r1, r0]
    and r0, r1, #0xff
    cmp r0, #0x40
    beq .L_bc
    cmp r0, #0x80
    bne .L_d0
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_bc:
    mov r0, r1, asr #0x8
    and r0, r0, #0xff
    mov r0, r0, asr #0x1
    and r0, r0, #0x1
    ldmia sp!, {r3, pc}
.L_d0:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_d8:
    ldr r1, _LIT5
    ldr r1, [r1, #0x4]
    cmp r0, r1
    beq .L_f4
    bl func_ov002_021c3cc8
    cmp r0, #0x0
    beq .L_fc
.L_f4:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_fc:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_104:
    add lr, r1, r2
    cmp lr, #0xa
    ble .L_134
    ldr r2, _LIT6
    ldr r3, [r2]
    cmp r0, r3
    ldreq r0, [r2, #0x1c]
    cmpeq r1, r0
    ldreq r0, _LIT7
    ldrne r0, _LIT8
    ldrh r0, [r0, #0x8]
    ldmia sp!, {r3, pc}
.L_134:
    ldr r1, _LIT1
    mov r2, #0x14
    ldr r3, _LIT9
    and ip, r0, #0x1
    mul r2, lr, r2
    mla r0, ip, r1, r3
    ldrh r0, [r2, r0]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word 0x000012a1
_LIT3: .word data_ov002_022d016c
_LIT4: .word data_ov002_022cf8f4
_LIT5: .word data_ov002_022cd73c
_LIT6: .word data_ov002_022cd3f4
_LIT7: .word data_ov002_022cd4b8
_LIT8: .word data_ov002_022cd4cc
_LIT9: .word data_ov002_022cf1a4
