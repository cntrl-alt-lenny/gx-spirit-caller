; func_ov002_022074b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0a8
        .extern func_ov002_021bb83c
        .global func_ov002_022074b4
        .arm
func_ov002_022074b4:
    stmdb sp!, {r3, lr}
    ldrh r2, [r0, #0x2]
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r3, r2, lsl #0x1f
    mov r3, r3, lsr #0x1f
    and r3, r3, #0x1
    mul r0, r3, r0
    ldr r0, [r1, r0]
    cmp r0, #0x2
    movcc r0, #0x0
    ldmccia sp!, {r3, pc}
    mov r0, r2, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x23
    beq .L_70
    ldr r0, _LIT2
    bl func_ov002_021bb83c
    cmp r0, #0x0
    bne .L_60
    ldr r0, _LIT3
    bl func_ov002_021bb83c
    cmp r0, #0x0
    beq .L_68
.L_60:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_68:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_70:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0a8
_LIT2: .word 0x000016cb
_LIT3: .word 0x000016e4
