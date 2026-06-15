; func_0201f874 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02191f40
        .extern data_02191fc0
        .extern data_02192020
        .extern func_0201f19c
        .extern func_0201f954
        .extern func_02093bfc
        .extern func_0209e308
        .extern func_0209e4f8
        .extern func_0209ecc8
        .global func_0201f874
        .arm
func_0201f874:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r0, [r0, #0x30]
    cmp r0, #0x2
    beq .L_a0
    bl func_02093bfc
    movs r0, #0x0
.L_a0:
    bl func_0209e4f8
    cmp r0, #0x8000
    bne .L_bc
    mov r0, #0x3
    bl func_0201f19c
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_bc:
    cmp r0, #0x0
    bne .L_d4
    mov r0, #0x16
    bl func_0201f19c
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_d4:
    ldr r1, _LIT0
    ldrh r2, [r1, #0x2]
    cmp r2, #0x0
    bne .L_118
    mov ip, #0x1
    mov r3, ip
.L_ec:
    ldrh r2, [r1, #0x84]
    add r2, r2, #0x1
    strh r2, [r1, #0x84]
    ldrh r2, [r1, #0x84]
    cmp r2, #0x10
    strhih ip, [r1, #0x84]
    ldrh r2, [r1, #0x84]
    sub r2, r2, #0x1
    tst r0, r3, lsl r2
    bne .L_11c
    b .L_ec
.L_118:
    strh r2, [r1, #0x84]
.L_11c:
    bl func_0209e308
    ldr r2, _LIT0
    ldr r3, _LIT1
    strh r0, [r2, #0x86]
    ldr r0, _LIT2
    ldr r1, _LIT3
    str r3, [r2, #0x80]
    bl func_0209ecc8
    cmp r0, #0x2
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    bl func_0201f19c
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_02191f40
_LIT1: .word data_02192020
_LIT2: .word func_0201f954
_LIT3: .word data_02191fc0
