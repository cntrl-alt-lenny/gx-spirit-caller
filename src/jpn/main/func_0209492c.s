; func_0209492c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0209492c
        .arm
func_0209492c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r4, #0x2
    cmp r2, #0x3
    movcc r0, #0x0
    ldmccia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bxcc lr
    sub r8, r1, #0x1000
    cmp r8, r0
    movcc r8, r0
    sub ip, r1, r8
    cmp ip, #0x2
    blt .L_ec
    mov r0, #0x3
.L_34:
    mov r7, r1
    ldrb lr, [r1]
    b .L_50
.L_40:
    add r8, r8, #0x1
    sub ip, r1, r8
    cmp ip, #0x2
    blt .L_ec
.L_50:
    ldrb r6, [r8]
    cmp lr, r6
    bne .L_40
    ldrb r9, [r7, #0x1]
    ldrb r6, [r8, #0x1]
    cmp r9, r6
    bne .L_40
    ldrb r9, [r7, #0x2]
    ldrb r6, [r8, #0x2]
    cmp r9, r6
    bne .L_40
    mov lr, r0
    add r6, r8, #0x3
    add r7, r7, #0x3
    b .L_a4
.L_8c:
    add r9, lr, #0x1
    and lr, r9, #0xff
    cmp lr, #0x12
    add r7, r7, #0x1
    add r6, r6, #0x1
    beq .L_c0
.L_a4:
    sub r9, r7, r1
    cmp r9, r2
    bcs .L_c0
    ldrb sl, [r7]
    ldrb r9, [r6]
    cmp sl, r9
    beq .L_8c
.L_c0:
    cmp lr, r4
    bls .L_dc
    mov r5, ip, lsl #0x10
    mov r4, lr
    cmp lr, #0x12
    mov r5, r5, lsr #0x10
    beq .L_ec
.L_dc:
    add r8, r8, #0x1
    sub ip, r1, r8
    cmp ip, #0x2
    bge .L_34
.L_ec:
    cmp r4, #0x3
    movcc r0, #0x0
    movcs r0, r4
    strcsh r5, [r3]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bx lr
