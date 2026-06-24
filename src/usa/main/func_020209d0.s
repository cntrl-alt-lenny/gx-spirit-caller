; func_020209d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c64d4
        .extern data_020c64ec
        .extern data_020c6730
        .extern data_02191e60
        .extern data_02191f40
        .extern func_0201f0e4
        .extern func_0201fc18
        .extern func_0201fcd0
        .extern func_0209281c
        .extern func_02092928
        .extern func_02093b08
        .extern func_02094688
        .global func_020209d0
        .arm
func_020209d0:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r5, r0
    ldr r0, [r2, #0x30]
    mov r4, r1
    cmp r0, #0x1
    beq .L_134
    bl func_02093b08
    movs r0, #0x0
.L_134:
    ldr r0, _LIT0
    mov r1, #0xc0
    str r1, [r0, #0x10]
    mov r2, #0x20
    str r2, [r0, #0x3c]
    ldr r2, [r0, #0x38]
    cmp r2, #0x0
    beq .L_15c
    ldr r0, _LIT1
    blx r2
.L_15c:
    ldr r0, _LIT0
    ldr r2, [r0, #0x38]
    cmp r2, #0x0
    beq .L_178
    ldr r1, [r0, #0x3c]
    ldr r0, _LIT2
    blx r2
.L_178:
    ldr r1, _LIT0
    mov r0, #0x3
    str r5, [r1, #0x40]
    bl func_0201f0e4
    cmp r5, #0x1
    cmpne r5, #0x3
    cmpne r5, #0x5
    bne .L_1d8
    ldr r1, _LIT3
    mov r0, r4
    mov r2, #0xc0
    bl func_02094688
    ldr r0, _LIT3
    mov r1, #0xc0
    bl func_0209281c
    bl func_02092928
    ldr r0, _LIT0
    ldr r0, [r0, #0x18]
    cmp r0, #0x0
    beq .L_1d0
    bl func_0201fc18
    ldmia sp!, {r3, r4, r5, pc}
.L_1d0:
    bl func_0201fcd0
    ldmia sp!, {r3, r4, r5, pc}
.L_1d8:
    ldr r0, _LIT0
    ldr r2, [r0, #0x38]
    cmp r2, #0x0
    beq .L_1f4
    ldr r0, _LIT4
    mov r1, r5
    blx r2
.L_1f4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02191e60
_LIT1: .word data_020c64d4
_LIT2: .word data_020c64ec
_LIT3: .word data_02191f40
_LIT4: .word data_020c6730
