; func_0203724c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b2e0
        .extern data_0219b344
        .global func_0203724c
        .arm
func_0203724c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r5, #0x0
    sub r4, r5, #0x1
    ldr ip, _LIT0
    ldr r1, _LIT1
    mov lr, r4
    mov r0, r4
    mov r6, r4
    mov r7, r5
    mov r3, r5
.L_608:
    ldr r8, [ip, r7, lsl #0x2]
    cmp r8, #0x0
    beq .L_66c
    ldrsb r2, [r8, #0x6a]
    cmp r2, #0x0
    strlt r3, [ip, r7, lsl #0x2]
    blt .L_66c
    ldrh r2, [r8, #0x68]
    mov r6, r7
    add r5, r5, #0x1
    tst r2, #0x200
    beq .L_648
    mov r4, r7
    tst r2, #0x400
    orrne r4, r7, #0x80
    b .L_66c
.L_648:
    tst r2, r1
    bne .L_66c
    cmp r0, #0x0
    blt .L_664
    ldrsb r2, [r8, #0x6f]
    cmp r2, lr
    ble .L_66c
.L_664:
    ldrsb lr, [r8, #0x6f]
    mov r0, r7
.L_66c:
    add r7, r7, #0x1
    cmp r7, #0x4
    blt .L_608
    cmp r4, #0x0
    blt .L_694
    cmp r0, #0x0
    blt .L_690
    tst r4, #0x80
    bne .L_694
.L_690:
    and r0, r4, #0xf
.L_694:
    cmp r0, #0x0
    bge .L_6a4
    cmp r5, #0x1
    moveq r0, r6
.L_6a4:
    ldr r1, _LIT2
    strh r0, [r1, #0x4]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_0219b344
_LIT1: .word 0x00003003
_LIT2: .word data_0219b2e0
