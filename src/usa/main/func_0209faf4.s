; func_0209faf4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020943b0
        .extern func_0209d630
        .global func_0209faf4
        .arm
func_0209faf4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    ldr r7, [r8, #0x1c]
    cmp r7, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    ldrh r0, [r8, #0x2]
    cmp r0, #0x0
    bne .L_12c
    ldrh r0, [r8, #0x4]
    cmp r0, #0x15
    bgt .L_68
    cmp r0, #0x15
    bge .L_98
    cmp r0, #0x9
    ldmgtia sp!, {r4, r5, r6, r7, r8, lr}
    bxgt lr
    cmp r0, #0x7
    ldmltia sp!, {r4, r5, r6, r7, r8, lr}
    bxlt lr
    cmp r0, #0x7
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    cmp r0, #0x9
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_68:
    cmp r0, #0x1a
    ldmgtia sp!, {r4, r5, r6, r7, r8, lr}
    bxgt lr
    cmp r0, #0x19
    ldmltia sp!, {r4, r5, r6, r7, r8, lr}
    bxlt lr
    cmp r0, #0x19
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    cmp r0, #0x1a
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_98:
    ldr r4, [r8, #0xc]
    ldrh r6, [r8, #0x10]
    ldrh r5, [r4]
    bl func_0209d630
    add r1, r7, #0x800
    ldrh r1, [r1, #0x14]
    cmp r6, r1
    beq .L_c0
    cmp r6, #0x200
    movhi r6, #0x200
.L_c0:
    cmp r6, #0x4
    ldmccia sp!, {r4, r5, r6, r7, r8, lr}
    bxcc lr
    mov r1, #0x1
    mov r0, r1, lsl r0
    ands r0, r5, r0
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    add r0, r7, #0x800
    ldrh r1, [r0, #0x8]
    mov r0, r4
    mov r2, r6
    add r1, r7, r1, lsl #0x9
    bl func_020943b0
    add r1, r7, #0x800
    ldrh r0, [r1, #0x8]
    ldrh r2, [r8, #0x1a]
    add r0, r7, r0, lsl #0x1
    mov r2, r2, asr #0x1
    add r0, r0, #0x800
    strh r2, [r0]
    ldrh r0, [r1, #0x8]
    add r0, r0, #0x1
    and r0, r0, #0x3
    strh r0, [r1, #0x8]
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_12c:
    add r0, r7, #0x800
    mov r1, #0x5
    strh r1, [r0, #0x1c]
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
