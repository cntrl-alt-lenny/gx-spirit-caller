; func_ov002_0222f348 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern func_ov002_021d71e0
        .extern func_ov002_021e104c
        .extern func_ov002_021e286c
        .global func_ov002_0222f348
        .arm
func_ov002_0222f348:
    stmdb sp!, {r4, lr}
    ldrh r2, [r0, #0x2]
    ldr r0, _LIT0
    ldr r1, [r0, #0x5a8]
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    sub r1, r1, #0x7d
    cmp r1, #0x3
    rsb r4, r2, #0x1
    addls pc, pc, r1, lsl #0x2
    b .L_dc
    b .L_c8
    b .L_a0
    b .L_44
    b .L_3c
.L_3c:
    mov r1, #0x0
    str r1, [r0, #0x5b0]
.L_44:
    ldr r0, _LIT1
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT2
    ldr r0, [r0, r2]
    cmp r0, #0x0
    beq .L_98
    ldr r0, _LIT3
    add r0, r0, r2
    ldr r0, [r0, #0x120]
    mov r2, #0x1
    mov r0, r0, lsl #0x12
    cmp r4, r0, lsr #0x1f
    ldrne r0, _LIT0
    movne r1, #0x1
    strne r1, [r0, #0x5b0]
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_021d71e0
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_98:
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_a0:
    mov r0, r4
    bl func_ov002_021e286c
    ldr r0, _LIT0
    ldr r0, [r0, #0x5b0]
    cmp r0, #0x0
    beq .L_c0
    rsb r0, r4, #0x1
    bl func_ov002_021e286c
.L_c0:
    mov r0, #0x7d
    ldmia sp!, {r4, pc}
.L_c8:
    mov r0, r4
    mov r1, #0x2
    bl func_ov002_021e104c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_dc:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf178
_LIT3: .word data_ov002_022cf16c
