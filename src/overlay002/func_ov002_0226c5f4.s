; func_ov002_0226c5f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_ov002_021c1a2c
        .extern func_ov002_021c1d28
        .global func_ov002_0226c5f4
        .arm
func_ov002_0226c5f4:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r3, _LIT0
    mov r5, r0
    ldr r3, [r3, #0xd94]
    add r4, r1, r2
    cmp r5, r3
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    cmp r4, #0x4
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT1
    ldr r2, _LIT2
    and r3, r5, #0x1
    mla r2, r3, r1, r2
    mov r1, #0x14
    mla r1, r4, r1, r2
    ldr r1, [r1, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r2, _LIT3
    mov r1, r4
    bl func_ov002_021c1a2c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT4
    mov r1, r4
    ldrh r0, [r0, #0xa2]
    cmp r5, r0
    movne r2, #0x1
    moveq r2, #0x0
    mov r0, r5
    bl func_ov002_021c1d28
    cmp r0, #0x0
    movne r0, #0x0
    moveq r0, #0x800
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x0000142a
_LIT4: .word data_ov002_022d0e6c
