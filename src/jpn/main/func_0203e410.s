; func_0203e410 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203c80c
        .extern func_0207bb38
        .global func_0203e410
        .arm
func_0203e410:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r1
    cmp r4, #0x11
    mov r5, r0
    addeq sp, sp, #0x4
    moveq r0, r4
    ldmeqia sp!, {r4, r5, pc}
    ldrb r1, [r5, #0xd12]
    mov r2, #0x0
    cmp r1, #0x0
    bls .L_50
.L_30:
    add r0, r5, r2, lsl #0x2
    ldrb r0, [r0, #0x444]
    cmp r0, #0x0
    beq .L_50
    add r0, r2, #0x1
    and r2, r0, #0xff
    cmp r2, r1
    bcc .L_30
.L_50:
    cmp r4, #0x6
    bne .L_88
    cmp r1, r2
    bne .L_c0
    cmp r2, #0x0
    bne .L_74
    mov r0, #0x5
    bl func_0203c80c
    b .L_7c
.L_74:
    mov r0, #0x6
    bl func_0203c80c
.L_7c:
    add sp, sp, #0x4
    mov r0, #0x11
    ldmia sp!, {r4, r5, pc}
.L_88:
    cmp r1, #0x0
    addeq sp, sp, #0x4
    moveq r0, r4
    ldmeqia sp!, {r4, r5, pc}
    cmp r1, r2
    addeq sp, sp, #0x4
    moveq r0, r4
    ldmeqia sp!, {r4, r5, pc}
    add r0, r5, r2, lsl #0x2
    ldrb r0, [r0, #0x446]
    cmp r0, #0x14
    addcc sp, sp, #0x4
    movcc r0, r4
    ldmccia sp!, {r4, r5, pc}
.L_c0:
    strb r2, [r5, #0xd13]
    bl func_0207bb38
    cmp r0, #0x1
    strneb r4, [r5, #0xd0e]
    movne r4, #0x7
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
