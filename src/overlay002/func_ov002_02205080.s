; func_ov002_02205080 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_0202e310
        .extern func_ov002_021b359c
        .extern func_ov002_021c84e0
        .global func_ov002_02205080
        .arm
func_ov002_02205080:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    cmp r1, #0x0
    beq .L_24
    ldrh r1, [r1]
    ldrh r0, [r8]
    cmp r1, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
.L_24:
    ldrh r1, [r8, #0x2]
    mov r0, r1, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x12
    bne .L_dc
    ldr r0, [r8, #0x14]
    cmp r0, #0x0
    beq .L_dc
    ldr r0, _LIT0
    mov r1, r1, lsl #0x1f
    ldr r4, [r0, #0x4]
    ldr r5, [r0, #0x20]
    cmp r4, r1, lsr #0x1f
    ldreq r0, [r0, #0x8]
    cmpeq r0, #0x0
    bne .L_dc
    ldr r1, _LIT1
    and r2, r4, #0x1
    mov r0, #0x14
    mul r7, r2, r1
    ldr r1, _LIT2
    mul r6, r5, r0
    add r0, r1, r7
    add r0, r0, r6
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e310
    cmp r0, #0x0
    beq .L_dc
    ldr r0, _LIT3
    add r0, r0, r7
    ldrh r0, [r6, r0]
    cmp r0, #0x0
    beq .L_dc
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c84e0
    cmp r0, #0x4
    bgt .L_dc
    ldr r1, _LIT4
    mov r0, r4
    bl func_ov002_021b359c
    cmp r0, #0x0
    moveq r0, #0x2
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
.L_dc:
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022cd3f4
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022cf1a4
_LIT4: .word 0x00001318
