; func_ov002_022713a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bc288
        .extern func_ov002_021bc618
        .extern func_ov002_021bc72c
        .extern func_ov002_021bc8c8
        .global func_ov002_022713a8
        .arm
func_ov002_022713a8:
    stmdb sp!, {r3, r4, r5, lr}
    add r4, r1, r2
    mov r5, r0
    cmp r4, #0x4
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT0
    ldrh r1, [r0, #0x16]
    ldr r0, [r0]
    mov r1, r1, lsl #0x1e
    movs r1, r1, lsr #0x1f
    mov r1, r5
    beq .L_54
    mov r0, r0, lsl #0x1f
    mov r2, r4
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc8c8
    cmp r0, #0x0
    bne .L_70
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_54:
    mov r0, r0, lsl #0x1f
    mov r2, r4
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc72c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_70:
    ldr r1, _LIT0
    ldrb ip, [r1, #0x8]
    cmp ip, #0x0
    bne .L_b0
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b9ecc
    ldr r1, _LIT1
    cmp r0, r1
    addne r1, r1, #0x2
    cmpne r0, r1
    bne .L_a8
    mov r0, #0x800
    ldmia sp!, {r3, r4, r5, pc}
.L_a8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_b0:
    cmp ip, #0x0
    mov r3, #0x0
    ble .L_f0
    and r2, r5, #0xff
    and r0, r4, #0xff
    orr r0, r2, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
.L_d0:
    add r0, r1, r3, lsl #0x1
    ldrh r0, [r0, #0x10]
    cmp r2, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    add r3, r3, #0x1
    cmp r3, ip
    blt .L_d0
.L_f0:
    ldr r0, _LIT0
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
    cmp r0, #0x0
    bne .L_16c
    ldr r0, _LIT0
    ldrh r2, [r0, #0x10]
    ldr r1, [r0]
    and r0, r2, #0xff
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    bne .L_13c
    mov r1, r2, asr #0x8
    and r1, r1, #0xff
    bl func_ov002_021bc288
    cmp r0, #0x0
    bne .L_16c
.L_13c:
    ldr r0, _LIT0
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    cmp r5, r0, lsr #0x1f
    bne .L_164
    mov r0, r5
    mov r1, r4
    bl func_ov002_021bc288
    cmp r0, #0x0
    bne .L_16c
.L_164:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_16c:
    mov r0, #0x800
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd300
_LIT1: .word 0x000013e5
