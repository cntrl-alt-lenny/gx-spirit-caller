; func_ov002_02242450 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021d8770
        .extern func_ov002_0223dad0
        .extern func_ov002_022423dc
        .extern func_ov002_022593a8
        .extern func_ov002_022593f4
        .extern func_ov002_0229cf10
        .global func_ov002_02242450
        .arm
func_ov002_02242450:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x100
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5b8]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_108
    b .L_30
    b .L_88
    b .L_54
    b .L_88
.L_30:
    add r0, sp, #0x0
    mov r1, #0x9b
    mov r2, #0x2
    bl func_ov002_0229cf10
    ldrh r0, [r4, #0x2]
    add r1, sp, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
.L_54:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022593a8
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, r5, r6, pc}
.L_88:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_ec
    ldr r0, _LIT2
    ldr r2, [r0, #0xd74]
    ldr r1, [r0, #0xd78]
    ldr r5, [r0, #0xd70]
    add r6, r2, r1
    mov r0, r5
    mov r1, r6
    bl func_ov002_021d8770
    and r1, r5, #0xff
    and r0, r6, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r1, r0, lsl #0x10
    mov r0, r4
    mov r1, r1, lsr #0x10
    bl func_ov002_0223dad0
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, r5, r6, pc}
.L_ec:
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    sub r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, r5, r6, pc}
.L_108:
    mov r0, #0x1
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word func_ov002_022423dc
_LIT2: .word data_ov002_022d016c
