; func_ov002_021b3f5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a6
        .extern data_ov002_022d0650
        .global func_ov002_021b3f5c
        .arm
func_ov002_021b3f5c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr ip, _LIT0
    mov lr, #0x14
    ldr r4, _LIT1
    and r5, r0, #0x1
    mul lr, r1, lr
    mla r0, r5, ip, r4
    ldrh r0, [lr, r0]
    cmp r0, #0x0
    beq .L_68
    ldr ip, _LIT2
.L_2c:
    add lr, ip, r0, lsl #0x3
    ldrh r1, [lr, #0x2]
    ldrh r4, [lr, #0x6]
    mov r1, r1, lsl #0x1c
    mov r1, r1, lsr #0x1c
    cmp r1, #0x6
    bcs .L_5c
    ldrh r1, [lr]
    cmp r1, r2
    ldreqh r1, [lr, #0x4]
    cmpeq r1, r3
    ldmeqia sp!, {r3, r4, r5, pc}
.L_5c:
    mov r0, r4
    cmp r4, #0x0
    bne .L_2c
.L_68:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a6
_LIT2: .word data_ov002_022d0650
