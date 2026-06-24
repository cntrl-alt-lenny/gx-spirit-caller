; func_02067368 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101500
        .extern func_020552bc
        .extern func_02065f9c
        .global func_02067368
        .arm
func_02067368:
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldreq r0, _LIT0
    ldreq r4, [r0]
    ldr r0, [r4, #0xbc]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_020552bc
    ldr r2, [r4, #0xac]
    ldr r1, _LIT1
    sub r0, r0, r2
    cmp r0, r1
    movcc r0, #0x1
    strcc r0, [r4, #0xb4]
    ldmccia sp!, {r4, pc}
    mov r0, r4
    mov r1, #0x1
    bl func_02065f9c
    mov r0, #0x0
    str r0, [r4, #0xb4]
    ldmia sp!, {r4, pc}
_LIT0: .word data_02101500
_LIT1: .word 0x00002710
