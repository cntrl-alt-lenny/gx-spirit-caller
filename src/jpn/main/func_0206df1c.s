; func_0206df1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ec08
        .extern func_0206db48
        .extern func_0206ddf4
        .extern func_0206dee0
        .extern func_0206df9c
        .extern func_0207404c
        .extern func_0207cad4
        .global func_0206df1c
        .arm
func_0206df1c:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_54
    bl func_0206df9c
    movs r4, r0
    bne .L_4c
    ldr r0, _LIT0
    ldr r0, [r0]
    bl func_0206ddf4
    ldr r0, _LIT0
    ldr r0, [r0]
    bl func_0206dee0
    cmp r0, #0x0
    ldrne r0, _LIT0
    movne r1, #0x0
    strne r1, [r0]
    mvn r4, #0x19
.L_4c:
    bl func_0206db48
    b .L_70
.L_54:
    bl func_0207404c
    cmp r0, #0x0
    mvneq r4, #0x19
    beq .L_70
    mov r0, #0x0
    bl func_0207cad4
    mov r4, #0x0
.L_70:
    mov r0, r4
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_0219ec08
