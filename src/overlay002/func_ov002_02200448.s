; func_ov002_02200448 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf178
        .extern data_ov002_022cf17c
        .extern func_ov002_021ff2c8
        .global func_ov002_02200448
        .arm
func_ov002_02200448:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021ff2c8
    ldrh r3, [r4, #0x2]
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r3, r3, lsl #0x1f
    mov lr, r3, lsr #0x1f
    and r3, lr, #0x1
    mul ip, r3, r1
    ldr r2, [r2, ip]
    cmp r2, r0
    movcc r0, #0x0
    ldmccia sp!, {r4, pc}
    cmp r0, #0x0
    bne .L_6c
    rsb r0, lr, #0x1
    and r0, r0, #0x1
    mul r1, r0, r1
    ldr r0, _LIT2
    ldr r0, [r0, r1]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_6c:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf17c
_LIT2: .word data_ov002_022cf178
