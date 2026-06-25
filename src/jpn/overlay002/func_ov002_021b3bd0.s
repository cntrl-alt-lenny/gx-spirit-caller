; func_ov002_021b3bd0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0570
        .global func_ov002_021b3bd0
        .arm
func_ov002_021b3bd0:
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    beq .L_70
    ldr ip, _LIT0
.L_10:
    add lr, ip, r0, lsl #0x3
    ldrh r3, [lr, #0x2]
    ldrh r0, [lr, #0x6]
    mov r3, r3, lsl #0x1c
    mov r3, r3, lsr #0x1c
    cmp r3, #0x1
    cmpne r3, #0x2
    bne .L_68
    ldrh r3, [lr]
    cmp r3, r1
    bne .L_68
    ldrh r3, [lr, #0x2]
    mov r3, r3, lsl #0x18
    movs r3, r3, lsr #0x1c
    bne .L_68
    cmp r2, #0x0
    blt .L_60
    ldrh r3, [lr, #0x4]
    cmp r2, r3
    bne .L_68
.L_60:
    mov r0, lr
    ldmia sp!, {r3, pc}
.L_68:
    cmp r0, #0x0
    bne .L_10
.L_70:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d0570
