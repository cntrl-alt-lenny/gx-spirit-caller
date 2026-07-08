; func_ov002_0221df40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern func_ov002_021c1d64
        .extern func_ov002_021d5918
        .extern func_ov002_021de3e8
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .extern func_ov002_0226b02c
        .global func_ov002_0221df40
        .arm
func_ov002_0221df40:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    mov r8, r0
    ldrh r1, [r8, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r1, [r8, #0x6]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x18
    cmp r1, #0x2
    bne .L_3e0
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r4, r0
    mov r0, r8
    mov r1, #0x1
    bl func_ov002_0223dda4
    ldr r3, _LIT0
    mov r1, r4, lsl #0x10
    mov r2, r0, lsl #0x10
    mov r5, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    ldr r1, [r3, #0x5a8]
    mov r3, r5, asr #0x8
    mov r2, r2, asr #0x8
    cmp r1, #0x7f
    and r4, r4, #0xff
    and r5, r3, #0xff
    and r6, r0, #0xff
    and r7, r2, #0xff
    beq .L_388
    cmp r1, #0x80
    bne .L_3e0
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_37c
    mov r0, r8
    mov r1, #0x1
    mov r2, #0x0
    bl func_ov002_0223de48
    cmp r0, #0x0
    ldrneh r0, [r8, #0x2]
    movne r0, r0, lsl #0x1f
    cmpne r4, r0, lsr #0x1f
    beq .L_37c
    cmp r6, r0, lsr #0x1f
    bne .L_37c
    mov r0, r8
    mov r1, r4
    mov r2, r5
    bl func_ov002_021de3e8
    add sp, sp, #0x8
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_37c:
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_388:
    mov r0, r4, lsl #0x10
    mov r1, #0x5
    str r1, [sp]
    mov r0, r0, lsr #0x10
    str r0, [sp, #0x4]
    ldrh r3, [r8]
    mov r0, r8
    mov r1, r6
    mov r2, r7
    bl func_ov002_021d5918
    mov r0, r8
    mov r1, r6
    mov r2, r7
    bl func_ov002_021c1d64
    cmp r0, #0x0
    bne .L_3d4
    mov r0, r6
    mov r1, r7
    bl func_ov002_0226b02c
.L_3d4:
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_3e0:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce1a8
