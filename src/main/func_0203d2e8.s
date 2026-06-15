; func_0203d2e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203c900
        .extern func_0203f6a0
        .extern func_0203f740
        .global func_0203d2e8
        .arm
func_0203d2e8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r0, #0x10
    bl func_0203c900
    mov r4, r0
    ldrb r0, [r4, #0xd0c]
    mov r0, r0, lsl #0x1c
    movs r0, r0, lsr #0x1c
    beq .L_238
    cmp r0, #0x4
    bne .L_268
.L_238:
    ldrh r0, [r5, #0x2c]
    mov r0, r0, asr #0x4
    and r0, r0, #0x1
    and r0, r0, #0xff
    cmp r0, #0x1
    bne .L_268
    add r0, r5, #0xc
    bl func_0203f6a0
    cmp r0, #0x1
    addeq sp, sp, #0x4
    moveq r0, #0x6
    ldmeqia sp!, {r4, r5, pc}
.L_268:
    ldrb r0, [r4, #0xd0c]
    mov r0, r0, lsl #0x1c
    movs r0, r0, lsr #0x1c
    beq .L_280
    cmp r0, #0x5
    bne .L_2b0
.L_280:
    ldrh r0, [r5, #0x2c]
    mov r0, r0, asr #0x4
    and r0, r0, #0x1
    and r0, r0, #0xff
    cmp r0, #0x1
    bne .L_2b0
    add r0, r5, #0xc
    bl func_0203f740
    cmp r0, #0x1
    addeq sp, sp, #0x4
    moveq r0, #0x7
    ldmeqia sp!, {r4, r5, pc}
.L_2b0:
    mvn r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
