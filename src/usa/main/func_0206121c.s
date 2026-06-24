; func_0206121c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0206121c
        .arm
func_0206121c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    ldrb r4, [r0]
    mov r6, #0x0
    mov r5, #0x1
    and lr, r4, #0x1
    mov r3, r6
    mov ip, r5
    mov r1, r6
    mov r2, r5
.L_2a0:
    sub r7, r5, #0x1
    ldrb r9, [r0, r7]
    cmp r9, r4
    eor r9, r5, r9
    movcc r7, ip
    and r9, r9, #0x1
    movcs r7, r3
    cmp r4, #0x4f
    movcc r8, r2
    eor r6, r6, r9
    movcs r8, r1
    eor r6, lr, r6
    eor r6, r6, r8
    eors r6, r6, r7
    beq .L_2e8
    ldrb r7, [r0, r5]
    ands r7, r7, #0x1
    beq .L_300
.L_2e8:
    cmp r6, #0x0
    bne .L_30c
    ldrb r7, [r0, r5]
    and r7, r7, #0x1
    cmp r7, #0x1
    bne .L_30c
.L_300:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_30c:
    add r5, r5, #0x1
    cmp r5, #0x20
    blt .L_2a0
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
