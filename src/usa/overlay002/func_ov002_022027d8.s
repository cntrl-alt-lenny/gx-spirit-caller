; func_ov002_022027d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern func_0202e1e0
        .extern func_ov002_021ca360
        .extern func_ov002_021ff2cc
        .global func_ov002_022027d8
        .arm
func_ov002_022027d8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r6, #0x0
    mov sl, r0
    mov r7, r6
    bl func_ov002_021ff2cc
    cmp r0, #0x0
    moveq r0, r6
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [sl, #0x2]
    ldr fp, _LIT0
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mul r0, r2, fp
    ldr r1, [r1, r0]
    mov r5, r6
    cmp r1, #0x0
    bls .L_f0
    ldr r4, _LIT2
    mov r9, r5
.L_54:
    add r0, r4, r0
    add r0, r0, #0x120
    ldr r1, [r0, r9]
    ldrh r2, [sl, #0x4]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r3, r2, lsl #0x11
    mov r2, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    mov r3, r3, lsr #0x17
    add r0, r0, r2, lsr #0x1f
    cmp r3, r0
    beq .L_c4
    mov r0, r1, lsl #0x13
    mov r8, r0, lsr #0x13
    mov r0, r8
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_c0
    ldrh r0, [sl, #0x2]
    mov r1, r8
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca360
    cmp r0, #0x0
    addne r7, r7, #0x1
    b .L_c4
.L_c0:
    add r6, r6, #0x1
.L_c4:
    ldrh r0, [sl, #0x2]
    add r5, r5, #0x1
    add r9, r9, #0x4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r1, r0, #0x1
    mul r0, r1, fp
    add r1, r4, r0
    ldr r1, [r1, #0xc]
    cmp r5, r1
    bcc .L_54
.L_f0:
    cmp r7, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r6, #0x2
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf098
_LIT2: .word data_ov002_022cf08c
