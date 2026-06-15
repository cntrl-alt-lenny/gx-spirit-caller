; func_02000950 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02000950
        .arm
func_02000950:
    cmp r0, #0x0
    beq .L_a8
    stmdb sp!, {r4, r5, r6, r7}
    ldmdb r0, {r1, r2}
    add r2, r0, r2
    sub r3, r0, r1, lsr #0x18
    bic r1, r1, #-16777216
    sub r1, r0, r1
    mov r4, r2
.L_24:
    cmp r3, r1
    ble .L_84
    ldrb r5, [r3, #-1]!
    mov r6, #0x8
.L_34:
    subs r6, r6, #0x1
    blt .L_24
    tst r5, #0x80
    bne .L_50
    ldrb r0, [r3, #-1]!
    strb r0, [r2, #-1]!
    b .L_78
.L_50:
    ldrb ip, [r3, #-1]!
    ldrb r7, [r3, #-1]!
    orr r7, r7, ip, lsl #0x8
    bic r7, r7, #0xf000
    add r7, r7, #0x2
    add ip, ip, #0x20
.L_68:
    ldrb r0, [r2, r7]
    strb r0, [r2, #-1]!
    subs ip, ip, #0x10
    bge .L_68
.L_78:
    cmp r3, r1
    mov r5, r5, lsl #0x1
    bgt .L_34
.L_84:
    mov r0, #0x0
    bic r3, r1, #0x1f
.L_8c:
    mcr p15, 0, r0, c7, c10, 4
    mcr p15, 0, r3, c7, c5, 1
    mcr p15, 0, r3, c7, c14, 1
    add r3, r3, #0x20
    cmp r3, r4
    blt .L_8c
    ldmia sp!, {r4, r5, r6, r7}
.L_a8:
    bx lr
