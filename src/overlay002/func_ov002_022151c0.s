; func_ov002_022151c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf178
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_ov002_021c93f0
        .extern func_ov002_021d7b44
        .extern func_ov002_021e276c
        .extern func_ov002_0226af78
        .global func_ov002_022151c0
        .arm
func_ov002_022151c0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r0, [r5, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT0
    ldr r0, [r0, #0x5a8]
    cmp r0, #0x7f
    beq .L_1b4
    cmp r0, #0x80
    bne .L_260
    ldrh r0, [r5, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r1, #0x0
    bl func_ov002_0226af78
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_1b4:
    ldrh r2, [r5, #0x2]
    ldr r0, _LIT3
    mov r1, #0xb
    mov r2, r2, lsl #0x1f
    mov r3, r2, lsr #0x1f
    ldrh r2, [r0, #0xb0]
    rsb r0, r3, #0x1
    bl func_ov002_021c93f0
    ldrh r2, [r5, #0x2]
    ldr r1, _LIT4
    mov r4, r0
    mov r2, r2, lsl #0x1f
    ldr r1, [r1, #0xcec]
    mov r0, r2, lsr #0x1f
    cmp r1, r2, lsr #0x1f
    moveq r1, #0x1
    movne r1, #0x0
    add r2, r1, #0x6
    ldr r3, [r4]
    and r2, r2, #0xff
    mov r1, r3, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x4
    orr r2, r2, #0x1
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r3, lsr #0x1f
    mov r3, r1, lsl #0x10
    ldrh r1, [r5]
    rsb r0, r0, #0x1
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021e276c
    ldrh r0, [r5, #0x2]
    mov r1, r4
    mov r2, #0x81
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021d7b44
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_260:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf178
_LIT3: .word data_ov002_022d0e6c
_LIT4: .word data_ov002_022d016c
