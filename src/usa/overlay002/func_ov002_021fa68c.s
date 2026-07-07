; func_ov002_021fa68c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021af8f0
        .extern func_ov002_021aff6c
        .extern func_ov002_021d8038
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_021f4994
        .extern func_ov002_022576f4
        .global func_ov002_021fa68c
        .arm
func_ov002_021fa68c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r2, _LIT0
    mov r5, r0
    ldr r2, [r2, #0x5b4]
    cmp r2, #0x7
    addls pc, pc, r2, lsl #0x2
    b .L_2a4
    b .L_198
    b .L_198
    b .L_198
    b .L_2a4
    b .L_2a4
    b .L_1b8
    b .L_1e4
    b .L_240
.L_198:
    bl func_ov002_021f4994
    cmp r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT0
    mov r1, #0x5
    str r1, [r0, #0x5b4]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1b8:
    ldrh r0, [r5, #0x2]
    mov r1, #0x56
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1e4:
    bl func_ov002_022576f4
    cmp r0, #0x5
    movlt r1, r0
    movge r1, #0x5
    cmp r1, #0x20
    bge .L_208
    cmp r0, #0x5
    movge r0, #0x5
    b .L_20c
.L_208:
    mov r0, #0x20
.L_20c:
    ldrh r3, [r5, #0x2]
    add r1, r0, #0x27
    ldrh r2, [r5]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af8f0
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_240:
    bl func_ov002_021e2a4c
    ldr r6, _LIT1
    mov r4, #0x0
    ldr r0, [r6, #0xd44]
    cmp r0, #0x0
    bls .L_28c
    mov r7, r4
.L_25c:
    add r0, r4, #0x1
    bl func_ov002_021aff6c
    ldrh r3, [r5, #0x2]
    mov r1, r0
    mov r2, r7
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d8038
    ldr r0, [r6, #0xd44]
    add r4, r4, #0x1
    cmp r4, r0
    bcc .L_25c
.L_28c:
    bl func_ov002_021e2b6c
    ldr r1, _LIT1
    mov r0, #0x1
    ldr r1, [r1, #0xd44]
    strh r1, [r5, #0xc]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2a4:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d008c
