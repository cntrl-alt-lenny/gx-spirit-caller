; func_ov002_021d45ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022ce950
        .extern data_ov002_022cf16c
        .extern func_ov002_021b0b54
        .extern func_ov002_021b0bdc
        .extern func_ov002_0229ade0
        .extern func_ov002_0229c7f8
        .global func_ov002_021d45ec
        .arm
func_ov002_021d45ec:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne r5, #0x1
    ldr r1, [r0, #0x810]
    moveq r5, #0x0
    ldrh r4, [r0, #0x2]
    cmp r1, #0x0
    beq .L_38
    cmp r1, #0x1
    beq .L_60
    ldmia sp!, {r3, r4, r5, pc}
.L_38:
    mov r1, r5
    mov r2, r4
    mov r0, #0xd
    mov r3, #0x0
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, pc}
.L_60:
    mov r0, #0xd
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT1
    and r1, r5, #0x1
    mul r2, r1, r0
    ldr r3, _LIT2
    ldr r0, _LIT3
    ldr r1, [r3, r2]
    ldr r0, [r0, #0x4]
    str r4, [r3, r2]
    cmp r5, r0
    bne .L_b0
    ldr r0, [r3, r2]
    cmp r0, r1
    bge .L_b0
    mov r0, #0x36
    mov r1, #0x1
    bl func_ov002_021b0b54
.L_b0:
    ldr r1, _LIT3
    ldr r0, _LIT1
    ldr r2, [r1, #0x4]
    ldr r1, _LIT2
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r1, [r1, r0]
    mov r0, #0x13
    bl func_ov002_021b0bdc
    ldr r1, _LIT3
    ldr r0, _LIT1
    ldr r4, [r1, #0x4]
    ldr r3, _LIT2
    eor r1, r4, #0x1
    and r2, r1, #0x1
    and r1, r4, #0x1
    mul r4, r2, r0
    mul r0, r1, r0
    ldr r2, [r3, r4]
    ldr r1, [r3, r0]
    mov r0, #0x14
    sub r1, r2, r1
    bl func_ov002_021b0bdc
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022cd73c
