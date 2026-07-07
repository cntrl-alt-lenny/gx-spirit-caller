; func_ov002_021ed108 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021babc8
        .extern func_ov002_021c1d64
        .extern func_ov002_021c1fa4
        .global func_ov002_021ed108
        .arm
func_ov002_021ed108:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldrh r3, [r6, #0xc]
    mov r5, r1
    mov r4, r2
    cmp r3, #0x0
    beq .L_b4
    ldr r3, _LIT0
    ldr ip, _LIT1
    and lr, r5, #0x1
    mla ip, lr, r3, ip
    mov r3, #0x14
    mla r3, r4, r3, ip
    ldr r3, [r3, #0x30]
    mov r3, r3, lsl #0x13
    movs r3, r3, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r3, [r6, #0x2]
    mov r3, r3, lsl #0x1f
    cmp r5, r3, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    bl func_ov002_021c1d64
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r6
    mov r1, r5
    mov r2, r4
    mov r3, #0x1
    bl func_ov002_021c1fa4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r4, #0x4
    bgt .L_148
    ldr r2, _LIT2
    mov r0, r5
    mov r1, r4
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_148
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_b4:
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
    cmp r4, #0x4
    bgt .L_148
    ldr r2, _LIT2
    mov r0, r5
    mov r1, r4
    bl func_ov002_021babc8
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
.L_148:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00001434
