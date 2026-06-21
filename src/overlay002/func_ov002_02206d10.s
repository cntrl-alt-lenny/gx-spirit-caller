; func_ov002_02206d10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bb90c
        .extern func_ov002_021ff3bc
        .global func_ov002_02206d10
        .arm
func_ov002_02206d10:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl func_ov002_021ff3bc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x23
    beq .L_84
    ldrh r2, [r5]
    ldr r1, _LIT0
    cmp r2, r1
    beq .L_58
    add r0, r1, #0xc8
    cmp r2, r0
    beq .L_60
    add r0, r1, #0xe8
    cmp r2, r0
    subeq r4, r1, #0x84
    b .L_64
.L_58:
    sub r4, r1, #0x37
    b .L_64
.L_60:
    sub r4, r1, #0x318
.L_64:
    ldrh r0, [r5, #0x2]
    mov r1, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bb90c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_84:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x000015b6
