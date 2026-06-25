; func_0202864c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern data_0219a84c
        .extern func_02005c44
        .extern func_02005c84
        .extern func_02005e04
        .extern func_02021150
        .extern func_020287b0
        .global func_0202864c
        .arm
func_0202864c:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0, #0x4]
    mov r5, #0x0
    cmp r0, #0x0
    ble .L_808
    mov r6, r5
.L_7dc:
    ldr r1, [r4]
    ldr r0, [r1, r6]
    cmp r0, #0x0
    beq .L_7f4
    add r0, r1, r6
    bl func_020287b0
.L_7f4:
    ldr r0, [r4, #0x4]
    add r5, r5, #0x1
    cmp r5, r0
    add r6, r6, #0x19c
    blt .L_7dc
.L_808:
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_820
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r4]
.L_820:
    mov r0, #0x0
    bl func_02021150
    cmp r0, #0x0
    beq .L_860
    mov r0, #0x1
    bl func_02005c84
    mov r0, #0x2
    bl func_02005c84
    mov r0, #0x1
    bl func_02005e04
    mov r0, #0x2
    bl func_02005e04
    mov r0, #0x1
    bl func_02005c44
    mov r0, #0x2
    bl func_02005c44
.L_860:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219a84c
_LIT1: .word data_0219a84c
