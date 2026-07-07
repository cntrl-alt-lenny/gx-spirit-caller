; func_ov002_021f95e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_0202b89c
        .extern func_ov002_021ae320
        .extern func_ov002_021d7b50
        .extern func_ov002_021f9534
        .extern func_ov002_02259204
        .extern func_ov002_0225930c
        .extern func_ov002_022903f0
        .global func_ov002_021f95e8
        .arm
func_ov002_021f95e8:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5b4]
    cmp r0, #0x0
    beq .L_24
    cmp r0, #0x1
    beq .L_84
    b .L_f0
.L_24:
    ldrh r0, [r4, #0x2]
    mov r1, #0x3a
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_64
    ldr r2, _LIT2
    mov r1, #0x2
    bl func_ov002_022903f0
    b .L_6c
.L_64:
    ldr r0, _LIT2
    bl func_ov002_02259204
.L_6c:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, r5, r6, pc}
.L_84:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_d8
    ldr r0, _LIT3
    ldr r6, [r0, #0xd78]
    ldr r5, [r0, #0xd70]
    mov r1, r6
    mov r0, r5
    bl func_ov002_021d7b50
    ldr r0, _LIT4
    ldr r1, _LIT5
    and r2, r5, #0x1
    mla r0, r2, r0, r1
    add r0, r0, r6, lsl #0x2
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b89c
    strh r0, [r4, #0xc]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_d8:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    sub r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, r5, r6, pc}
.L_f0:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cd664
_LIT2: .word func_ov002_021f9534
_LIT3: .word data_ov002_022d008c
_LIT4: .word 0x00000868
_LIT5: .word data_ov002_022cf08c
