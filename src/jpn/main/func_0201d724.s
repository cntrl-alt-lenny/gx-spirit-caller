; func_0201d724 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208f0dc
        .extern func_0208f128
        .extern func_0208f19c
        .extern func_0208f1c0
        .extern func_0208f20c
        .extern func_0208f280
        .extern func_0208f2a4
        .extern func_0208f2fc
        .extern func_0208f370
        .extern func_0208f3e0
        .extern func_0208f444
        .extern func_0208f4c4
        .extern func_0208fdcc
        .extern func_0208fe34
        .extern func_0208fe9c
        .extern func_0208ff04
        .extern func_0209281c
        .global func_0201d724
        .arm
func_0201d724:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr r5, [r7, #0x20]
    mov r6, r1
    cmp r5, #0x0
    ldreq r0, [r6, #0x8]
    ldr r1, [r7, #0x18]
    moveq r5, r0, lsl #0x1
    ldrsh r0, [r7, #0x10]
    mov r1, r1, lsl #0xf
    mov r4, r1, asr #0x1d
    cmp r0, #0x0
    cmpge r4, #0x0
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r5, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r1, r5
    add r0, r6, #0xc
    bl func_0209281c
    ldrh r0, [r7, #0x14]
    mov r1, r0, lsl #0x1c
    mov r1, r1, lsr #0x1c
    cmp r1, #0x9
    addls pc, pc, r1, lsl #0x2
    b .L_190
    b .L_114
    b .L_114
    b .L_114
    b .L_114
    b .L_94
    b .L_154
    b .L_154
    b .L_154
    b .L_154
    b .L_d4
.L_94:
    mov r0, r0, lsl #0x1b
    movs r0, r0, lsr #0x1f
    beq .L_c0
    bl func_0208f370
    ldrsh r1, [r7, #0x10]
    mov r2, r5
    add r0, r6, #0xc
    add r1, r1, r4, lsl #0xd
    bl func_0208f2fc
    bl func_0208f2a4
    b .L_190
.L_c0:
    ldrsh r1, [r7, #0x10]
    mov r2, r5
    add r0, r6, #0xc
    bl func_0208fe34
    b .L_190
.L_d4:
    mov r0, r0, lsl #0x1b
    movs r0, r0, lsr #0x1f
    beq .L_100
    bl func_0208f19c
    ldrsh r1, [r7, #0x10]
    mov r2, r5
    add r0, r6, #0xc
    add r1, r1, r4, lsl #0xd
    bl func_0208f128
    bl func_0208f0dc
    b .L_190
.L_100:
    ldrsh r1, [r7, #0x10]
    mov r2, r5
    add r0, r6, #0xc
    bl func_0208fdcc
    b .L_190
.L_114:
    mov r0, r0, lsl #0x1b
    movs r0, r0, lsr #0x1f
    beq .L_140
    bl func_0208f4c4
    ldrsh r1, [r7, #0x10]
    mov r2, r5
    add r0, r6, #0xc
    add r1, r1, r4, lsl #0xd
    bl func_0208f444
    bl func_0208f3e0
    b .L_190
.L_140:
    ldrsh r1, [r7, #0x10]
    mov r2, r5
    add r0, r6, #0xc
    bl func_0208ff04
    b .L_190
.L_154:
    mov r0, r0, lsl #0x1b
    movs r0, r0, lsr #0x1f
    beq .L_180
    bl func_0208f280
    ldrsh r1, [r7, #0x10]
    mov r2, r5
    add r0, r6, #0xc
    add r1, r1, r4, lsl #0xd
    bl func_0208f20c
    bl func_0208f1c0
    b .L_190
.L_180:
    ldrsh r1, [r7, #0x10]
    mov r2, r5
    add r0, r6, #0xc
    bl func_0208fe9c
.L_190:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
