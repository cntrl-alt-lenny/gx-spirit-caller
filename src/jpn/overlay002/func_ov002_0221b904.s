; func_ov002_0221b904 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd34c
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_ov002_021d58dc
        .global func_ov002_0221b904
        .arm
func_ov002_0221b904:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r3, _LIT0
    mov ip, r0
    ldr r0, [r3, #0x4]
    ldr r1, _LIT1
    and r4, r0, #0x1
    mul r2, r4, r1
    ldr r4, [r3]
    ldr r5, _LIT2
    ldr r1, [r3, #0x20]
    mov r3, #0x14
    add r5, r5, r2
    mul r3, r1, r3
    add r5, r5, #0x30
    ldr r5, [r5, r3]
    rsb r6, r4, #0x1
    mov lr, #0x38
    mov r4, r5, lsl #0x2
    mov r4, r4, lsr #0x18
    mul r7, r6, lr
    ldr lr, _LIT3
    mov r5, r5, lsl #0x12
    mov r4, r4, lsl #0x1
    ldr lr, [lr, r7]
    add r4, r4, r5, lsr #0x1f
    cmp lr, r4
    bne .L_358
    ldr lr, _LIT4
    add r2, lr, r2
    ldrh r2, [r3, r2]
    cmp r2, #0x0
    beq .L_358
    mov r2, #0x0
    str r2, [sp]
    ldrh r2, [ip]
    mov r3, #0x2
    bl func_ov002_021d58dc
.L_358:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cd314
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022cd34c
_LIT4: .word data_ov002_022cf0c4
