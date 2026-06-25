; func_ov002_021b2d24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d0570
        .global func_ov002_021b2d24
        .arm
func_ov002_021b2d24:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r2, r0, asr #0x8
    and r3, r0, #0xff
    and ip, r2, #0xff
    mov r4, #0x0
.L_620:
    ldr r5, _LIT0
    ldr r0, _LIT1
    and r2, r4, #0x1
    mla r7, r2, r0, r5
    ldr r0, _LIT2
    add r6, r7, #0x30
    mov r5, #0x0
.L_63c:
    ldr r2, [r6]
    mov r2, r2, lsl #0x13
    movs r2, r2, lsr #0x13
    ldrneh lr, [r7, #0x3a]
    cmpne lr, #0x0
    beq .L_694
.L_654:
    add r2, r0, lr, lsl #0x3
    ldrh r8, [r2, #0x2]
    ldrh lr, [r2, #0x6]
    mov r8, r8, lsl #0x1c
    mov r8, r8, lsr #0x1c
    cmp r8, #0x6
    bcc .L_68c
    ldrh r8, [r2]
    mov r9, r8, asr #0x8
    and r8, r8, #0xff
    cmp r8, r3
    and r8, r9, #0xff
    cmpeq r8, ip
    streqh r1, [r2]
.L_68c:
    cmp lr, #0x0
    bne .L_654
.L_694:
    add r5, r5, #0x1
    cmp r5, #0xa
    add r6, r6, #0x14
    add r7, r7, #0x14
    ble .L_63c
    add r4, r4, #0x1
    cmp r4, #0x2
    blt .L_620
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022d0570
