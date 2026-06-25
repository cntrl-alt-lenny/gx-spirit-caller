; func_02036c1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b680
        .global func_02036c1c
        .arm
func_02036c1c:
    stmdb sp!, {r3, r4, r5, lr}
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrsb r2, [r0, #0x6a]
    cmp r2, #0x4
    blt .L_30
    cmp r2, #0x14
    movge ip, #0x14
    movge r5, #0x1c
    movlt ip, #0x4
    movlt r5, #0x14
    b .L_38
.L_30:
    mov ip, #0x0
    mov r5, #0x4
.L_38:
    ldr r3, _LIT0
    mov r2, #0x78
    mla r3, ip, r2, r3
    ldrsb r4, [r0, #0x6f]
    mov lr, #0x0
    cmp r4, #0x0
    movlt r4, #0xff
.L_54:
    ldrsb r2, [r3, #0x6a]
    cmp r2, #0x0
    blt .L_80
    ldrh r2, [r3, #0x68]
    tst r2, #0x2000
    bne .L_80
    ldrsb r2, [r3, #0x6f]
    add lr, lr, #0x1
    cmp r2, r4
    subge r2, r2, #0x1
    strgeb r2, [r3, #0x6f]
.L_80:
    add ip, ip, #0x1
    cmp ip, r5
    add r3, r3, #0x78
    blt .L_54
    strb lr, [r0, #0x6f]
    ldrsb r5, [r0, #0x6e]
    mov ip, #0x0
    ldr r3, [r0, #0x34]
    cmp r5, #0x0
    ldr lr, _LIT0
    movlt r5, #0xff
    mov r4, ip
.L_b0:
    ldrsb r2, [lr, #0x6a]
    cmp r2, #0x0
    blt .L_dc
    ldr r2, [lr, #0x34]
    cmp r2, r3
    bne .L_dc
    ldrsb r2, [lr, #0x6e]
    add ip, ip, #0x1
    cmp r2, r5
    subge r2, r2, #0x1
    strgeb r2, [lr, #0x6e]
.L_dc:
    add r4, r4, #0x1
    cmp r4, #0x1c
    add lr, lr, #0x78
    blt .L_b0
    strb ip, [r0, #0x6e]
    cmp r1, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mvn r1, #0x0
    strb r1, [r0, #0x6f]
    ldrsb r1, [r0, #0x6f]
    strb r1, [r0, #0x6e]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_0219b680
