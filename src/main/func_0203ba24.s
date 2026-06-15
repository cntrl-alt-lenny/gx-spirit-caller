; func_0203ba24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219d070
        .extern data_0219d088
        .extern func_0203c13c
        .extern func_0207d12c
        .extern func_020919d8
        .global func_0203ba24
        .arm
func_0203ba24:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r2
    mov r5, r3
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r4, [sp, #0x14]
    ldrsh r0, [r4, #0xba]
    cmp r0, #0x3
    blt .L_afc
    ldr r0, _LIT0
    bl func_020919d8
    ldmia sp!, {r4, r5, r6, pc}
.L_afc:
    bl func_0203c13c
    movs r1, r0
    beq .L_b34
    str r4, [r1, #0x8]
    ldr r2, [r6]
    ldr r0, _LIT1
    str r2, [r1, #0xc]
    ldr r2, [r6, #0x4]
    str r2, [r1, #0x10]
    str r5, [r1, #0x14]
    ldrsh r2, [r4, #0xba]
    add r2, r2, #0x1
    strh r2, [r4, #0xba]
    bl func_0207d12c
.L_b34:
    ldr r0, _LIT0
    bl func_020919d8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219d088
_LIT1: .word data_0219d070
