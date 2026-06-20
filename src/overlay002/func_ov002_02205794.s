; func_ov002_02205794 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf178
        .extern func_ov002_021bb90c
        .extern func_ov002_021c3bdc
        .global func_ov002_02205794
        .arm
func_ov002_02205794:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x23
    beq .L_38
    mov r0, r0, lsl #0x1f
    ldr r1, _LIT0
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bb90c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_38:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r3, r0, #0x1
    and r3, r3, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    bl func_ov002_021c3bdc
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0000159d
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf178
