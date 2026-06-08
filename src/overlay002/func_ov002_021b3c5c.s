; func_ov002_021b3c5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0650
        .global func_ov002_021b3c5c
        .arm
func_ov002_021b3c5c:
    stmdb sp!, {r4, lr}
    cmp r0, #0x0
    beq .L_48
    ldr lr, _LIT0
.L_10:
    add r4, lr, r0, lsl #0x3
    ldrh r3, [r4, #0x2]
    ldrh r0, [r4, #0x6]
    mov r3, r3, lsl #0x1c
    mov ip, r3, lsr #0x1c
    cmp ip, #0x6
    bcs .L_40
    ldrh r3, [r4]
    cmp r3, r1
    cmpeq ip, r2
    moveq r0, r4
    ldmeqia sp!, {r4, pc}
.L_40:
    cmp r0, #0x0
    bne .L_10
.L_48:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d0650
