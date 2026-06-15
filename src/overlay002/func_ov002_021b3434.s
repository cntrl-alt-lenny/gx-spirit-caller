; func_ov002_021b3434 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a6
        .extern data_ov002_022d0650
        .global func_ov002_021b3434
        .arm
func_ov002_021b3434:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr ip, _LIT0
    mov lr, #0x14
    ldr r5, _LIT1
    and r6, r2, #0x1
    mul r4, r3, lr
    mla r2, r6, ip, r5
    ldrh lr, [r4, r2]
    cmp lr, #0x0
    beq .L_328
    mov r3, #0x1
    ldr ip, _LIT2
    mov r2, #0x0
    mov r6, r3
.L_2b4:
    add r5, ip, lr, lsl #0x3
    ldrh r4, [r5, #0x2]
    ldrh lr, [r5, #0x6]
    mov r4, r4, lsl #0x1c
    mov r4, r4, lsr #0x1c
    cmp r4, #0xa
    movcs r7, r3
    movcc r7, r2
    cmp r4, #0x6
    cmpne r4, #0x7
    bne .L_2f8
    ldrh r4, [r5, #0x2]
    mov r4, r4, lsl #0x18
    mov r4, r4, lsr #0x1c
    and r4, r4, #0x1
    cmp r4, #0x0
    movgt r7, r6
.L_2f8:
    cmp r7, #0x0
    beq .L_320
    ldrh r4, [r5]
    mov r5, r4, asr #0x8
    and r4, r4, #0xff
    cmp r4, r0
    and r4, r5, #0xff
    cmpeq r4, r1
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
.L_320:
    cmp lr, #0x0
    bne .L_2b4
.L_328:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a6
_LIT2: .word data_ov002_022d0650
