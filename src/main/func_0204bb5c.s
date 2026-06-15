; func_0204bb5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020498f0
        .extern func_020529e8
        .extern func_020930b0
        .global func_0204bb5c
        .arm
func_0204bb5c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r4, r1
    mov r5, r0
    cmp r4, #0x2
    beq .L_ab0
    cmp r4, #0x3
    beq .L_b28
    b .L_b4c
.L_ab0:
    bl func_020498f0
    mov r6, r0
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    add r0, r6, r0
    ldrb r0, [r0, #0x2d0]
    mov r6, #0x1
    cmp r5, r0
    moveq r0, #0x1
    streqb r0, [sp]
    movne r0, #0x0
    strneb r0, [sp]
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1
    bcc .L_b4c
.L_af0:
    bl func_020498f0
    add r0, r0, r6
    ldrb r0, [r0, #0x2d0]
    cmp r5, r0
    streqb r6, [sp, #0x1]
    streqb r5, [sp, #0x2]
    beq .L_b4c
    add r0, r6, #0x1
    and r6, r0, #0xff
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r6, r0
    bls .L_af0
    b .L_b4c
.L_b28:
    bl func_020498f0
    add r0, r0, #0x100
    ldrh r0, [r0, #0xb0]
    strb r0, [sp]
    bl func_020498f0
    add r0, r0, #0x100
    ldrh r0, [r0, #0xb0]
    mov r0, r0, asr #0x8
    strb r0, [sp, #0x1]
.L_b4c:
    add r2, sp, #0x0
    mov r0, r4
    mov r1, r5
    mov r3, #0x4
    bl func_020529e8
    bl func_020498f0
    mov r4, r0
    bl func_020930b0
    str r0, [r4, #0x1e0]
    str r1, [r4, #0x1e4]
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
