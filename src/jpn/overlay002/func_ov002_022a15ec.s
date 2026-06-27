; func_ov002_022a15ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_ov002_022d0e4c
        .extern func_02006160
        .extern func_02006178
        .extern func_ov002_022a1760
        .extern func_ov002_022a1780
        .global func_ov002_022a15ec
        .arm
func_ov002_022a15ec:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_022a1760
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT0
    ldr r0, [r0, #0xd4]
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    cmp r0, #0x0
    bne .L_78
    bl func_02006178
    cmp r0, #0x0
    bne .L_4c
    bl func_02006160
    cmp r0, #0x0
    beq .L_64
.L_4c:
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_022a1780
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_64:
    ldr r0, _LIT1
    ldrh r0, [r0, #0x52]
    tst r0, #0x300
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
.L_78:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d0e4c
_LIT1: .word data_02104acc
