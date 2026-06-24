; func_ov002_02230324 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021d71e0
        .extern func_ov002_021e104c
        .extern func_ov002_021e278c
        .extern func_ov002_021e286c
        .extern func_ov002_021e2d20
        .extern func_ov002_022107b4
        .extern func_ov002_0225368c
        .extern func_ov002_022592ec
        .extern func_ov002_022593f4
        .extern func_ov002_02290500
        .global func_ov002_02230324
        .arm
func_ov002_02230324:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    ldrh r3, [r6, #0x2]
    ldr r1, _LIT0
    mov r2, r3, lsl #0x11
    ldr r0, [r1, #0x5a8]
    mov r3, r3, lsl #0x1f
    sub r0, r0, #0x7c
    mov r2, r2, lsr #0x1f
    cmp r0, #0x4
    eor r4, r2, r3, lsr #0x1f
    addls pc, pc, r0, lsl #0x2
    b .L_18c
    b .L_168
    b .L_10c
    b .L_e4
    b .L_a4
    b .L_48
.L_48:
    ldr r0, _LIT1
    and r2, r4, #0x1
    mul r1, r2, r0
    ldr r0, _LIT2
    mov r5, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    bls .L_9c
    ldr r0, _LIT3
    add r7, r0, r1
.L_70:
    ldrh r1, [r6]
    mov r0, r4
    mov r2, r5
    bl func_ov002_0225368c
    cmp r0, #0x0
    movne r0, #0x7f
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r7, #0xc]
    add r5, r5, #0x1
    cmp r5, r0
    bcc .L_70
.L_9c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_a4:
    ldr r0, _LIT4
    ldr r0, [r0, r4, lsl #0x2]
    cmp r0, #0x1
    bne .L_c8
    ldrh r1, [r6]
    ldr r2, _LIT5
    mov r0, r4
    bl func_ov002_02290500
    b .L_dc
.L_c8:
    mov r0, r4
    mov r1, #0x1f
    bl func_ov002_021ae400
    ldr r0, _LIT5
    bl func_ov002_022592ec
.L_dc:
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_e4:
    bl func_ov002_022593f4
    cmp r0, #0x0
    moveq r0, #0x7f
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT6
    ldr r1, _LIT0
    ldr r2, [r0, #0xd78]
    mov r0, #0x7d
    str r2, [r1, #0x5ac]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_10c:
    ldr r3, _LIT3
    ldr r0, _LIT1
    and r2, r4, #0x1
    mla r0, r2, r0, r3
    ldr r5, [r1, #0x5ac]
    add r0, r0, #0x120
    ldr r2, [r0, r5, lsl #0x2]
    mov r0, r4
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r6, r1, r2, lsr #0x1f
    mov r1, r6
    bl func_ov002_021e278c
    mov r0, r4
    mov r1, r5
    mov r2, #0x1
    bl func_ov002_021d71e0
    and r0, r6, #0x1
    bl func_ov002_021e286c
    mov r0, #0x7c
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_168:
    mov r0, r4
    mov r1, #0x2
    mov r2, #0x0
    bl func_ov002_021e2d20
    mov r0, r4
    mov r1, #0x1
    bl func_ov002_021e104c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_18c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf178
_LIT3: .word data_ov002_022cf16c
_LIT4: .word data_ov002_022cd744
_LIT5: .word func_ov002_022107b4
_LIT6: .word data_ov002_022d016c
