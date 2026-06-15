; func_02055a84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffc10
        .extern data_020ffc40
        .extern data_020ffc4c
        .extern data_020ffd04
        .extern data_020ffd14
        .extern data_020ffd20
        .extern data_020ffd30
        .extern func_02058038
        .extern func_02058070
        .extern func_0205ffc0
        .extern func_020604b0
        .global func_02055a84
        .arm
func_02055a84:
    stmdb sp!, {r4, r5, r6, lr}
    ldr ip, _LIT0
    sub sp, sp, ip
    movs r6, r0
    mov r5, r1
    beq .L_778
    ldr r4, [r6]
    cmp r4, #0x0
    bne .L_788
.L_778:
    ldr ip, _LIT0
    mov r0, #0x2
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, pc}
.L_788:
    ldr r1, [r4, #0x108]
    cmp r1, #0x0
    ldrne ip, _LIT0
    movne r0, #0x0
    addne sp, sp, ip
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r1, [r4, #0x1d8]
    cmp r1, #0x4
    bne .L_7c4
    ldr r1, _LIT1
    bl func_0205ffc0
    ldr ip, _LIT0
    mov r0, #0x2
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, pc}
.L_7c4:
    cmp r2, #0x0
    bne .L_7e4
    ldr r1, _LIT2
    bl func_0205ffc0
    ldr ip, _LIT0
    mov r0, #0x2
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, pc}
.L_7e4:
    mov r1, r2
    ldr r2, _LIT3
    add r0, sp, #0x0
    bl func_020604b0
    ldrsb r0, [sp]
    cmp r0, #0x0
    beq .L_820
    add r2, sp, #0x0
    mov r1, #0x2f
.L_808:
    ldrsb r0, [r2]
    cmp r0, #0x5c
    streqb r1, [r2]
    ldrsb r0, [r2, #0x1]!
    cmp r0, #0x0
    bne .L_808
.L_820:
    ldr r2, _LIT4
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02058070
    ldr r2, _LIT5
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02058070
    ldr r2, [r4, #0x198]
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02058038
    ldr r2, _LIT6
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02058070
    mov r2, r5
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02058038
    ldr r2, _LIT7
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02058070
    mov r0, r6
    add r1, r4, #0x1f4
    add r2, sp, #0x0
    bl func_02058070
    ldr r2, _LIT8
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02058070
    mov r0, #0x0
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000408
_LIT1: .word data_020ffc10
_LIT2: .word data_020ffd04
_LIT3: .word 0x00000401
_LIT4: .word data_020ffd14
_LIT5: .word data_020ffc40
_LIT6: .word data_020ffd20
_LIT7: .word data_020ffd30
_LIT8: .word data_020ffc4c
