; func_ov002_021f92d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021c23ac
        .extern func_ov002_021ded30
        .global func_ov002_021f92d0
        .arm
func_ov002_021f92d0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x5
    beq .L_bc
    ldr r0, _LIT0
    ldr fp, _LIT1
    mov r7, #0x1
    mov r8, #0x0
    mov r6, #0x5
    mov r9, #0x64
    sub r4, r0, #0x1
    sub r5, r0, #0x2
.L_3c:
    ldrh r0, [sl, #0x2]
    ldr r1, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r1, fp
    add r2, r1, r9
    ldrh r1, [r2, #0x38]
    cmp r1, #0x0
    beq .L_9c
    ldr r1, [r2, #0x30]
    mov r1, r1, lsl #0x13
    mov r2, r1, lsr #0x13
    cmp r2, r5
    cmpne r2, r4
    ldrne r1, _LIT0
    cmpne r2, r1
    bne .L_9c
    add r3, r6, r0, lsl #0x4
    mov r2, #0x1
    mov r1, r6
    orr r8, r8, r2, lsl r3
    bl func_ov002_021c23ac
    and r7, r7, r0
.L_9c:
    add r6, r6, #0x1
    cmp r6, #0xa
    add r9, r9, #0x14
    blt .L_3c
    mov r0, sl
    mov r1, r8
    bl func_ov002_021ded30
    strh r7, [sl, #0xc]
.L_bc:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x000017af
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
