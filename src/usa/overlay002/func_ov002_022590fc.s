; func_ov002_022590fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022d008c
        .extern func_ov002_021c9928
        .global func_ov002_022590fc
        .arm
func_ov002_022590fc:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    mov r5, r1
    bl func_ov002_021c9928
    cmp r0, #0x0
    beq .L_d68
    sub r0, r5, #0xc
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_d68
    b .L_d34
    b .L_d1c
    b .L_d60
    b .L_d60
.L_d1c:
    ldr r0, _LIT0
    ldr r0, [r0, #0xd04]
    cmp r0, #0x3
    bne .L_d68
    mov r0, #0x2
    ldmia sp!, {r3, r4, r5, pc}
.L_d34:
    ldr r0, _LIT0
    ldr r0, [r0, #0xd04]
    cmp r0, #0x3
    moveq r0, #0x2
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    cmp r4, r0
    bne .L_d68
    mov r0, #0x2
    ldmia sp!, {r3, r4, r5, pc}
.L_d60:
    mov r0, #0x2
    ldmia sp!, {r3, r4, r5, pc}
.L_d68:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022cd65c
