; func_ov002_021f2538 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021c22cc
        .extern func_ov002_021ecae0
        .extern func_ov002_022577a0
        .global func_ov002_021f2538
        .arm
func_ov002_021f2538:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldrh r3, [r6, #0xa]
    mov r5, r1
    mov r4, r2
    cmp r3, #0x0
    beq .L_454
    bl func_ov002_021ecae0
    ldmia sp!, {r4, r5, r6, pc}
.L_454:
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r5
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    ldr r1, _LIT1
    and r2, r5, #0x1
    mla r1, r2, r0, r1
    mov r0, #0x14
    mul r2, r4, r0
    add r0, r1, #0x30
    ldr r1, [r0, r2]
    mov r0, r1, lsl #0x13
    movs r0, r0, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r1, lsl #0x2
    ldrh r2, [r6, #0x4]
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    mov r2, r2, lsl #0x11
    add r0, r0, r1, lsr #0x1f
    cmp r0, r2, lsr #0x17
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c22cc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    and r1, r5, #0xff
    and r0, r4, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r2, r0, lsl #0x10
    ldr r1, _LIT2
    mov r0, r6
    mov r2, r2, lsr #0x10
    bl func_ov002_022577a0
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word func_ov002_021ecae0
