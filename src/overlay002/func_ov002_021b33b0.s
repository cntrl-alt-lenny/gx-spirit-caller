; func_ov002_021b33b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a6
        .extern data_ov002_022d0650
        .global func_ov002_021b33b0
        .arm
func_ov002_021b33b0:
    stmdb sp!, {r3, r4, r5, lr}
    ldr ip, _LIT0
    mov lr, #0x14
    ldr r4, _LIT1
    and r5, r2, #0x1
    mul lr, r3, lr
    mla r2, r5, ip, r4
    ldrh r4, [lr, r2]
    cmp r4, #0x0
    beq .L_268
    ldr ip, _LIT2
.L_224:
    add r3, ip, r4, lsl #0x3
    ldrh r2, [r3, #0x2]
    ldrh r4, [r3, #0x6]
    mov r2, r2, lsl #0x1c
    mov r2, r2, lsr #0x1c
    cmp r2, #0xa
    bcc .L_260
    ldrh r2, [r3]
    mov r3, r2, asr #0x8
    and r2, r2, #0xff
    cmp r2, r0
    and r2, r3, #0xff
    cmpeq r2, r1
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
.L_260:
    cmp r4, #0x0
    bne .L_224
.L_268:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a6
_LIT2: .word data_ov002_022d0650
