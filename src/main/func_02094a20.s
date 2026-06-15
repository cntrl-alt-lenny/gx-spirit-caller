; func_02094a20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02094a20
        .arm
func_02094a20:
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
    blt .L_33c
    mov r0, #0x3
.L_284:
    mov r7, r1
    ldrb lr, [r1]
    b .L_2a0
.L_290:
    add r8, r8, #0x1
    sub ip, r1, r8
    cmp ip, #0x2
    blt .L_33c
.L_2a0:
    ldrb r6, [r8]
    cmp lr, r6
    bne .L_290
    ldrb r9, [r7, #0x1]
    ldrb r6, [r8, #0x1]
    cmp r9, r6
    bne .L_290
    ldrb r9, [r7, #0x2]
    ldrb r6, [r8, #0x2]
    cmp r9, r6
    bne .L_290
    mov lr, r0
    add r6, r8, #0x3
    add r7, r7, #0x3
    b .L_2f4
.L_2dc:
    add r9, lr, #0x1
    and lr, r9, #0xff
    cmp lr, #0x12
    add r7, r7, #0x1
    add r6, r6, #0x1
    beq .L_310
.L_2f4:
    sub r9, r7, r1
    cmp r9, r2
    bcs .L_310
    ldrb sl, [r7]
    ldrb r9, [r6]
    cmp sl, r9
    beq .L_2dc
.L_310:
    cmp lr, r4
    bls .L_32c
    mov r5, ip, lsl #0x10
    mov r4, lr
    cmp lr, #0x12
    mov r5, r5, lsr #0x10
    beq .L_33c
.L_32c:
    add r8, r8, #0x1
    sub ip, r1, r8
    cmp ip, #0x2
    bge .L_284
.L_33c:
    cmp r4, #0x3
    movcc r0, #0x0
    movcs r0, r4
    strcsh r5, [r3]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bx lr
