; func_02031d0c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02031a70
        .extern func_02031afc
        .extern func_02031b74
        .extern func_02031c8c
        .extern func_02031d0c
        .global func_02031d0c
        .arm
func_02031d0c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x2c]
    tst r1, #0x1
    beq .L_28
    mov r1, #0x10000
    mov r2, #0x0
    mov r3, r2
    rsb r1, r1, #0x0
    bl func_02031a70
.L_28:
    ldr r0, [r4, #0x2c]
    tst r0, #0x4
    beq .L_3c
    mov r0, r4
    bl func_02031c8c
.L_3c:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    ldrne r0, _LIT0
    strne r0, [r4, #0x8]
    ldmneia sp!, {r4, pc}
    mov r0, r4
    bl func_02031afc
    mov r0, r4
    bl func_02031b74
    mov r0, #0x0
    str r0, [r4, #0x10]
    str r0, [r4, #0x14]
    ldmia sp!, {r4, pc}
_LIT0: .word func_02031d0c
