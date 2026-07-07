; func_ov002_02236acc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a8
        .extern data_ov002_022d008c
        .extern func_ov002_021d8114
        .extern func_ov002_021e277c
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .global func_ov002_02236acc
        .arm
func_ov002_02236acc:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r2, [r1, #0x5a8]
    ldr r0, [r0, #0xcec]
    ldr r3, [r1, #0x5ac]
    sub r2, r2, #0x7d
    cmp r2, #0x3
    eor r0, r0, r3
    addls pc, pc, r2, lsl #0x2
    b .L_2e8
    b .L_2c8
    b .L_26c
    b .L_24c
    b .L_238
.L_238:
    mov r0, #0x0
    str r0, [r1, #0x5ac]
    bl func_ov002_021e2a4c
    mov r0, #0x7f
    ldmia sp!, {r3, pc}
.L_24c:
    ldr r1, _LIT2
    and r2, r0, #0x1
    mul r3, r2, r1
    ldr r1, _LIT3
    ldr r1, [r1, r3]
    cmp r1, #0x0
    moveq r0, #0x7d
    ldmeqia sp!, {r3, pc}
.L_26c:
    ldr r1, _LIT2
    and r2, r0, #0x1
    mul r3, r2, r1
    ldr r1, _LIT3
    ldr r1, [r1, r3]
    cmp r1, #0x0
    beq .L_2bc
    ldr r2, _LIT4
    sub r1, r1, #0x1
    add r2, r2, r3
    add r2, r2, #0x5d0
    ldr r2, [r2, r1, lsl #0x2]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_021d8114
    mov r0, #0x7e
    ldmia sp!, {r3, pc}
.L_2bc:
    bl func_ov002_021e277c
    mov r0, #0x7d
    ldmia sp!, {r3, pc}
.L_2c8:
    add r0, r3, #0x1
    str r0, [r1, #0x5ac]
    cmp r0, #0x2
    movlt r0, #0x7f
    ldmltia sp!, {r3, pc}
    bl func_ov002_021e2b6c
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_2e8:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d008c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf0a8
_LIT4: .word data_ov002_022cf08c
