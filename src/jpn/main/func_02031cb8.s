; func_02031cb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02031a1c
        .extern func_02031aa8
        .extern func_02031b20
        .extern func_02031c38
        .extern func_02031cb8
        .global func_02031cb8
        .arm
func_02031cb8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x2c]
    tst r1, #0x1
    beq .L_a8
    mov r1, #0x10000
    mov r2, #0x0
    mov r3, r2
    rsb r1, r1, #0x0
    bl func_02031a1c
.L_a8:
    ldr r0, [r4, #0x2c]
    tst r0, #0x4
    beq .L_bc
    mov r0, r4
    bl func_02031c38
.L_bc:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    ldrne r0, _LIT0
    strne r0, [r4, #0x8]
    ldmneia sp!, {r4, pc}
    mov r0, r4
    bl func_02031aa8
    mov r0, r4
    bl func_02031b20
    mov r0, #0x0
    str r0, [r4, #0x10]
    str r0, [r4, #0x14]
    ldmia sp!, {r4, pc}
_LIT0: .word func_02031cb8
