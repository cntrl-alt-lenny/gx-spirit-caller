; func_ov002_022967f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022cf1a8
        .extern func_0202e1e0
        .extern func_02030538
        .extern func_ov002_021c37e4
        .global func_ov002_022967f0
        .arm
func_ov002_022967f0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r7, r0
    ldrh r0, [r7, #0x2]
    ldr r8, _LIT0
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mul r0, r2, r8
    ldr r1, [r1, r0]
    mov r1, r1, lsr #0x11
    tst r1, #0x1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r1, _LIT2
    mov r5, #0x0
    ldr r1, [r1, r0]
    cmp r1, #0x0
    bls .L_f4
    ldr r4, _LIT3
    mov r6, r5
.L_54:
    add r0, r4, r0
    add r0, r0, r6
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x13
    mov r9, r0, lsr #0x13
    mov r0, r9
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_c8
    mov r0, r9
    bl func_02030538
    cmp r0, #0x0
    bne .L_c8
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r1, r0, #0x1
    mla r2, r1, r8, r4
    add r1, r2, #0x120
    ldr r2, [r1, r6]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_021c37e4
    cmp r0, #0x5
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_c8:
    ldrh r0, [r7, #0x2]
    add r5, r5, #0x1
    add r6, r6, #0x4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r1, r0, #0x1
    mul r0, r1, r8
    add r1, r4, r0
    ldr r1, [r1, #0xc]
    cmp r5, r1
    bcc .L_54
.L_f4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a8
_LIT2: .word data_ov002_022cf098
_LIT3: .word data_ov002_022cf08c
