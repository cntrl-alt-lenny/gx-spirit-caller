; func_ov002_021f655c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf098
        .extern func_ov002_021d792c
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .global func_ov002_021f655c
        .arm
func_ov002_021f655c:
    stmdb sp!, {r3, lr}
    ldrh r1, [r0, #0x2]
    mov r0, r1, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x23
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    ldr r0, _LIT0
    ldr r0, [r0, #0x5b4]
    cmp r0, #0x0
    beq .L_140
    cmp r0, #0x1
    beq .L_15c
    b .L_1ac
.L_140:
    bl func_ov002_021e2a4c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, pc}
.L_15c:
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, _LIT1
    and r2, r0, #0x1
    mul r3, r2, r1
    ldr r1, _LIT2
    ldr r1, [r1, r3]
    cmp r1, #0x0
    beq .L_190
    mov r1, #0x0
    bl func_ov002_021d792c
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_190:
    bl func_ov002_021e2b6c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, pc}
.L_1ac:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf098
