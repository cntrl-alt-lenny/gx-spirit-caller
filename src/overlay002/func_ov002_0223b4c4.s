; func_ov002_0223b4c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0223b3cc
        .global func_ov002_0223b4c4
        .arm
func_ov002_0223b4c4:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    mov r4, r1
    cmp r0, r2
    beq .L_24
    ldr r1, _LIT1
    cmp r0, r1
    beq .L_2c
    b .L_68
.L_24:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_2c:
    cmp r4, #0x3
    addls pc, pc, r4, lsl #0x2
    b .L_68
    b .L_48
    b .L_50
    b .L_58
    b .L_60
.L_48:
    add r0, r2, #0x328
    ldmia sp!, {r4, pc}
.L_50:
    sub r0, r1, #0x148
    ldmia sp!, {r4, pc}
.L_58:
    ldr r0, _LIT2
    ldmia sp!, {r4, pc}
.L_60:
    sub r0, r1, #0xf6
    ldmia sp!, {r4, pc}
.L_68:
    bl func_ov002_0223b3cc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    cmp r4, #0x0
    beq .L_94
    cmp r4, #0x1
    beq .L_9c
    cmp r4, #0x2
    beq .L_a4
    b .L_ac
.L_94:
    ldrh r0, [r0, #0x2]
    ldmia sp!, {r4, pc}
.L_9c:
    ldrh r0, [r0, #0x4]
    ldmia sp!, {r4, pc}
.L_a4:
    ldrh r0, [r0, #0x6]
    ldmia sp!, {r4, pc}
.L_ac:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0000157e
_LIT1: .word 0x000019ef
_LIT2: .word 0x000018a8
