; func_0206df90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ece8
        .extern func_0206dbbc
        .extern func_0206de68
        .extern func_0206df54
        .extern func_0206e010
        .extern func_02074134
        .extern func_0207cbbc
        .global func_0206df90
        .arm
func_0206df90:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_824
    bl func_0206e010
    movs r4, r0
    bne .L_81c
    ldr r0, _LIT0
    ldr r0, [r0]
    bl func_0206de68
    ldr r0, _LIT0
    ldr r0, [r0]
    bl func_0206df54
    cmp r0, #0x0
    ldrne r0, _LIT0
    movne r1, #0x0
    strne r1, [r0]
    mvn r4, #0x19
.L_81c:
    bl func_0206dbbc
    b .L_840
.L_824:
    bl func_02074134
    cmp r0, #0x0
    mvneq r4, #0x19
    beq .L_840
    mov r0, #0x0
    bl func_0207cbbc
    mov r4, #0x0
.L_840:
    mov r0, r4
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_0219ece8
