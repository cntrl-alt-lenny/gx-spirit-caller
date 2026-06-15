; func_0203f198 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203f30c
        .global func_0203f198
        .arm
func_0203f198:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x1c
    mov r4, #0x3
    mul r4, r2, r4
    mov r4, r4, lsr #0x2
    mov sl, r0
    mov r0, r4
    cmp r3, r0
    andcs fp, r2, #0x3
    subcs r0, r2, fp
    str r4, [sp, #0x4]
    mov r9, r1
    strcs r0, [sp]
    bcs .L_2e0
    add sp, sp, #0x1c
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2e0:
    cmp r0, #0x0
    mov r7, #0x0
    ble .L_36c
    mov r5, r7
    add r4, sp, #0x10
    str r7, [sp, #0xc]
    str r7, [sp, #0x8]
.L_2fc:
    ldr r8, [sp, #0x8]
    mov r6, r8
.L_304:
    add r0, r7, r6
    ldrb r0, [sl, r0]
    bl func_0203f30c
    rsb r2, r6, #0x3
    mov r1, #0x6
    mul r1, r2, r1
    orr r8, r8, r0, lsl r1
    add r6, r6, #0x1
    cmp r6, #0x4
    blt .L_304
    mov r0, #0x3
    mul r1, r5, r0
    ldr r2, [sp, #0xc]
    str r8, [sp, #0x10]
.L_33c:
    rsb r0, r2, #0x2
    ldrb r0, [r4, r0]
    add r2, r2, #0x1
    cmp r2, #0x3
    strb r0, [r9, r1]
    add r1, r1, #0x1
    blt .L_33c
    ldr r0, [sp]
    add r7, r7, #0x4
    cmp r7, r0
    add r5, r5, #0x1
    blt .L_2fc
.L_36c:
    cmp fp, #0x0
    beq .L_404
    mov r5, #0x0
    mov r4, r5
    str r5, [sp, #0x14]
    cmp fp, #0x0
    ble .L_3c0
    mov r6, #0x6
.L_38c:
    ldr r0, [sp]
    add r0, r0, r4
    ldrb r0, [sl, r0]
    bl func_0203f30c
    rsb r1, r4, #0x3
    mul r2, r1, r6
    orr r5, r5, r0, lsl r2
    ldr r0, [sp, #0x14]
    add r4, r4, #0x1
    orr r0, r0, r5
    cmp r4, fp
    str r0, [sp, #0x14]
    blt .L_38c
.L_3c0:
    cmp fp, #0x0
    mov r2, #0x0
    ble .L_404
    ldr r0, [sp]
    mov r1, #0x3
    mul r1, r0, r1
    mov r0, r1, asr #0x1
    add r0, r1, r0, lsr #0x1e
    mov r3, r0, asr #0x2
    add r1, sp, #0x14
.L_3e8:
    rsb r0, r2, #0x2
    ldrb r0, [r1, r0]
    add r2, r2, #0x1
    cmp r2, fp
    strb r0, [r9, r3]
    add r3, r3, #0x1
    blt .L_3e8
.L_404:
    ldr r0, [sp, #0x4]
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
