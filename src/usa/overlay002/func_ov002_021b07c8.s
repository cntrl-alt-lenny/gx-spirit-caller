; func_ov002_021b07c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ca898
        .extern data_ov002_022d008c
        .extern func_ov002_021b3dec
        .extern func_ov002_022662e4
        .global func_ov002_021b07c8
        .arm
func_ov002_021b07c8:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r2, _LIT1
    ldr r0, [r0, #0xcec]
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_30
    bl func_ov002_022662e4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
.L_30:
    ldr r0, _LIT0
    ldr r1, _LIT2
    ldr r0, [r0, #0xd1c]
    ldr r0, [r1, r0, lsl #0x2]
    cmp r0, #0x0
    beq .L_74
    blx r0
    cmp r0, #0x0
    beq .L_6c
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0xd20]
    ldr r1, [r0, #0xd1c]
    add r1, r1, #0x1
    str r1, [r0, #0xd1c]
.L_6c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_74:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x0000151e
_LIT2: .word data_ov002_022ca898
