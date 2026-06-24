; func_ov002_0222d464 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_ov002_021b9b64
        .extern func_ov002_021d8288
        .extern func_ov002_021e286c
        .extern func_ov002_0225368c
        .extern func_ov002_0226b054
        .extern func_ov002_0226b194
        .global func_ov002_0222d464
        .arm
func_ov002_0222d464:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r5, r0
    ldr r3, [r1, #0x5a8]
    ldr r0, [r2, #0xcec]
    ldr r2, [r1, #0x5ac]
    cmp r3, #0x6e
    eor r4, r0, r2
    bgt .L_34
    cmp r3, #0x6e
    beq .L_144
    b .L_160
.L_34:
    sub r0, r3, #0x77
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_160
    b .L_104
    b .L_e0
    b .L_d0
    b .L_160
    b .L_160
    b .L_160
    b .L_160
    b .L_b8
    b .L_84
    b .L_6c
.L_6c:
    mov r0, #0x0
    str r0, [r1, #0x5ac]
    strh r0, [r5, #0x8]
    strh r0, [r5, #0xa]
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_84:
    ldrh r1, [r5]
    mov r0, r4
    mov r2, #0x0
    bl func_ov002_0225368c
    cmp r0, #0x0
    moveq r0, #0x79
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r1, [r5]
    mov r0, r4
    mov r2, #0x0
    bl func_ov002_0226b194
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, pc}
.L_b8:
    ldr r0, _LIT2
    add r1, r5, r4, lsl #0x1
    ldrh r2, [r0, #0xb2]
    mov r0, #0x78
    strh r2, [r1, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_d0:
    rsb r0, r4, #0x1
    bl func_ov002_0226b054
    mov r0, #0x78
    ldmia sp!, {r3, r4, r5, pc}
.L_e0:
    add r0, r2, #0x1
    str r0, [r1, #0x5ac]
    cmp r0, #0x2
    movlt r0, #0x7f
    ldmltia sp!, {r3, r4, r5, pc}
    mov r0, #0x0
    str r0, [r1, #0x5ac]
    mov r0, #0x77
    ldmia sp!, {r3, r4, r5, pc}
.L_104:
    add r0, r5, r4, lsl #0x1
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_124
    bl func_ov002_021b9b64
    mov r1, r0
    mov r0, r4
    bl func_ov002_021d8288
.L_124:
    ldr r0, _LIT0
    ldr r1, [r0, #0x5ac]
    add r1, r1, #0x1
    str r1, [r0, #0x5ac]
    cmp r1, #0x2
    movlt r0, #0x77
    movge r0, #0x6e
    ldmia sp!, {r3, r4, r5, pc}
.L_144:
    bl func_ov002_021e286c
    ldr r0, _LIT1
    ldr r0, [r0, #0xcec]
    rsb r0, r0, #0x1
    bl func_ov002_021e286c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_160:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d016c
_LIT2: .word data_ov002_022d0e6c
