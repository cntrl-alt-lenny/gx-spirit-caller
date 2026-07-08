; func_ov002_02212f74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern func_ov002_021b3dec
        .extern func_ov002_021b4040
        .extern func_ov002_021b99c8
        .extern func_ov002_021d5b60
        .extern func_ov002_021d7880
        .extern func_ov002_021e05f4
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .global func_ov002_02212f74
        .arm
func_ov002_02212f74:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    mov r5, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x7e
    beq .L_80
    cmp r0, #0x7f
    beq .L_4c
    cmp r0, #0x80
    bne .L_118
    ldrh r0, [r5, #0x2]
    ldrh r2, [r5]
    mov r1, #0x3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e05f4
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_4c:
    ldrh r0, [r5, #0x2]
    ldrh r2, [r5]
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021b3dec
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_ov002_021e2a4c
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, pc}
.L_80:
    ldrh r0, [r5, #0x2]
    ldrh r2, [r5]
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021b4040
    ldrh r2, [r5, #0x2]
    mov r4, r0
    mov r1, r4
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021b99c8
    mov r1, r0
    cmp r4, #0x0
    ble .L_10c
    cmp r1, #0x0
    blt .L_10c
    ldrh r0, [r5, #0x2]
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021d7880
    ldrh r0, [r5, #0x2]
    ldrh r2, [r5]
    mov r3, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    mov r1, #0xb
    bl func_ov002_021d5b60
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, pc}
.L_10c:
    bl func_ov002_021e2b6c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_118:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
