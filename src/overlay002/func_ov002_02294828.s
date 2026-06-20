; func_ov002_02294828 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern func_0202b9b0
        .extern func_ov002_0227c678
        .extern func_ov002_022815a4
        .global func_ov002_02294828
        .arm
func_ov002_02294828:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldrh r0, [sl, #0x2]
    ldr r4, _LIT0
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r1, r3, r4
    ldr r2, [r2, r1]
    mov r7, #0x0
    cmp r2, #0x3
    movls r0, r7
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r6, r7
    cmp r2, #0x0
    bls .L_1e8
    ldr r5, _LIT2
    mov r9, r7
    mov fp, #0x1
.L_144:
    add r1, r5, r1
    add r1, r1, #0x120
    ldr r2, [r1, r9]
    ldrh r3, [sl, #0x4]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r8, r3, lsl #0x11
    mov r3, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    mov r8, r8, lsr #0x17
    add r1, r1, r3, lsr #0x1f
    cmp r8, r1
    beq .L_1bc
    mov r1, r2, lsl #0x13
    mov r8, r1, lsr #0x13
    mov r2, r8, lsl #0x10
    mov r1, fp
    mov r2, r2, lsr #0x10
    bl func_ov002_0227c678
    cmp r0, #0x0
    bne .L_1bc
    mov r0, r8
    bl func_0202b9b0
    cmp r0, #0x3
    blt .L_1bc
    mov r0, r8
    mov r1, #0x0
    bl func_ov002_022815a4
    cmp r0, #0x0
    addeq r7, r7, #0x1
.L_1bc:
    ldrh r0, [sl, #0x2]
    add r6, r6, #0x1
    add r9, r9, #0x4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mul r1, r2, r4
    add r2, r5, r1
    ldr r2, [r2, #0xc]
    cmp r6, r2
    bcc .L_144
.L_1e8:
    cmp r7, #0x2
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf178
_LIT2: .word data_ov002_022cf16c
