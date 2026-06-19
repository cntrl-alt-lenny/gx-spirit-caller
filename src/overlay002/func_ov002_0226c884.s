; func_ov002_0226c884 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_ov002_021c1e20
        .global func_ov002_0226c884
        .arm
func_ov002_0226c884:
    stmdb sp!, {r3, lr}
    ldr r3, _LIT0
    ldr r3, [r3, #0xd94]
    cmp r0, r3
    bne .L_14c
    add r1, r1, r2
    cmp r1, #0xa
    bgt .L_14c
    ldr r2, _LIT1
    ldr r3, _LIT2
    and ip, r0, #0x1
    mla r3, ip, r2, r3
    mov r2, #0x14
    mla r2, r1, r2, r3
    ldr r2, [r2, #0x30]
    mov r2, r2, lsl #0x13
    movs r2, r2, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r2, _LIT3
    and ip, r0, #0xff
    and r3, r1, #0xff
    orr r3, ip, r3, lsl #0x8
    ldrh ip, [r2, #0xa2]
    mov r2, r3, lsl #0x10
    cmp ip, r2, lsr #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    and r2, ip, #0xff
    cmp r0, r2
    movne r2, #0x1
    moveq r2, #0x0
    bl func_ov002_021c1e20
    cmp r0, #0x0
    movne r0, #0x0
    moveq r0, #0x800
    ldmia sp!, {r3, pc}
.L_14c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022d0e6c
