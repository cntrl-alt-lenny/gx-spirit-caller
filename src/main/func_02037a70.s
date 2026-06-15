; func_02037a70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b490
        .extern func_02037ac4
        .extern func_0203c3dc
        .extern func_020919d8
        .global func_02037a70
        .arm
func_02037a70:
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    beq .L_8c
    ldr r0, _LIT0
    bl func_020919d8
.L_8c:
    bl func_02037ac4
    cmp r0, #0x0
    beq .L_b4
    tst r0, #0x1
    movne r0, #0x1
    ldmneia sp!, {r3, pc}
    bl func_0203c3dc
    cmp r0, #0x3
    movcs r0, #0x1
    ldmcsia sp!, {r3, pc}
.L_b4:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_0219b490
