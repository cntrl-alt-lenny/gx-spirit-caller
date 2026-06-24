; func_ov002_02207818 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern func_0202b878
        .extern func_ov002_021b99b4
        .extern func_ov002_021c23ac
        .extern func_ov002_021c8940
        .extern func_ov002_021ca2b8
        .extern func_ov002_021ca5bc
        .global func_ov002_02207818
        .arm
func_ov002_02207818:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r7, r0
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r1, [r7, #0x2]
    ldrh r0, [r7, #0x4]
    mov r2, r1, lsl #0x1f
    mov r1, r0, lsl #0x11
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x17
    bl func_ov002_021b99b4
    cmp r0, #0x0
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r4, #0x0
.L_50:
    ldrh r0, [r7, #0x2]
    mov r1, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c23ac
    cmp r0, #0x0
    beq .L_98
    ldrh r0, [r7, #0x2]
    mov r1, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c8940
    cmp r0, #0xb
    cmpne r0, #0xc
    cmpne r0, #0x10
    bne .L_98
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_98:
    add r4, r4, #0x1
    cmp r4, #0x4
    ble .L_50
    ldrh r1, [r7, #0x2]
    ldr r8, _LIT0
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    and r1, r1, #0x1
    mul r2, r1, r8
    ldr r0, [r0, r2]
    mov r6, #0x0
    cmp r0, #0x0
    bls .L_158
    ldr r4, _LIT2
    mov r5, r6
.L_d8:
    add r0, r4, r2
    add r0, r0, #0x120
    ldr r2, [r0, r5]
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    mov r2, r2, lsl #0x13
    add r0, r0, r1, lsr #0x1f
    mov r9, r2, lsr #0x13
    bl func_ov002_021ca5bc
    cmp r0, #0x0
    beq .L_12c
    mov r0, r9
    bl func_0202b878
    cmp r0, #0xb
    cmpne r0, #0xc
    cmpne r0, #0x10
    bne .L_12c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_12c:
    ldrh r0, [r7, #0x2]
    add r6, r6, #0x1
    add r5, r5, #0x4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r0, r0, #0x1
    mul r2, r0, r8
    add r0, r4, r2
    ldr r0, [r0, #0xc]
    cmp r6, r0
    bcc .L_d8
.L_158:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf178
_LIT2: .word data_ov002_022cf16c
