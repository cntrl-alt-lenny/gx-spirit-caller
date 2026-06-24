; func_ov002_0221b278 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a4
        .extern func_ov002_021c8470
        .extern func_ov002_021d5a08
        .extern func_ov002_0223df38
        .global func_ov002_0221b278
        .arm
func_ov002_0221b278:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x10
    mov r4, r0
    ldrh r1, [r4, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    addne sp, sp, #0x10
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    add r2, sp, #0x8
    mov r1, #0x0
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_148
    add r2, sp, #0xc
    mov r0, r4
    mov r1, #0x1
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_148
    ldr r2, [sp, #0x8]
    ldr r3, [sp, #0xc]
    mov r0, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x8
    mov r0, r3, lsl #0x10
    and r6, r1, #0xff
    and r5, r2, #0xff
    mov r0, r0, lsr #0x10
    mov r2, r0, asr #0x8
    mov r0, r5
    mov r1, r6
    and r7, r3, #0xff
    and r8, r2, #0xff
    bl func_ov002_021c8470
    add ip, r0, #0x1
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r9, r5, #0x1
    mla r1, r9, r2, r0
    mov r3, #0x14
    smulbb r9, r6, r3
    ldrh r9, [r9, r1]
    mov r1, ip, asr #0x1
    cmp r9, #0x0
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    and r9, r7, #0x1
    mul r3, r8, r3
    mla r0, r9, r2, r0
    ldrh r0, [r3, r0]
    cmp r0, #0x0
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r2, _LIT2
    mov r0, r1, lsr #0x1f
    smull r1, r3, r2, r1
    add r3, r0, r3, asr #0x2
    mov r9, r3, lsl #0x1
    mov r0, r9, lsl #0x10
    mov r1, #0x2
    str r1, [sp]
    mov r0, r0, lsr #0x10
    str r0, [sp, #0x4]
    ldrh r3, [r4]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_ov002_021d5a08
    add r0, r9, #0x1
    mov r0, r0, lsl #0x10
    mov r1, #0x2
    str r1, [sp]
    mov r0, r0, lsr #0x10
    str r0, [sp, #0x4]
    ldrh r3, [r4]
    mov r0, r4
    mov r1, r7
    mov r2, r8
    bl func_ov002_021d5a08
.L_148:
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a4
_LIT2: .word 0x66666667
