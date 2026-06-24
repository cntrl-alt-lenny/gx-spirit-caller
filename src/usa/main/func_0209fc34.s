; func_0209fc34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_0209f87c
        .extern func_0209f9f0
        .global func_0209fc34
        .arm
func_0209fc34:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r4, [r0, #0x1c]
    cmp r4, #0x0
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    ldrh r1, [r0, #0x2]
    cmp r1, #0x0
    bne .L_158
    ldrh r1, [r0, #0x4]
    cmp r1, #0x15
    bgt .L_64
    cmp r1, #0x15
    bge .L_98
    cmp r1, #0x9
    ldmgtia sp!, {r4, r5, r6, lr}
    bxgt lr
    cmp r1, #0x7
    ldmltia sp!, {r4, r5, r6, lr}
    bxlt lr
    cmp r1, #0x7
    beq .L_bc
    cmp r1, #0x9
    beq .L_d0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_64:
    cmp r1, #0x1a
    ldmgtia sp!, {r4, r5, r6, lr}
    bxgt lr
    cmp r1, #0x19
    ldmltia sp!, {r4, r5, r6, lr}
    bxlt lr
    cmp r1, #0x19
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    cmp r1, #0x1a
    beq .L_d0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_98:
    ldrh r1, [r0, #0x12]
    ldr r2, [r0, #0xc]
    mov r0, r4
    bl func_0209f9f0
    mov r0, r4
    mov r1, #0x0
    bl func_0209f87c
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_bc:
    mov r0, r4
    mov r1, #0x0
    bl func_0209f87c
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_d0:
    ldrh r5, [r0, #0x12]
    mov r6, #0x1
    bl OS_DisableIrq
    add r1, r4, #0x800
    ldrh lr, [r1, #0x8]
    mvn ip, r6, lsl r5
    mov r3, lr, lsl #0x9
    ldrh r2, [r4, r3]
    and r2, r2, ip
    strh r2, [r4, r3]
    ldrh r1, [r1, #0x18]
    cmp r1, #0x1
    bne .L_120
    add r1, lr, #0x1
    and r1, r1, #0x3
    mov r1, r1, lsl #0x10
    mov r2, r1, lsr #0x7
    ldrh r1, [r4, r2]
    and r1, r1, ip
    strh r1, [r4, r2]
.L_120:
    bl OS_RestoreIrq
    mov r0, r4
    mov r1, #0x0
    bl func_0209f87c
    add r0, r4, #0x800
    ldrh r0, [r0, #0x18]
    cmp r0, #0x1
    ldmneia sp!, {r4, r5, r6, lr}
    bxne lr
    mov r0, r4
    mov r1, #0x0
    bl func_0209f87c
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_158:
    add r0, r4, #0x800
    mov r1, #0x5
    strh r1, [r0, #0x1c]
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
