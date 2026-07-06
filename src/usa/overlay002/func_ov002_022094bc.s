; func_ov002_022094bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021c8860
        .global func_ov002_022094bc
        .arm
func_ov002_022094bc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r1, _LIT0
    mov r8, r0
    ldr r0, [r1, #0xcf8]
    mov r6, #0x0
    cmp r0, #0x2
    movne r0, r6
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r4, _LIT1
    ldr r9, _LIT2
    mov r5, r6
    mov r7, r6
.L_30:
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r1, r0, #0x1
    mla r2, r1, r9, r4
    add r2, r2, r7
    ldr r1, [r2, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    ldrneh r1, [r2, #0x38]
    cmpne r1, #0x0
    beq .L_7c
    ldrh r1, [r2, #0x36]
    cmp r1, #0x0
    bne .L_7c
    mov r1, r5
    bl func_ov002_021c8860
    cmp r0, #0x12
    addeq r6, r6, #0x1
.L_7c:
    add r5, r5, #0x1
    cmp r5, #0x4
    add r7, r7, #0x14
    ble .L_30
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x23
    bne .L_b0
    cmp r6, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_b0:
    cmp r6, #0x2
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
