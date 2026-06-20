; func_ov002_022afc0c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b3870
        .global func_ov002_022afc0c
        .arm
func_ov002_022afc0c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr r3, [r7, #0x4]
    ldrb r0, [r7, #0x38]
    sub r4, r1, r3
    ldr r3, [r7, #0x8]
    mov r6, r2
    cmp r0, #0x0
    mov r1, r4
    sub r6, r6, r3
    movne r1, r6
    movne r6, r4
    cmp r1, #0x0
    mov r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r2, [r7, #0x28]
    cmp r1, r2
    ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r6, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r5, [r7, #0x2c]
    ldr r4, [r7, #0x34]
    add r1, r4, r5, lsl #0x1
    cmp r6, r1
    ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r7, #0x14]
    cmp r0, #0x3
    ldreq r0, [r7, #0x18]
    beq .L_a0
    ldr r1, [r7, #0x30]
    ldr ip, [r7, #0x40]
    ldr r0, [r7, #0x3c]
    sub r1, r4, r1
    sub r0, r0, ip
    ldr r3, [r7, #0x44]
    mul r2, r1, r0
    sub r1, r3, ip
    add r0, r1, r1, lsr #0x1f
    add r0, r2, r0, asr #0x1
    bl func_020b3870
.L_a0:
    cmp r6, r5
    mvnlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
    add r1, r4, r5
    cmp r6, r1
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
    add r1, r5, r0
    cmp r6, r1
    mvnlt r0, #0x1
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r7, #0x30]
    add r0, r0, r1
    cmp r6, r0
    movge r0, #0x2
    movlt r0, #0x3
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
