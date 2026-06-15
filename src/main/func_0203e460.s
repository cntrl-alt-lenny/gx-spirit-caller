; func_0203e460 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203c85c
        .extern func_0207bc20
        .global func_0203e460
        .arm
func_0203e460:
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
    bls .L_b0
.L_90:
    add r0, r5, r2, lsl #0x2
    ldrb r0, [r0, #0x444]
    cmp r0, #0x0
    beq .L_b0
    add r0, r2, #0x1
    and r2, r0, #0xff
    cmp r2, r1
    bcc .L_90
.L_b0:
    cmp r4, #0x6
    bne .L_e8
    cmp r1, r2
    bne .L_120
    cmp r2, #0x0
    bne .L_d4
    mov r0, #0x5
    bl func_0203c85c
    b .L_dc
.L_d4:
    mov r0, #0x6
    bl func_0203c85c
.L_dc:
    add sp, sp, #0x4
    mov r0, #0x11
    ldmia sp!, {r4, r5, pc}
.L_e8:
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
.L_120:
    strb r2, [r5, #0xd13]
    bl func_0207bc20
    cmp r0, #0x1
    strneb r4, [r5, #0xd0e]
    movne r4, #0x7
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
