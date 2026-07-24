; func_02020a24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c65b4
        .extern data_020c65cc
        .extern data_020c6810
        .extern data_02191f40
        .extern data_02192020
        .extern func_0201f138
        .extern func_0201fc6c
        .extern func_0201fd24
        .extern func_02092904
        .extern DC_WaitWriteBufferEmpty
        .extern func_02093bfc
        .extern func_02094688
        .global func_02020a24
        .arm
func_02020a24:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r5, r0
    ldr r0, [r2, #0x30]
    mov r4, r1
    cmp r0, #0x1
    beq .L_1c8
    bl func_02093bfc
    movs r0, #0x0
.L_1c8:
    ldr r0, _LIT0
    mov r1, #0xc0
    str r1, [r0, #0x10]
    mov r2, #0x20
    str r2, [r0, #0x3c]
    ldr r2, [r0, #0x38]
    cmp r2, #0x0
    beq .L_1f0
    ldr r0, _LIT1
    blx r2
.L_1f0:
    ldr r0, _LIT0
    ldr r2, [r0, #0x38]
    cmp r2, #0x0
    beq .L_20c
    ldr r1, [r0, #0x3c]
    ldr r0, _LIT2
    blx r2
.L_20c:
    ldr r1, _LIT0
    mov r0, #0x3
    str r5, [r1, #0x40]
    bl func_0201f138
    cmp r5, #0x1
    cmpne r5, #0x3
    cmpne r5, #0x5
    bne .L_26c
    ldr r1, _LIT3
    mov r0, r4
    mov r2, #0xc0
    bl func_02094688
    ldr r0, _LIT3
    mov r1, #0xc0
    bl func_02092904
    bl DC_WaitWriteBufferEmpty
    ldr r0, _LIT0
    ldr r0, [r0, #0x18]
    cmp r0, #0x0
    beq .L_264
    bl func_0201fc6c
    ldmia sp!, {r3, r4, r5, pc}
.L_264:
    bl func_0201fd24
    ldmia sp!, {r3, r4, r5, pc}
.L_26c:
    ldr r0, _LIT0
    ldr r2, [r0, #0x38]
    cmp r2, #0x0
    beq .L_288
    ldr r0, _LIT4
    mov r1, r5
    blx r2
.L_288:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02191f40
_LIT1: .word data_020c65b4
_LIT2: .word data_020c65cc
_LIT3: .word data_02192020
_LIT4: .word data_020c6810
