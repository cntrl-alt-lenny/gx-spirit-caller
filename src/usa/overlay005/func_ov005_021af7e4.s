; func_ov005_021af7e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102bb0
        .extern data_02104e6c
        .extern func_02001cec
        .extern func_02003aa0
        .extern func_02005488
        .extern func_02094410
        .extern func_020aace8
        .extern func_ov005_021af76c
        .global func_ov005_021af7e4
        .arm
func_ov005_021af7e4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov r4, r0
    bl func_ov005_021af76c
    mov r1, #0x6600000
    add r7, r1, #0x1e80
    mov r6, r0
    mov r1, r7
    mov r0, #0x0
    mov r2, #0xd000
    bl func_02094410
    mov r1, #0x2
    ldr r0, _LIT0
    mov r2, r1
    bl func_02001cec
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    mov r0, r6
    bne .L_10c
    bl func_020aace8
    mov r2, r0, lsr #0x1
    ldr r1, _LIT2
    mov r0, r6
    umull r1, r3, r2, r1
    mov r3, r3, lsr #0x3
    str r3, [r4, #0x20]
    bl func_020aace8
    ldr r1, _LIT2
    mov r3, r0, lsr #0x1
    umull r0, r1, r3, r1
    mov r1, r1, lsr #0x3
    mov r2, #0xa
    umull r0, r1, r2, r1
    subs r1, r3, r0
    ldrne r0, [r4, #0x20]
    mov r8, #0x0
    addne r0, r0, #0x1
    strne r0, [r4, #0x20]
    mov r0, r6
    bl func_020aace8
    movs r0, r0, lsr #0x1
    beq .L_1c4
    mov r9, r8
    ldr fp, _LIT0
    mov sl, r9
    mov r5, #0x2
    mov r4, #0xc
.L_c4:
    str r5, [sp]
    str r4, [sp, #0x4]
    add r0, r6, sl
    ldrb r2, [r6, sl]
    ldrb r1, [r0, #0x1]
    mov r0, fp
    mov r3, r5
    add r1, r1, r2, lsl #0x8
    add r2, r7, r9
    bl func_02003aa0
    mov r0, r6
    add r8, r8, #0x1
    add r9, r9, #0x80
    add sl, sl, #0x2
    bl func_020aace8
    cmp r8, r0, lsr #0x1
    bcc .L_c4
    b .L_1c4
.L_10c:
    bl func_020aace8
    ldr r1, _LIT2
    umull r1, r2, r0, r1
    mov r2, r2, lsr #0x3
    mov r0, r6
    str r2, [r4, #0x20]
    bl func_020aace8
    ldr r1, _LIT2
    mov r3, #0xa
    umull r1, r2, r0, r1
    mov r2, r2, lsr #0x3
    umull r1, r2, r3, r2
    subs r2, r0, r1
    ldrne r0, [r4, #0x20]
    mov r9, #0x0
    addne r0, r0, #0x1
    strne r0, [r4, #0x20]
    mov r0, r6
    bl func_020aace8
    cmp r0, #0x0
    bls .L_1c4
    mov fp, #0xe
    mov sl, r9
    add r8, sp, #0x8
    mov r5, #0x1
    mov r4, fp
.L_174:
    ldrb r2, [r6, r9]
    mov r0, r8
    mov r1, fp
    str r2, [sp, #0x8]
    bl func_02005488
    str r5, [sp]
    rsb r0, r0, #0x10
    str r4, [sp, #0x4]
    add r0, r0, r0, lsr #0x1f
    mov r3, r0, asr #0x1
    ldrb r1, [r6, r9]
    ldr r0, _LIT0
    add r2, r7, sl
    bl func_02003aa0
    add r9, r9, #0x1
    mov r0, r6
    add sl, sl, #0x80
    bl func_020aace8
    cmp r9, r0
    bcc .L_174
.L_1c4:
    mov r0, #0x1
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02102bb0
_LIT1: .word data_02104e6c
_LIT2: .word 0xcccccccd
