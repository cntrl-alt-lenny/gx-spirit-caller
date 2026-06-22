; func_ov002_02212e9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf178
        .extern func_ov002_021d7970
        .extern func_ov002_021e104c
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .global func_ov002_02212e9c
        .arm
func_ov002_02212e9c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT0
    ldr r0, [r0, #0x5a8]
    sub r0, r0, #0x7d
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_10c
    b .L_e8
    b .L_c8
    b .L_84
    b .L_44
.L_44:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    moveq r0, #0x7f
    ldmeqia sp!, {r4, pc}
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_021d7970
    mov r0, #0x80
    ldmia sp!, {r4, pc}
.L_84:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    moveq r0, #0x7e
    ldmeqia sp!, {r4, pc}
    mov r1, #0x0
    mov r2, #0x1
    bl func_ov002_021d7970
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_c8:
    bl func_ov002_021e2b3c
    ldrh r0, [r4, #0x2]
    mov r1, #0x5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e104c
    mov r0, #0x7d
    ldmia sp!, {r4, pc}
.L_e8:
    ldrh r0, [r4, #0x2]
    mov r1, #0x5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e104c
    bl func_ov002_021e2c5c
    mov r0, #0x7c
    ldmia sp!, {r4, pc}
.L_10c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf178
