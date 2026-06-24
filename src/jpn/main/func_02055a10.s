; func_02055a10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffb30
        .extern data_020ffb60
        .extern data_020ffb6c
        .extern data_020ffc24
        .extern data_020ffc34
        .extern data_020ffc40
        .extern data_020ffc50
        .extern func_02057fc4
        .extern func_02057ffc
        .extern func_0205ff4c
        .extern func_0206043c
        .global func_02055a10
        .arm
func_02055a10:
    stmdb sp!, {r4, r5, r6, lr}
    ldr ip, _LIT0
    sub sp, sp, ip
    movs r6, r0
    mov r5, r1
    beq .L_24
    ldr r4, [r6]
    cmp r4, #0x0
    bne .L_34
.L_24:
    ldr ip, _LIT0
    mov r0, #0x2
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, pc}
.L_34:
    ldr r1, [r4, #0x108]
    cmp r1, #0x0
    ldrne ip, _LIT0
    movne r0, #0x0
    addne sp, sp, ip
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r1, [r4, #0x1d8]
    cmp r1, #0x4
    bne .L_70
    ldr r1, _LIT1
    bl func_0205ff4c
    ldr ip, _LIT0
    mov r0, #0x2
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, pc}
.L_70:
    cmp r2, #0x0
    bne .L_90
    ldr r1, _LIT2
    bl func_0205ff4c
    ldr ip, _LIT0
    mov r0, #0x2
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, pc}
.L_90:
    mov r1, r2
    ldr r2, _LIT3
    add r0, sp, #0x0
    bl func_0206043c
    ldrsb r0, [sp]
    cmp r0, #0x0
    beq .L_cc
    add r2, sp, #0x0
    mov r1, #0x2f
.L_b4:
    ldrsb r0, [r2]
    cmp r0, #0x5c
    streqb r1, [r2]
    ldrsb r0, [r2, #0x1]!
    cmp r0, #0x0
    bne .L_b4
.L_cc:
    ldr r2, _LIT4
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02057ffc
    ldr r2, _LIT5
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02057ffc
    ldr r2, [r4, #0x198]
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02057fc4
    ldr r2, _LIT6
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02057ffc
    mov r2, r5
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02057fc4
    ldr r2, _LIT7
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02057ffc
    mov r0, r6
    add r1, r4, #0x1f4
    add r2, sp, #0x0
    bl func_02057ffc
    ldr r2, _LIT8
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02057ffc
    mov r0, #0x0
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000408
_LIT1: .word data_020ffb30
_LIT2: .word data_020ffc24
_LIT3: .word 0x00000401
_LIT4: .word data_020ffc34
_LIT5: .word data_020ffb60
_LIT6: .word data_020ffc40
_LIT7: .word data_020ffc50
_LIT8: .word data_020ffb6c
