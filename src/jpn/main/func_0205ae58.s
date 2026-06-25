; func_0205ae58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021006dc
        .extern data_021008cc
        .extern data_021008e4
        .extern func_02057fc4
        .extern func_02057ffc
        .global func_0205ae58
        .arm
func_0205ae58:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r4, [r6]
    mov r5, r1
    ldr r2, [r4, #0x448]
    cmp r2, #0x0
    ble .L_5c
    ldr r2, _LIT0
    bl func_02057ffc
    ldr r2, [r4, #0x198]
    mov r0, r6
    mov r1, r5
    bl func_02057fc4
    ldr r2, [r4, #0x440]
    mov r0, r6
    mov r1, r5
    bl func_02057ffc
    ldr r2, _LIT1
    mov r0, r6
    mov r1, r5
    bl func_02057ffc
    mov r0, #0x0
    str r0, [r4, #0x448]
.L_5c:
    ldr r0, [r4, #0x458]
    cmp r0, #0x0
    ble .L_b0
    ldr r2, _LIT2
    mov r0, r6
    mov r1, r5
    bl func_02057ffc
    ldr r2, [r4, #0x198]
    mov r0, r6
    mov r1, r5
    bl func_02057fc4
    ldr r2, [r4, #0x450]
    mov r0, r6
    mov r1, r5
    bl func_02057ffc
    ldr r2, _LIT1
    mov r0, r6
    mov r1, r5
    bl func_02057ffc
    mov r0, #0x0
    str r0, [r4, #0x458]
.L_b0:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_021008cc
_LIT1: .word data_021006dc
_LIT2: .word data_021008e4
