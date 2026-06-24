; func_0204bae8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204987c
        .extern func_02052974
        .extern func_02092fc8
        .global func_0204bae8
        .arm
func_0204bae8:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r4, r1
    mov r5, r0
    cmp r4, #0x2
    beq .L_2b0
    cmp r4, #0x3
    beq .L_328
    b .L_34c
.L_2b0:
    bl func_0204987c
    mov r6, r0
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    add r0, r6, r0
    ldrb r0, [r0, #0x2c8]
    mov r6, #0x1
    cmp r5, r0
    moveq r0, #0x1
    streqb r0, [sp]
    movne r0, #0x0
    strneb r0, [sp]
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1
    bcc .L_34c
.L_2f0:
    bl func_0204987c
    add r0, r0, r6
    ldrb r0, [r0, #0x2c8]
    cmp r5, r0
    streqb r6, [sp, #0x1]
    streqb r5, [sp, #0x2]
    beq .L_34c
    add r0, r6, #0x1
    and r6, r0, #0xff
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r6, r0
    bls .L_2f0
    b .L_34c
.L_328:
    bl func_0204987c
    add r0, r0, #0x100
    ldrh r0, [r0, #0xa8]
    strb r0, [sp]
    bl func_0204987c
    add r0, r0, #0x100
    ldrh r0, [r0, #0xa8]
    mov r0, r0, asr #0x8
    strb r0, [sp, #0x1]
.L_34c:
    add r2, sp, #0x0
    mov r0, r4
    mov r1, r5
    mov r3, #0x4
    bl func_02052974
    bl func_0204987c
    mov r4, r0
    bl func_02092fc8
    str r0, [r4, #0x1d8]
    str r1, [r4, #0x1dc]
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
