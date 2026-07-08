; func_ov002_022198b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern func_ov002_021afff0
        .extern func_ov002_021d46ac
        .extern func_ov002_021d86b4
        .extern func_ov002_021df618
        .extern func_ov002_021e269c
        .global func_ov002_022198b8
        .arm
func_ov002_022198b8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldrh r0, [r6, #0x4]
    mov r1, r0, lsl #0x1d
    movs r1, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldrh r1, [r6, #0x2]
    mov r4, r0, lsl #0x11
    ldr r5, _LIT0
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r2, r1, lsl #0x1a
    ldr r1, _LIT1
    and r3, r0, #0x1
    mla r5, r3, r1, r5
    mov r3, r2, lsr #0x1b
    mov r2, #0x14
    mul r2, r3, r2
    add r3, r5, #0x30
    ldr r3, [r3, r2]
    mov r4, r4, lsr #0x17
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    cmp r4, r2
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    rsb r0, r0, #0x1
    and r0, r0, #0x1
    mul r1, r0, r1
    ldr r0, _LIT2
    ldr r0, [r0, r1]
    cmp r0, #0x0
    beq .L_b8c
    bl func_ov002_021afff0
    ldrh r3, [r6, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT0
    mov r3, r3, lsl #0x1f
    mov r3, r3, lsr #0x1f
    rsbs r3, r3, #0x1
    and r3, r3, #0x1
    mla r1, r3, r1, r2
    mov r4, r0
    add r0, r1, r4, lsl #0x2
    ldr r0, [r0, #0x120]
    mov r1, #0x0
    mov r0, r0, lsl #0x13
    mov r5, r0, lsr #0x13
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x53
    mov r0, r0, lsl #0x10
    mov r2, r1
    mov r3, r1
    mov r0, r0, lsr #0x10
    bl func_ov002_021d46ac
    ldrh r0, [r6, #0x2]
    ldr r3, _LIT0
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x120
    ldr r3, [r1, r4, lsl #0x2]
    mov r1, #0xb
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021d86b4
    ldrh r0, [r6, #0x2]
    mov r1, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021df618
    ldrh r0, [r6, #0x2]
    ldr r3, _LIT0
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x120
    ldr r2, [r1, r4, lsl #0x2]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_021e269c
.L_b8c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf098
