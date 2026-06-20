; func_ov002_0220c160 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf17c
        .extern func_0202f050
        .extern func_ov002_021bc000
        .extern func_ov002_021ff354
        .global func_ov002_0220c160
        .arm
func_ov002_0220c160:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r4, r1
    mov r1, r0, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x23
    beq .L_e4
    mov r0, r0, lsl #0x1f
    ldr r1, _LIT0
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc000
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_e4:
    ldrh r2, [r5, #0x2]
    ldr r0, _LIT1
    ldr r1, _LIT2
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021ff354
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word func_0202f050
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf17c
