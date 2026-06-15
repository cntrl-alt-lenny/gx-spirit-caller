; func_ov010_021b2630 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02006110
        .extern func_02006194
        .extern func_0207ec28
        .extern func_ov005_021aa4d0
        .extern func_ov010_021b2280
        .global func_ov010_021b2630
        .arm
func_ov010_021b2630:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x10
    mov r7, r0
    mov r0, r1
    mov r6, r2
    bl func_0207ec28
    str r0, [sp, #0xc]
    ldr r0, [r7, #0x70]
    mov r4, #0x0
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_154
    mov r0, r7
    bl func_ov005_021aa4d0
.L_154:
    ldr r0, [r7, #0x18]
    cmp r0, #0x0
    beq .L_170
    ldr r0, [r7, #0x70]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r7, #0x70]
.L_170:
    bl func_02006194
    cmp r0, #0x0
    beq .L_244
    add r0, sp, #0x8
    add r1, sp, #0x4
    add r5, r7, #0x34
    bl func_02006110
    mov r0, #0x0
    mov r2, r0
    mov r3, #0x1
.L_198:
    ldrsh r1, [r5]
    ldr ip, [sp, #0x8]
    cmp ip, r1
    blt .L_1d8
    ldrsh r1, [r5, #0x4]
    cmp ip, r1
    bgt .L_1d8
    ldrsh r1, [r5, #0x2]
    ldr ip, [sp, #0x4]
    cmp ip, r1
    blt .L_1d8
    ldrsh r1, [r5, #0x6]
    cmp ip, r1
    addle r1, r7, r0, lsl #0x2
    strle r3, [r1, #0x8c]
    ble .L_1e0
.L_1d8:
    add r1, r7, r0, lsl #0x2
    str r2, [r1, #0x8c]
.L_1e0:
    add r0, r0, #0x1
    cmp r0, #0x5
    add r5, r5, #0x8
    blt .L_198
    ldrsh r3, [r7, #0x36]
    ldr r2, [r7, #0x4]
    ldrsh r0, [r7, #0x34]
    ldr r1, [sp, #0x8]
    add r2, r3, r2
    cmp r1, r0
    blt .L_238
    ldrsh r0, [r7, #0x38]
    cmp r1, r0
    bgt .L_238
    ldr r1, [sp, #0x4]
    cmp r1, r2
    blt .L_238
    add r0, r2, #0x15
    cmp r1, r0
    movle r0, #0x1
    strle r0, [r7, #0xa0]
    ble .L_260
.L_238:
    mov r0, #0x0
    str r0, [r7, #0xa0]
    b .L_260
.L_244:
    mov r2, #0x0
    mov r1, r2
.L_24c:
    add r0, r7, r2, lsl #0x2
    add r2, r2, #0x1
    str r1, [r0, #0x8c]
    cmp r2, #0x6
    blt .L_24c
.L_260:
    add r5, sp, #0xc
    mov r0, r7
    mov r3, r6
    mov r1, #0x1
    mov r2, #0x0
    str r5, [sp]
    bl func_ov010_021b2280
    mov r1, #0x2
    add r4, r4, r0
    mov r0, r7
    mov r2, r1
    mov r3, r6
    str r5, [sp]
    bl func_ov010_021b2280
    mov r1, r5
    add r4, r4, r0
    str r1, [sp]
    mov r0, r7
    mov r3, r6
    mov r1, #0x5
    mov r2, #0x4
    bl func_ov010_021b2280
    add r0, r4, r0
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
