; func_020234a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_0219a7fc
        .extern func_02023d34
        .global func_020234a4
        .arm
func_020234a4:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r5, [r1, #0x4]
    ldr r1, _LIT1
    cmp r5, #0x0
    mov r3, #0x0
    ble .L_2c4
    ldr r2, [r1]
.L_2a8:
    ldr r0, [r2]
    cmp r0, #0x0
    beq .L_2c4
    add r3, r3, #0x1
    cmp r3, r5
    add r2, r2, #0xd0
    blt .L_2a8
.L_2c4:
    cmp r3, r5
    mov r0, #0x0
    ldmgeia sp!, {r4, r5, r6, pc}
    mov r2, #0xd0
    mul r5, r3, r2
    ldr r6, [r1]
    add r1, r6, r5
    bl Fill32
    add r0, r6, r5
    str r4, [r6, r5]
    bl func_02023d34
    add r0, r6, r5
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219a7fc
_LIT1: .word data_0219a7fc
