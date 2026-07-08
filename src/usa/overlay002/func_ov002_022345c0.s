; func_ov002_022345c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern func_ov002_021b98d4
        .extern func_ov002_021d7178
        .extern func_ov002_021e0f5c
        .extern func_ov002_021e277c
        .extern func_ov002_0223de04
        .global func_ov002_022345c0
        .arm
func_ov002_022345c0:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    mov r5, r0
    ldr r1, [r1, #0x5a8]
    sub r1, r1, #0x7d
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_178
    b .L_15c
    b .L_144
    b .L_90
    b .L_30
.L_30:
    ldrh r0, [r5, #0x6]
    mov r4, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_88
.L_48:
    mov r0, r5
    mov r1, r4
    bl func_ov002_0223de04
    ldrh r2, [r5, #0x2]
    mov r1, r0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b98d4
    cmp r0, #0x0
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5, #0x6]
    add r4, r4, #0x1
    mov r0, r0, lsl #0x10
    cmp r4, r0, lsr #0x18
    blt .L_48
.L_88:
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_90:
    ldrh r1, [r5, #0x6]
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x18
    beq .L_13c
    sub r1, r1, #0x1
    bl func_ov002_0223de04
    ldrh r2, [r5, #0x2]
    mov r1, r0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b98d4
    movs r4, r0
    bmi .L_108
    ldrh r0, [r5, #0x2]
    ldr r3, _LIT1
    ldr r1, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x18
    add r1, r1, #0x400
    ldr r3, [r1, r4, lsl #0x2]
    mov r2, #0x1
    mov r1, r3, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r3, lsr #0x1f
    bl func_ov002_021d7178
.L_108:
    ldrh r2, [r5, #0x6]
    mov r0, #0x7f
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x18
    add r1, r1, #0xff
    add r1, r1, #0xff00
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r2, r2, #0xff00
    mov r1, r1, lsl #0x18
    orr r1, r2, r1, lsr #0x10
    strh r1, [r5, #0x6]
    ldmia sp!, {r3, r4, r5, pc}
.L_13c:
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, pc}
.L_144:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e277c
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, pc}
.L_15c:
    ldrh r0, [r5, #0x2]
    mov r1, #0x2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e0f5c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_178:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
