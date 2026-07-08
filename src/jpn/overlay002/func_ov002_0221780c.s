; func_ov002_0221780c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b3538
        .extern func_ov002_021b39e0
        .extern func_ov002_021d5e3c
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .global func_ov002_0221780c
        .arm
func_ov002_0221780c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r6, r0
    ldrh r1, [r6, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    add r2, sp, #0x0
    mov r1, #0x0
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_118
    add r2, sp, #0x4
    mov r0, r6
    mov r1, #0x1
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_118
    ldr r2, [sp]
    ldr ip, [sp, #0x4]
    mov r0, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x8
    mov r0, ip, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r3, r0, asr #0x8
    mov r0, r6
    and r4, r2, #0xff
    and r5, r1, #0xff
    mov r1, r4
    mov r2, r5
    and r6, ip, #0xff
    and r7, r3, #0xff
    bl func_ov002_02257564
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    bl func_ov002_021b39e0
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b3538
    ldr r1, [sp, #0x4]
    cmp r1, r0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b3538
    ldr r1, _LIT0
    cmp r0, r1
    beq .L_118
    ldr r0, [sp]
    ldr r1, [sp, #0x4]
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021d5e3c
.L_118:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x0000ffff
