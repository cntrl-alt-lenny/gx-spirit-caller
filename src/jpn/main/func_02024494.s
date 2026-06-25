; func_02024494 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern data_0219a80c
        .extern func_02024594
        .global func_02024494
        .arm
func_02024494:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0, #0x4]
    mov r5, #0x0
    cmp r0, #0x0
    ble .L_478
    mov r6, r5
.L_44c:
    ldr r1, [r4]
    ldr r0, [r1, r6]
    cmp r0, #0x0
    beq .L_464
    add r0, r1, r6
    bl func_02024594
.L_464:
    ldr r0, [r4, #0x4]
    add r5, r5, #0x1
    cmp r5, r0
    add r6, r6, #0x16c
    blt .L_44c
.L_478:
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_490
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r4]
.L_490:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219a80c
_LIT1: .word data_0219a80c
