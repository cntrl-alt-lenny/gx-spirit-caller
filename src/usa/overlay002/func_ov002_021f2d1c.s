; func_ov002_021f2d1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_ov002_021c8400
        .extern func_ov002_021f26c4
        .extern func_ov002_022579d0
        .global func_ov002_021f2d1c
        .arm
func_ov002_021f2d1c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldrh r3, [r6, #0xc]
    mov r5, r1
    mov r4, r2
    cmp r3, #0x0
    beq .L_b0
    cmp r4, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r5, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, _LIT0
    and r2, r5, #0x1
    mov r0, #0x14
    mul r3, r2, r1
    ldr r1, _LIT1
    mul r2, r4, r0
    add r0, r1, r3
    add r0, r0, r2
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_a8
    ldr r0, _LIT2
    add r0, r0, r3
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    beq .L_98
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c8400
    ldrh r1, [r6, #0xc]
    cmp r0, r1
    bge .L_a0
.L_98:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_a0:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_a8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_b0:
    bl func_ov002_021f26c4
    cmp r0, #0x0
    beq .L_f0
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c8400
    strh r0, [r6, #0xc]
    mov r0, r6
    rsb r1, r5, #0x1
    bl func_ov002_022579d0
    cmp r0, #0x0
    movgt r0, #0x1
    mov r1, #0x0
    movle r0, #0x0
    strh r1, [r6, #0xc]
    ldmia sp!, {r4, r5, r6, pc}
.L_f0:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
