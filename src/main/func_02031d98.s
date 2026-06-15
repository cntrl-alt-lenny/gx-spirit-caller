; func_02031d98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219adb8
        .extern data_0219adcc
        .extern data_0219b27c
        .extern func_020318a4
        .extern func_02031ab0
        .extern func_02031ba0
        .global func_02031d98
        .arm
func_02031d98:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r4, _LIT0
    mov r8, #0x0
    mov r6, r4
.L_10:
    ldr r1, [r6, #0x34]
    add r5, r6, #0x30
    cmp r1, r5
    beq .L_38
.L_20:
    ldr r7, [r1, #0x4]
    mov r0, r6
    bl func_02031ab0
    mov r1, r7
    cmp r7, r5
    bne .L_20
.L_38:
    add r0, r6, #0x30
    bl func_020318a4
    add r8, r8, #0x1
    cmp r8, #0xc
    add r6, r6, #0x64
    blt .L_10
    ldr r6, _LIT1
    mov r5, #0x0
.L_58:
    ldr r1, [r4, #0x60]
    ldr r0, [r6, #0x8]
    tst r1, r0
    bne .L_a8
    ldr r0, [r4, #0x4]
    cmp r0, r4
    beq .L_a8
.L_74:
    ldr r1, [r0, #0x2c]
    tst r1, #0x30
    ldrne r0, [r0, #0x4]
    bne .L_a0
    ldr r1, [r0, #0x4]
    str r1, [r6]
    ldr r1, [r0, #0x8]
    cmp r1, #0x0
    beq .L_9c
    blx r1
.L_9c:
    ldr r0, [r6]
.L_a0:
    cmp r0, r4
    bne .L_74
.L_a8:
    add r5, r5, #0x1
    cmp r5, #0xc
    add r4, r4, #0x64
    blt .L_58
    ldr r0, _LIT1
    ldr r4, _LIT2
    ldr r0, [r0, #0x4c8]
    cmp r0, r4
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
.L_cc:
    bl func_02031ba0
    cmp r0, r4
    bne .L_cc
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_0219adcc
_LIT1: .word data_0219adb8
_LIT2: .word data_0219b27c
