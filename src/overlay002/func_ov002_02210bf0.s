; func_ov002_02210bf0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a4
        .extern func_0202df78
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bc288
        .extern func_ov002_021bc618
        .extern func_ov002_021bc8c8
        .global func_ov002_02210bf0
        .arm
func_ov002_02210bf0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldrh r0, [r6, #0x2]
    mov r5, r1
    mov r4, r2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r5
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b9ecc
    ldr r1, _LIT0
    bl func_0202df78
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0x2]
    mov r1, r5
    mov r2, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc8c8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r5, r0, lsr #0x1f
    mov r0, r0, lsr #0x1f
    beq .L_488
    ldr r1, _LIT1
    mov r2, #0x14
    ldr r3, _LIT2
    and ip, r5, #0x1
    mul r2, r4, r2
    mla r1, ip, r1, r3
    ldrh r1, [r2, r1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
.L_488:
    bl func_ov002_021bc618
    cmp r0, #0x0
    bne .L_4c4
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r5
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021bc288
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
.L_4c4:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000fc9
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a4
