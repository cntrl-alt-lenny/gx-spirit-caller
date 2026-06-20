; func_ov002_022ac8f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_022ac8f0
        .global func_ov002_022ac8f0
        .arm
func_ov002_022ac8f0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r5, r1
    mov r4, r2
    mov r6, r0
    cmp r5, r4
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    add r8, r5, r4
    mov r7, r8, asr #0x1
    mov r2, r7
    bl func_ov002_022ac8f0
    mov r0, r6
    mov r2, r4
    add r1, r7, #0x1
    bl func_ov002_022ac8f0
    mov r3, r5
    cmp r5, r8, asr #0x1
    mov r1, #0x0
    bgt .L_68
.L_48:
    ldr r0, [r6, #0x68]
    ldr r2, [r0, r3, lsl #0x2]
    ldr r0, [r6, #0x6c]
    add r3, r3, #0x1
    str r2, [r0, r1, lsl #0x2]
    cmp r3, r7
    add r1, r1, #0x1
    ble .L_48
.L_68:
    add r3, r7, #0x1
    mov r2, #0x0
    b .L_c0
.L_74:
    ldr r0, [r6, #0x68]
    ldr r9, [r6, #0x6c]
    add r7, r0, r3, lsl #0x2
    add ip, r9, r2, lsl #0x2
    ldrh lr, [ip, #0x2]
    ldrh r7, [r7, #0x2]
    mov r8, r2, lsl #0x2
    mov ip, r3, lsl #0x2
    cmp lr, r7
    bhi .L_b0
    ldr r7, [r9, r8]
    add r2, r2, #0x1
    str r7, [r0, r5, lsl #0x2]
    add r5, r5, #0x1
    b .L_c0
.L_b0:
    ldr r7, [r0, ip]
    add r3, r3, #0x1
    str r7, [r0, r5, lsl #0x2]
    add r5, r5, #0x1
.L_c0:
    cmp r3, r4
    bgt .L_d0
    cmp r2, r1
    blt .L_74
.L_d0:
    cmp r2, r1
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_d8:
    ldr r0, [r6, #0x6c]
    ldr r3, [r0, r2, lsl #0x2]
    ldr r0, [r6, #0x68]
    add r2, r2, #0x1
    str r3, [r0, r5, lsl #0x2]
    cmp r2, r1
    add r5, r5, #0x1
    blt .L_d8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
