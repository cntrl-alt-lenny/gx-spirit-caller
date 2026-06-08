; func_ov002_021b3d2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0650
        .global func_ov002_021b3d2c
        .arm
func_ov002_021b3d2c:
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    mov lr, #0x0
    beq .L_114
    ldr r3, _LIT0
.L_e4:
    add ip, r3, r0, lsl #0x3
    ldrh r2, [ip, #0x2]
    ldrh r0, [ip, #0x6]
    mov r2, r2, lsl #0x1c
    mov r2, r2, lsr #0x1c
    cmp r2, #0x6
    bcs .L_10c
    ldrh r2, [ip]
    cmp r2, r1
    addeq lr, lr, #0x1
.L_10c:
    cmp r0, #0x0
    bne .L_e4
.L_114:
    mov r0, lr
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d0650
