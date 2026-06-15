; func_ov005_021abcc4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .global func_ov005_021abcc4
        .arm
func_ov005_021abcc4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r5, r0
    ldrh r0, [r5, #0x14]
    mov r4, r2, asr #0x3
    mov r4, r4, lsl #0x5
    mul r4, r0, r4
    add r1, r5, r1, lsl #0x2
    ands sl, r2, #0x7
    ldr r2, [r1, #0x18]
    add r1, r4, sl, lsl #0x2
    mov r4, r3
    add r7, r2, r1
    beq .L_78
    cmp r0, #0x0
    mov r8, #0x0
    ble .L_70
    rsb r0, sl, #0x8
    mov r9, r0, lsl #0x2
    mov r6, r8
.L_4c:
    mov r0, r6
    mov r1, r7
    mov r2, r9
    bl Fill32
    ldrh r0, [r5, #0x14]
    add r8, r8, #0x1
    add r7, r7, #0x20
    cmp r8, r0
    blt .L_4c
.L_70:
    rsb r1, sl, #0x8
    sub r4, r4, r1
.L_78:
    mov r1, r4, asr #0x2
    add r1, r4, r1, lsr #0x1d
    mov r8, r1, asr #0x3
    cmp r8, #0x0
    ble .L_b0
    mov r6, r8, lsl #0x5
    mul r2, r0, r6
    sub r7, r7, sl, lsl #0x2
    mov r1, r7
    mov r0, #0x0
    bl Fill32
    ldrh r0, [r5, #0x14]
    sub r4, r4, r8, lsl #0x3
    mla r7, r0, r6, r7
.L_b0:
    cmp r4, #0x0
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r8, #0x0
    cmp r0, #0x0
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r6, r4, lsl #0x2
    mov r4, r8
.L_cc:
    mov r0, r4
    mov r1, r7
    mov r2, r6
    bl Fill32
    ldrh r0, [r5, #0x14]
    add r8, r8, #0x1
    add r7, r7, #0x20
    cmp r8, r0
    blt .L_cc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
