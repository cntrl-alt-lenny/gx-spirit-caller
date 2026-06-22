; func_ov002_0221baa4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b99b4
        .extern func_ov002_021bd030
        .extern func_ov002_021d5d48
        .extern func_ov002_021d8414
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .global func_ov002_0221baa4
        .arm
func_ov002_0221baa4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x10
    mov r7, r0
    ldrh r1, [r7, #0x2]
    ldrh r0, [r7, #0x4]
    mov r2, r1, lsl #0x1f
    mov r1, r0, lsl #0x11
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x17
    bl func_ov002_021b99b4
    cmp r0, #0x0
    addlt sp, sp, #0x10
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bd030
    mvn r1, #0x0
    cmp r0, r1
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    add r2, sp, #0xc
    mov r0, r7
    mov r1, #0x0
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_128
    ldr r2, [sp, #0xc]
    mov r0, r7
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r5, r2, #0xff
    and r6, r1, #0xff
    mov r1, r5
    mov r2, r6
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_128
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bd030
    ldrh r2, [r7, #0x2]
    mov r4, r0
    mov r0, #0x1
    str r4, [sp]
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldrh r1, [r7, #0x4]
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsl #0x11
    mov r3, r0
    mov r2, r1, lsr #0x17
    mov r1, #0xe
    bl func_ov002_021d8414
    ldrh r0, [r7, #0x2]
    and r3, r4, #0xff
    and r2, r5, #0xff
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r4, r0, #0xff
    and r1, r6, #0xff
    orr r3, r4, r3, lsl #0x8
    orr r2, r2, r1, lsl #0x8
    mov r1, r3, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_021d5d48
.L_128:
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
