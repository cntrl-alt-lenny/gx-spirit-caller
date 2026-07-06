; func_ov002_021b35dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022d0570
        .global func_ov002_021b35dc
        .arm
func_ov002_021b35dc:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r5, _LIT0
    ldr ip, _LIT1
    mov lr, #0x0
.L_10:
    ldrh r4, [r5, #0xce]
    cmp r4, #0x0
    beq .L_94
.L_1c:
    add r3, ip, r4, lsl #0x3
    ldrh r2, [r3, #0x2]
    ldrh r4, [r3, #0x6]
    mov r2, r2, lsl #0x1c
    mov r2, r2, lsr #0x1c
    cmp r2, #0x6
    bcc .L_8c
    ldrh r2, [r3]
    mov r3, r2, asr #0x8
    and r2, r2, #0xff
    cmp r2, r0
    and r2, r3, #0xff
    cmpeq r2, r1
    bne .L_8c
    cmp lr, #0x0
    ldrne r0, _LIT0
    ldrne r1, [r0, #0x4]
    ldrne r0, [r0, #0x20]
    bne .L_74
    ldr r0, _LIT0
    ldr r1, [r0]
    ldr r0, [r0, #0x1c]
.L_74:
    and r1, r1, #0xff
    and r0, r0, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_8c:
    cmp r4, #0x0
    bne .L_1c
.L_94:
    add lr, lr, #0x1
    cmp lr, #0x2
    add r5, r5, #0x14
    blt .L_10
    ldr r0, _LIT2
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd314
_LIT1: .word data_ov002_022d0570
_LIT2: .word 0x0000ffff
