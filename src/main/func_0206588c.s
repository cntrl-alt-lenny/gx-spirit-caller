; func_0206588c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021015a0
        .extern data_021015bc
        .extern data_0219e958
        .extern data_0219e95c
        .extern data_0219e960
        .extern data_0219e964
        .extern func_02065934
        .global func_0206588c
        .arm
func_0206588c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    bne .L_b0c
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r0, [r0]
    bl func_02065934
    ldr r1, _LIT0
    str r0, [r1]
.L_b0c:
    ldr r0, _LIT3
    ldr r0, [r0]
    cmp r0, #0x0
    bne .L_b34
    ldr r0, _LIT4
    ldr r1, _LIT5
    ldr r0, [r0]
    bl func_02065934
    ldr r1, _LIT3
    str r0, [r1]
.L_b34:
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_b54
    ldr r0, _LIT3
    ldr r0, [r0]
    cmp r0, #0x0
    bne .L_b60
.L_b54:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmfd sp!, {pc}
.L_b60:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219e964
_LIT1: .word data_0219e95c
_LIT2: .word data_021015a0
_LIT3: .word data_0219e960
_LIT4: .word data_0219e958
_LIT5: .word data_021015bc
