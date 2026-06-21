; func_ov002_021b3240 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a6
        .extern data_ov002_022d0650
        .extern func_ov002_021b9ecc
        .global func_ov002_021b3240
        .arm
func_ov002_021b3240:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr fp, _LIT0
    mov r4, #0x14
    ldr r5, _LIT1
    and r6, r0, #0x1
    mul r4, r1, r4
    mla r0, r6, fp, r5
    ldrh r5, [r4, r0]
    mov sl, r2
    mov r9, r3
    cmp r5, #0x0
    mov r6, #0x0
    beq .L_bc
    ldr r4, _LIT2
.L_38:
    add r2, r4, r5, lsl #0x3
    ldrh r0, [r2, #0x2]
    mov r1, r5, lsl #0x3
    ldrh r1, [r4, r1]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x6
    ldrh r5, [r2, #0x6]
    bcc .L_b4
    cmp r0, #0xb
    bhi .L_b4
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r7, r1, #0xff
    and r8, r0, #0xff
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b9ecc
    cmp r9, r7
    bne .L_b4
    ldr r1, _LIT3
    and r3, r7, #0x1
    mla r2, r3, fp, r1
    mov r1, #0x14
    mla r1, r8, r1, r2
    ldr r1, [r1, #0x40]
    mov r1, r1, lsr #0x6
    tst r1, #0x1
    cmpeq r0, sl
    addeq r6, r6, #0x1
.L_b4:
    cmp r5, #0x0
    bne .L_38
.L_bc:
    mov r0, r6
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a6
_LIT2: .word data_ov002_022d0650
_LIT3: .word data_ov002_022cf16c
