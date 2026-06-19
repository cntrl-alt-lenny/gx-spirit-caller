; func_ov002_022a16fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern data_ov002_022d0f2c
        .extern func_0200617c
        .extern func_02006194
        .extern func_ov002_022a1870
        .extern func_ov002_022a1890
        .global func_ov002_022a16fc
        .arm
func_ov002_022a16fc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_022a1870
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
    bl func_02006194
    cmp r0, #0x0
    bne .L_4c
    bl func_0200617c
    cmp r0, #0x0
    beq .L_64
.L_4c:
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_022a1890
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
_LIT0: .word data_ov002_022d0f2c
_LIT1: .word data_02104bac
