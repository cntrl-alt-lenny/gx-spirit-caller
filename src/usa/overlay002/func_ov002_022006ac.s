; func_ov002_022006ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022ce4ac
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022d008c
        .extern func_ov002_0226ea58
        .global func_ov002_022006ac
        .arm
func_ov002_022006ac:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r0
    ldrh r0, [r8, #0x2]
    ldr r1, _LIT0
    ldr r2, [r1, #0xcec]
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    cmp r2, r3, lsr #0x1f
    ldr r1, [r1, #0xcf8]
    bne .L_38
    cmp r1, #0x2
    mov r2, #0x1
    cmpne r1, #0x4
    b .L_40
.L_38:
    cmp r1, #0x3
    moveq r2, #0x1
.L_40:
    movne r2, #0x0
    cmp r2, #0x0
    beq .L_138
    ldr r9, _LIT1
    and r1, r0, #0x1
    mul r2, r1, r9
    ldr r4, _LIT2
    ldr r1, [r4, r2]
    cmp r1, #0x1f4
    ble .L_138
    ldr r1, _LIT3
    mov r6, #0x0
    ldr r1, [r1, r2]
    mov r5, r6
    cmp r1, #0x0
    bls .L_dc
    mov r7, r6
.L_84:
    and r1, r0, #0x1
    mla r2, r1, r9, r4
    add r1, r2, #0x120
    ldr r2, [r1, r7]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_0226ea58
    cmp r0, #0x0
    ldrh r0, [r8, #0x2]
    add r5, r5, #0x1
    addne r6, r6, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r9, r4
    ldr r1, [r1, #0xc]
    add r7, r7, #0x4
    cmp r5, r1
    bcc .L_84
.L_dc:
    cmp r6, #0x0
    beq .L_138
    ldr r0, _LIT4
    ldr r0, [r0, #0x484]
    subs r3, r0, #0x1
    bmi .L_12c
    ldr r1, _LIT5
    mov r0, #0x18
    mla r1, r3, r0, r1
    ldrh r0, [r8, #0x4]
    mov r0, r0, lsl #0x11
    mov r2, r0, lsr #0x17
.L_10c:
    ldrh r0, [r1]
    mov r0, r0, lsl #0x11
    cmp r2, r0, lsr #0x17
    bne .L_12c
    sub r6, r6, #0x1
    sub r1, r1, #0x18
    subs r3, r3, #0x1
    bpl .L_10c
.L_12c:
    cmp r6, #0x0
    movne r0, #0x2
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_138:
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x3
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022cf098
_LIT4: .word data_ov002_022ce1a8
_LIT5: .word data_ov002_022ce4ac
