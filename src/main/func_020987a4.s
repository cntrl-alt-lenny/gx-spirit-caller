; func_020987a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021aa480
        .global func_020987a4
        .arm
func_020987a4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    ldr r8, _LIT0
    mov fp, r0
    mov r9, #0x0
.L_14:
    ldr r1, [fp, #0x8]
    ldr r0, [fp, #0xc]
    ldr r5, [fp, #0x4]
    add r0, r1, r0
    mov r7, r9
    mov r6, r9
    add r4, r5, r0
    bl OS_DisableIrq
    ldr lr, [r8]
    mov sl, r9
    mov ip, lr
    cmp lr, #0x0
    beq .L_b8
.L_48:
    ldr r2, [ip, #0x8]
    ldr r3, [ip]
    cmp r2, #0x0
    ldr r1, [ip, #0x4]
    bne .L_6c
    cmp r1, r5
    bcc .L_6c
    cmp r1, r4
    bcc .L_7c
.L_6c:
    cmp r2, r5
    bcc .L_a8
    cmp r2, r4
    bcs .L_a8
.L_7c:
    cmp r6, #0x0
    strne ip, [r6]
    moveq r7, ip
    cmp lr, ip
    streq r3, [r8]
    moveq lr, r3
    str r9, [ip]
    cmp sl, #0x0
    mov r6, ip
    strne r3, [sl]
    b .L_ac
.L_a8:
    mov sl, ip
.L_ac:
    mov ip, r3
    cmp r3, #0x0
    bne .L_48
.L_b8:
    bl OS_RestoreIrq
    cmp r7, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
.L_cc:
    ldr r1, [r7, #0x4]
    ldr r4, [r7]
    cmp r1, #0x0
    beq .L_e4
    ldr r0, [r7, #0x8]
    blx r1
.L_e4:
    mov r7, r4
    cmp r4, #0x0
    bne .L_cc
    b .L_14
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_021aa480
