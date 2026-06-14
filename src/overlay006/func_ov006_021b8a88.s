; func_ov006_021b8a88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02008f24
        .extern func_02012418
        .extern func_ov006_021b6ad8
        .global func_ov006_021b8a88
        .arm
func_ov006_021b8a88:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    mov r7, #0x0
    mov r4, #0x1
    mov r6, r7
    add r8, sl, #0x248
    add r9, sl, #0x264
    mov r5, r7
    mov fp, r4
.L_db0:
    mov r0, sl
    mov r1, r5
    mov r2, r6
    mov r3, fp
    bl func_ov006_021b6ad8
    cmp r0, #0x0
    beq .L_e20
    mov r0, #0x0
    mov r1, r6
    mov r2, r8
    bl func_02008f24
    mov r0, r9
    bl func_02012418
    mov r1, r6, asr #0x4
    add r1, r6, r1, lsr #0x1b
    add r3, sl, r6, lsl #0x1
    mov r2, r1, asr #0x5
    add r1, r3, #0x5f00
    add r3, sl, r2, lsl #0x2
    strh r0, [r1, #0xd0]
    mov r2, r6, lsr #0x1f
    add r1, r3, #0x6000
    rsb r0, r2, r6, lsl #0x1b
    ldr r3, [r1, #0xb4]
    add r0, r2, r0, ror #0x1b
    orr r0, r3, r4, lsl r0
    str r0, [r1, #0xb4]
    add r7, r7, #0x1
.L_e20:
    add r6, r6, #0x1
    cmp r6, #0x32
    add r8, r8, #0x124
    add r9, r9, #0x124
    blt .L_db0
    add r0, sl, #0x6000
    add r1, sl, #0xb50
    add r2, sl, #0x36c
    mov r4, #0x0
    str r7, [r0, #0x234]
    mov r7, #0x1
    mov r5, r4
    add r8, r1, #0x3000
    add r9, r2, #0x3800
    mov r6, r7
    mov fp, r7
.L_e60:
    mov r0, sl
    mov r1, fp
    mov r2, r5
    mov r3, fp
    bl func_ov006_021b6ad8
    cmp r0, #0x0
    beq .L_edc
    mov r0, r7
    mov r1, r5
    mov r2, r8
    bl func_02008f24
    mov r0, r9
    bl func_02012418
    mov r1, r4, asr #0x4
    add r3, sl, r4, lsl #0x1
    add r2, r4, r1, lsr #0x1b
    add r1, r3, #0x6000
    mov r2, r2, asr #0x5
    strh r0, [r1, #0x34]
    add r3, sl, r2, lsl #0x2
    mov r2, r4, lsr #0x1f
    rsb r0, r2, r4, lsl #0x1b
    strh r5, [r1, #0x74]
    add r1, r3, #0x6000
    ldr r3, [r1, #0x1b4]
    add r0, r2, r0, ror #0x1b
    orr r0, r3, r6, lsl r0
    str r0, [r1, #0x1b4]
    add r8, r8, #0x124
    add r9, r9, #0x124
    add r4, r4, #0x1
.L_edc:
    add r5, r5, #0x1
    cmp r5, #0x20
    blt .L_e60
    add r0, sl, #0x6000
    str r4, [r0, #0x238]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
