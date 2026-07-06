; func_ov002_02203f94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021bbb78
        .extern func_ov002_021ca5b8
        .extern func_ov002_02253600
        .global func_ov002_02203f94
        .arm
func_ov002_02203f94:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r1, #0x3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbb78
    cmp r0, #0x0
    beq .L_c4
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x1f4
    ble .L_c4
    rsb r1, r0, #0x1
    bl func_ov002_021ca5b8
    cmp r0, #0x0
    beq .L_80
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02253600
    cmp r0, #0x0
    movne r0, #0x2
    ldmneia sp!, {r4, pc}
.L_80:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r0
    bl func_ov002_021ca5b8
    cmp r0, #0x0
    beq .L_c4
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_02253600
    cmp r0, #0x0
    movne r0, #0x2
    ldmneia sp!, {r4, pc}
.L_c4:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
