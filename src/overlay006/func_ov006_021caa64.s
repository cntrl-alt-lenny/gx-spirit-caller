; func_ov006_021caa64 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02021660
        .extern func_020216b0
        .global func_ov006_021caa64
        .arm
func_ov006_021caa64:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r6, #0x0
    mov sl, r0
    mov r0, r6
    ldr fp, [sl, #0x60]
    orr r0, r0, #0xc9
    orr r0, r0, #0x800
    rsb r8, fp, #0x1
    str r0, [sp]
.L_5d0:
    ldr r0, [sl]
    mov r1, #0x5
    mov r2, r6
    bl func_02021660
    mov r4, r0
    mov r0, r8, lsl #0x6
    ldr r2, [sl, #0x58]
    add r1, r0, r0, lsr #0x1f
    mov r0, r2, lsl #0x3
    ldr r3, [sl, #0x78]
    add r0, r0, r0, lsr #0x1f
    add r0, r3, r0, asr #0x1
    add r2, r0, r1, asr #0x1
    ldr r3, [sl, #0x7c]
    ldr r1, [sl, #0x5c]
    ldr r0, [sl, #0x88]
    add r1, r3, r1, lsl #0x3
    mov r5, #0x0
    cmp r6, fp
    ldrlt r5, [sp]
    cmp r6, r0
    sub r7, r1, #0x16
    moveq r9, #0x2
    beq .L_640
    ldr r0, [sl, #0x68]
    cmp r6, r0
    moveq r9, #0x1
    movne r9, #0x0
.L_640:
    mov r0, r4
    mov r1, #0x3
    bl func_020216b0
    mov r2, r7
    mov r0, r4
    mov r1, #0x4
    bl func_020216b0
    mov r0, r4
    mov r1, #0x11
    mov r2, #0x1
    bl func_020216b0
    mov r0, r4
    mov r1, #0x12
    mov r2, #0x0
    bl func_020216b0
    mov r2, r9
    mov r0, r4
    mov r1, #0xd
    bl func_020216b0
    mov r0, r4
    mov r2, r5
    mov r1, #0x0
    bl func_020216b0
    add r6, r6, #0x1
    add r8, r8, #0x2
    cmp r6, #0x2
    blt .L_5d0
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
