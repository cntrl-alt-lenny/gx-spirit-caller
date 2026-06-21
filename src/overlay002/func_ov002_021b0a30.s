; func_ov002_021b0a30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ca988
        .extern data_ov002_022cd73c
        .extern data_ov002_022cf198
        .extern data_ov002_022d016c
        .extern func_ov002_021b15ec
        .extern func_ov002_021d4f18
        .global func_ov002_021b0a30
        .arm
func_ov002_021b0a30:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r2, [r0, #0xd18]
    ldr r1, [r1, r2, lsl #0x2]
    cmp r1, #0x0
    beq .L_80
    ldr r0, [r0, #0xd0c]
    cmp r0, #0x0
    beq .L_38
    bl func_ov002_021b15ec
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
.L_38:
    bl func_ov002_021d4f18
    cmp r0, #0x0
    bne .L_78
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0, #0xd18]
    ldr r0, [r1, r0, lsl #0x2]
    blx r0
    cmp r0, #0x0
    beq .L_78
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r2, [r0, #0xd18]
    add r2, r2, #0x1
    str r2, [r0, #0xd18]
    str r1, [r0, #0xd20]
.L_78:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_80:
    ldr r0, [r0, #0xd00]
    ldr r1, _LIT2
    cmp r0, #0x2
    str r0, [r1, #0x224]
    ldr r2, [r1, #0x4]
    ldr r0, _LIT3
    andne r2, r2, #0x1
    mulne r3, r2, r0
    ldrne r0, _LIT4
    bne .L_b8
    eor r2, r2, #0x1
    and r2, r2, #0x1
    mul r3, r2, r0
    ldr r0, _LIT4
.L_b8:
    ldr r0, [r0, r3]
    str r0, [r1, #0x228]
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022ca988
_LIT2: .word data_ov002_022cd73c
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf198
