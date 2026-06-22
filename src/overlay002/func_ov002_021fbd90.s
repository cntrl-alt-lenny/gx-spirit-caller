; func_ov002_021fbd90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021b004c
        .extern func_ov002_021d8128
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .global func_ov002_021fbd90
        .arm
func_ov002_021fbd90:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r1, _LIT0
    mov r5, r0
    ldr r0, [r1, #0x5b4]
    cmp r0, #0x0
    beq .L_1b4
    cmp r0, #0x1
    beq .L_1e0
    cmp r0, #0x2
    beq .L_214
    b .L_278
.L_1b4:
    ldrh r0, [r5, #0x2]
    mov r1, #0x56
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1e0:
    ldrh r0, [r5, #0x2]
    ldrh r2, [r5]
    mov r1, #0x47
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af9d0
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_214:
    bl func_ov002_021e2b3c
    ldr r6, _LIT1
    mov r4, #0x0
    ldr r0, [r6, #0xd44]
    cmp r0, #0x0
    bls .L_260
    mov r7, r4
.L_230:
    add r0, r4, #0x1
    bl func_ov002_021b004c
    ldrh r3, [r5, #0x2]
    mov r1, r0
    mov r2, r7
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d8128
    ldr r0, [r6, #0xd44]
    add r4, r4, #0x1
    cmp r4, r0
    bcc .L_230
.L_260:
    bl func_ov002_021e2c5c
    ldr r1, _LIT1
    mov r0, #0x1
    ldr r1, [r1, #0xd44]
    strh r1, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_278:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d016c
