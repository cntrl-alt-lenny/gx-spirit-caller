; func_ov002_021f19e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0cc
        .extern func_0202e1e0
        .extern func_02031084
        .extern func_ov002_021b9d20
        .extern func_ov002_021b9dec
        .global func_ov002_021f19e8
        .arm
func_ov002_021f19e8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r1
    mov r5, r2
    mov r0, r6
    mov r1, r5
    bl func_ov002_021b9dec
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r2, _LIT0
    and r3, r6, #0x1
    mul ip, r3, r2
    mov r1, #0x14
    mul r3, r5, r1
    ldr r2, _LIT1
    add r1, r2, ip
    ldrh r1, [r3, r1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, _LIT2
    add r1, r1, ip
    ldr r1, [r3, r1]
    mov r1, r1, lsr #0x6
    tst r1, #0x1
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_174
    cmp r5, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, pc}
.L_174:
    mov r0, r4
    bl func_0202e1e0
    cmp r0, #0x0
    bne .L_190
    cmp r5, #0x5
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, pc}
.L_190:
    mov r0, r6
    mov r1, r5
    bl func_ov002_021b9d20
    mov r5, r0
    mov r0, r4
    bl func_02031084
    cmp r5, r0
    movlt r0, #0x1
    movge r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c4
_LIT2: .word data_ov002_022cf0cc
