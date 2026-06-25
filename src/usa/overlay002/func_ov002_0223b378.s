; func_ov002_0223b378 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0223b2dc
        .global func_ov002_0223b378
        .arm
func_ov002_0223b378:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    cmp r0, r1
    beq .L_20
    ldr r1, _LIT1
    cmp r0, r1
    beq .L_28
    b .L_30
.L_20:
    mov r0, #0x5
    ldmia sp!, {r3, pc}
.L_28:
    mov r0, #0x4
    ldmia sp!, {r3, pc}
.L_30:
    bl func_ov002_0223b2dc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldrh r0, [r0, #0x6]
    cmp r0, #0x0
    movne r0, #0x3
    moveq r0, #0x2
    ldmia sp!, {r3, pc}
_LIT0: .word 0x0000157e
_LIT1: .word 0x000019ef
