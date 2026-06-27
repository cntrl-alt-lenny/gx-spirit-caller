; func_ov002_021b3ef8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c6
        .extern data_ov002_022d0570
        .global func_ov002_021b3ef8
        .arm
func_ov002_021b3ef8:
    stmdb sp!, {r3, r4, r5, lr}
    ldr ip, _LIT0
    mov lr, #0x14
    ldr r4, _LIT1
    and r5, r0, #0x1
    mul lr, r1, lr
    mla r0, r5, ip, r4
    ldrh r4, [lr, r0]
    cmp r4, #0x0
    beq .L_e4
    ldr r1, _LIT2
.L_a8:
    add ip, r1, r4, lsl #0x3
    ldrh r0, [ip, #0x2]
    ldrh r4, [ip, #0x6]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x6
    bcs .L_dc
    ldrh r0, [ip]
    cmp r0, r2
    ldreqh r0, [ip, #0x4]
    cmpeq r0, r3
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
.L_dc:
    cmp r4, #0x0
    bne .L_a8
.L_e4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c6
_LIT2: .word data_ov002_022d0570
