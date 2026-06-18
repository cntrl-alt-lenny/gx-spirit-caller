; func_ov002_02294bb4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_0202b8f0
        .extern func_ov002_021afb74
        .extern func_ov002_022806a4
        .extern func_ov002_022812ac
        .global func_ov002_02294bb4
        .arm
func_ov002_02294bb4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldrh r0, [r5, #0x2]
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0xfa0
    movgt r0, #0x0
    ldmgtia sp!, {r4, r5, r6, pc}
    ldrh r1, [r5]
    mov r2, #0x0
    bl func_ov002_022806a4
    cmp r0, #0x0
    blt .L_ac
    bl func_ov002_021afb74
    ldrh r1, [r5, #0x2]
    ldr r0, [r0]
    mov r0, r0, lsl #0x13
    mov r1, r1, lsl #0x1f
    mov r0, r0, lsr #0x13
    mov r6, r1, lsr #0x1f
    bl func_0202b8f0
    mov r4, r0
    mov r0, r6
    mov r1, r6
    bl func_ov002_022812ac
    ldrh r3, [r5, #0x2]
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r3, r3, lsl #0x1f
    mov r3, r3, lsr #0x1f
    rsb r3, r3, #0x1
    and r3, r3, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    add r0, r4, r0
    cmp r0, r1
    movge r0, #0x1
    ldmgeia sp!, {r4, r5, r6, pc}
.L_ac:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
