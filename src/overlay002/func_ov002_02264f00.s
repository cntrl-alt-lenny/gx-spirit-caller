; func_ov002_02264f00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf282
        .extern data_ov002_022d0650
        .extern func_ov002_021b3ecc
        .extern func_ov002_021d479c
        .global func_ov002_02264f00
        .arm
func_ov002_02264f00:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r9, r1
    mov r8, r2
    mov r2, r9
    mov r1, #0xb
    mov sl, r0
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_1a4
    ldr r0, _LIT0
    and r1, sl, #0x1
    mul r2, r1, r0
    ldr r0, _LIT1
    ldrh r7, [r0, r2]
    cmp r7, #0x0
    beq .L_1a4
    mov r0, r9, lsl #0x10
    ldr r6, _LIT2
    mov r4, r0, lsr #0x10
    mov fp, #0x0
    mov r5, #0x8000
.L_140:
    add r1, r6, r7, lsl #0x3
    ldrh r0, [r1, #0x2]
    ldrh r7, [r1, #0x6]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x1
    ldreqh r0, [r1]
    cmpeq r0, r9
    bne .L_19c
    ldrh r1, [r1, #0x2]
    cmp sl, #0x0
    movne r0, r5
    moveq r0, fp
    mov r1, r1, lsl #0x18
    orr r0, r0, #0x3b
    sub r1, r8, r1, lsr #0x1d
    mov r3, r1, lsl #0x10
    mov r0, r0, lsl #0x10
    mov r1, r4
    mov r2, #0x1
    mov r0, r0, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d479c
.L_19c:
    cmp r7, #0x0
    bne .L_140
.L_1a4:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf282
_LIT2: .word data_ov002_022d0650
