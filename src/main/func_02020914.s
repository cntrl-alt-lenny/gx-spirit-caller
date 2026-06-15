; func_02020914 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c65b4
        .extern data_020c65cc
        .extern data_020c6810
        .extern data_02191f40
        .extern func_0201f138
        .extern func_0201f1b8
        .extern func_02093bfc
        .extern func_0209e3ac
        .global func_02020914
        .arm
func_02020914:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r3, _LIT0
    mov r6, r0
    ldr r0, [r3, #0x30]
    mov r5, r1
    mov r4, r2
    cmp r0, #0x1
    beq .L_bc
    bl func_02093bfc
    movs r0, #0x0
.L_bc:
    ldr r0, _LIT0
    mov r1, #0x80
    str r1, [r0, #0x10]
    mov r2, #0x20
    str r2, [r0, #0x3c]
    ldr r2, [r0, #0x38]
    cmp r2, #0x0
    beq .L_e4
    ldr r0, _LIT1
    blx r2
.L_e4:
    ldr r0, _LIT0
    ldr r2, [r0, #0x38]
    cmp r2, #0x0
    beq .L_100
    ldr r1, [r0, #0x3c]
    ldr r0, _LIT2
    blx r2
.L_100:
    ldr r1, _LIT0
    mov r0, #0x3
    str r6, [r1, #0x40]
    bl func_0201f138
    ldr r0, _LIT0
    strh r5, [r0, #0xac]
    strh r4, [r0, #0xd2]
    bl func_0209e3ac
    ldr r1, _LIT0
    mov r2, #0x10
    strh r0, [r1, #0xb8]
    strh r2, [r1, #0xd4]
    strh r2, [r1, #0xd6]
    mov r2, #0x1
    strh r2, [r1, #0xb0]
    mov r0, #0x0
    strh r0, [r1, #0xb6]
    strh r0, [r1, #0xb2]
    strh r2, [r1, #0xae]
    cmp r6, #0x2
    movne r2, r0
    ldr r0, _LIT0
    cmp r6, #0x0
    cmpne r6, #0x2
    strh r2, [r0, #0xb4]
    cmpne r6, #0x4
    bne .L_174
    bl func_0201f1b8
    ldmia sp!, {r4, r5, r6, pc}
.L_174:
    ldr r2, [r0, #0x38]
    cmp r2, #0x0
    beq .L_18c
    ldr r0, _LIT3
    mov r1, r6
    blx r2
.L_18c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02191f40
_LIT1: .word data_020c65b4
_LIT2: .word data_020c65cc
_LIT3: .word data_020c6810
