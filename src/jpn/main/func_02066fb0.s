; func_02066fb0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02067080
        .global func_02066fb0
        .arm
func_02066fb0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov r9, r1
    mov sl, r0
    mov r8, r2
    cmp r9, #0x0
    mov r7, #0x0
    ble .L_204
    mov r4, r7
    str r7, [sp]
    mov fp, r7
.L_170:
    mov r2, fp
    add r1, sp, #0x4
.L_178:
    cmp r7, r9
    ldrltb r0, [sl], #0x1
    add r2, r2, #0x1
    add r7, r7, #0x1
    strltb r0, [r1]
    strgeb r4, [r1]
    cmp r2, #0x2
    add r1, r1, #0x1
    ble .L_178
    ldrb r5, [sp, #0x4]
    ldrb r3, [sp, #0x5]
    ldrb r2, [sp, #0x6]
    and r1, r5, #0x3
    and r0, r3, #0xf
    mov r5, r5, asr #0x2
    mov r1, r1, lsl #0x4
    strb r5, [sp, #0x7]
    add r3, r1, r3, asr #0x4
    mov r0, r0, lsl #0x2
    add r1, r0, r2, asr #0x6
    and r0, r2, #0x3f
    ldr r5, [sp]
    add r6, sp, #0x7
    strb r3, [sp, #0x8]
    strb r1, [sp, #0x9]
    strb r0, [sp, #0xa]
.L_1e0:
    ldrb r0, [r6]
    bl func_02067080
    add r5, r5, #0x1
    cmp r5, #0x3
    strb r0, [r8], #0x1
    add r6, r6, #0x1
    ble .L_1e0
    cmp r7, r9
    blt .L_170
.L_204:
    mov r0, #0x0
    strb r0, [r8]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
