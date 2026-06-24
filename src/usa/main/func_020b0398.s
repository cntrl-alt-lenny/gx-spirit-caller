; func_020b0398 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b3714
        .extern func_020b3720
        .global func_020b0398
        .arm
func_020b0398:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    mov r0, #0x0
    mov r8, r2
    strb r0, [sl]
    mov r9, r1
    cmp r8, #0x0
    strb r0, [sl, #0x4]
    cmpeq r9, #0x0
    beq .L_8c
    mov r6, #0xa
    mov fp, r0
    mov r5, r0
    mov r4, r0
.L_38:
    ldrb r1, [sl, #0x4]
    mov r0, r9
    mov r2, r6
    add r3, r1, #0x1
    mov r7, r1
    strb r3, [sl, #0x4]
    mov r1, r8
    mov r3, fp
    bl func_020b3720
    add r1, sl, r7
    strb r0, [r1, #0x5]
    mov r0, r9
    mov r1, r8
    mov r2, #0xa
    mov r3, #0x0
    bl func_020b3714
    mov r8, r1
    mov r9, r0
    cmp r8, r5
    cmpeq r9, r4
    bne .L_38
.L_8c:
    ldrb r0, [sl, #0x4]
    add r2, sl, #0x5
    add r0, r2, r0
    sub r3, r0, #0x1
    cmp r2, r3
    bcs .L_bc
.L_a4:
    ldrb r0, [r3]
    ldrb r1, [r2]
    strb r0, [r2], #0x1
    strb r1, [r3], #-1
    cmp r2, r3
    bcc .L_a4
.L_bc:
    ldrb r0, [sl, #0x4]
    sub r0, r0, #0x1
    strh r0, [sl, #0x2]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
