; func_02067354 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021015e0
        .extern data_021015e4
        .extern func_020453b4
        .extern func_02054e70
        .extern func_0205531c
        .extern func_02066010
        .global func_02067354
        .arm
func_02067354:
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldreq r0, _LIT0
    ldreq r4, [r0]
    ldr r0, [r4, #0xbc]
    cmp r0, #0x0
    beq .L_28
    mov r0, r4
    mov r1, #0x2
    bl func_02066010
.L_28:
    ldr r0, [r4]
    mvn r1, #0x0
    cmp r0, r1
    beq .L_48
    ldr r1, [r4, #0xc4]
    cmp r1, #0x0
    beq .L_48
    bl func_02054e70
.L_48:
    mvn r0, #0x0
    str r0, [r4]
    mov r0, #0x0
    str r0, [r4, #0xac]
    ldr r0, [r4, #0xc4]
    cmp r0, #0x0
    beq .L_68
    bl func_0205531c
.L_68:
    ldr r0, _LIT1
    cmp r4, r0
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    bl func_020453b4
    ldmia sp!, {r4, pc}
_LIT0: .word data_021015e0
_LIT1: .word data_021015e4
