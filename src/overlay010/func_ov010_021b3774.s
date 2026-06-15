; func_ov010_021b3774 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02006110
        .extern func_02006194
        .extern func_02037208
        .extern func_0207ec28
        .extern func_0207f934
        .extern func_0207fd28
        .extern func_020b3870
        .extern func_ov010_021b3a14
        .global func_ov010_021b3774
        .arm
func_ov010_021b3774:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x1c
    mov r9, r0
    mov r0, r2
    mov r8, r1
    mov r7, r3
    bl func_0207ec28
    ldr r1, [r9, #0x70]
    mov r4, r0
    cmp r1, #0x0
    ldr r6, [r9, #0x5c]
    mov r5, #0x0
    ble .L_dc
    subs r0, r1, r8
    str r0, [r9, #0x70]
    strmi r5, [r9, #0x70]
    ldr r3, [r9, #0x70]
    ldr r0, [r9, #0x68]
    rsb r2, r3, #0x5000
    cmp r0, #0x2
    beq .L_60
    cmp r0, #0x3
    beq .L_a0
    b .L_174
.L_60:
    ldrsh r0, [r9, #0x6c]
    ldr r1, _LIT0
    cmp r3, #0x0
    rsb r0, r0, #0x0
    mul r2, r0, r2
    smull r0, r5, r1, r2
    mov r0, r2, lsr #0x1f
    add r5, r0, r5, asr #0x1
    bne .L_174
    ldr r1, [r9, #0x5c]
    mov r0, #0x1
    sub r1, r1, #0x1
    str r1, [r9, #0x5c]
    str r0, [r9, #0x68]
    mov r5, #0x0
    b .L_174
.L_a0:
    ldrsh r0, [r9, #0x6c]
    ldr r1, _LIT0
    cmp r3, #0x0
    mul r2, r0, r2
    smull r0, r5, r1, r2
    mov r0, r2, lsr #0x1f
    add r5, r0, r5, asr #0x1
    bne .L_174
    ldr r1, [r9, #0x5c]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r9, #0x5c]
    str r0, [r9, #0x68]
    mov r5, #0x0
    b .L_174
.L_dc:
    ldr r0, [r9, #0x74]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    bne .L_16c
    bl func_02006194
    cmp r0, #0x0
    beq .L_160
    add r0, sp, #0x10
    add r1, sp, #0xc
    bl func_02006110
    ldrsh r0, [r9, #0x54]
    ldr r1, [sp, #0x10]
    cmp r1, r0
    blt .L_154
    ldrsh r0, [r9, #0x58]
    cmp r1, r0
    bgt .L_154
    ldrsh r3, [r9, #0x56]
    ldr r2, [sp, #0xc]
    cmp r2, r3
    blt .L_154
    ldrsh r0, [r9, #0x5a]
    cmp r2, r0
    bgt .L_154
    ldrsh r1, [r9, #0x6c]
    sub r0, r2, r3
    bl func_020b3870
    mov r1, r0
    mov r0, r9
    bl func_ov010_021b3a14
.L_154:
    mov r0, #0x4
    str r0, [r9, #0x68]
    b .L_174
.L_160:
    mov r0, #0x1
    str r0, [r9, #0x68]
    b .L_174
.L_16c:
    mov r0, #0x1
    str r0, [r9, #0x68]
.L_174:
    ldr r0, [r9, #0x60]
    ldr r1, [r9, #0x5c]
    cmp r1, r0
    strlt r0, [r9, #0x5c]
    blt .L_194
    ldr r0, [r9, #0x64]
    cmp r1, r0
    strgt r0, [r9, #0x5c]
.L_194:
    ldr r0, [r9, #0x5c]
    cmp r6, r0
    beq .L_1b4
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_1b4:
    mov r0, r9
    mov r1, r8
    bl func_0207fd28
    ldrsh r0, [r9, #0x54]
    mov r1, r4, lsl #0x10
    ldr r2, [r9, #0x2c]
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x14]
    ldrsh r6, [r9, #0x56]
    ldrsh r4, [r9, #0x6c]
    ldr r3, [r9, #0x5c]
    add r0, sp, #0x14
    mla r3, r4, r3, r6
    add r3, r5, r3, lsl #0xc
    str r3, [sp, #0x18]
    str r0, [sp]
    mov r3, #0x0
    str r3, [sp, #0x4]
    str r3, [sp, #0x8]
    ldr r0, [r7]
    mov r1, r1, lsr #0x10
    bl func_0207f934
    ldr r1, [r7]
    add r1, r1, r0, lsl #0x3
    str r1, [r7]
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x66666667
