; func_ov002_0221e0a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021d8fd0
        .extern func_ov002_021e267c
        .global func_ov002_0221e0a4
        .arm
func_ov002_0221e0a4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    ldrh r5, [r4, #0x4]
    ldr r3, _LIT0
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r6, r1, lsl #0x1a
    ldr r1, _LIT1
    and r2, r0, #0x1
    mla r3, r2, r1, r3
    mov r1, r6, lsr #0x1b
    mov r2, #0x14
    mul r2, r1, r2
    add r3, r3, #0x30
    ldr r3, [r3, r2]
    mov r5, r5, lsl #0x11
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    mov r5, r5, lsr #0x17
    add r2, r2, r3, lsr #0x1f
    cmp r5, r2
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r5, [r4, #0x6]
    mov r2, #0x0
    mov r3, r2
    mov r5, r5, lsl #0x10
    mov lr, r5, lsr #0x18
    cmp lr, #0x0
    ble .L_4b4
    ldrh ip, [r4]
    mov r8, #0x1
    ldr r5, _LIT2
    mov r7, r8
.L_484:
    add r6, r4, r3, lsl #0x1
    ldrh r9, [r6, #0x8]
    cmp ip, r5
    add r3, r3, #0x1
    mov r6, r9, asr #0x8
    and r9, r9, #0xff
    moveq r9, r8
    and r6, r6, #0xff
    add r6, r6, r9, lsl #0x4
    cmp r3, lr
    orr r2, r2, r7, lsl r6
    blt .L_484
.L_4b4:
    bl func_ov002_021d8fd0
    ldrh r0, [r4, #0x2]
    mov r2, #0x6
    mov r3, #0x0
    mov r4, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    and r4, r0, #0xff
    and r1, r1, #0xff
    orr r1, r4, r1, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e267c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word 0x00001aa9
