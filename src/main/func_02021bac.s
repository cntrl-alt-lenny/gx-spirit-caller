; func_02021bac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02197434
        .extern data_02198434
        .extern func_02021cbc
        .global func_02021bac
        .arm
func_02021bac:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0, #0xb0]
    mov r5, #0x0
    cmp r0, #0x0
    ble .L_50
    add r0, r1, #0x48
    add r6, r0, #0x1000
    add r4, r1, #0x1000
.L_28:
    ldr r0, [r6]
    cmp r0, #0x0
    beq .L_3c
    mov r0, r6
    bl func_02021cbc
.L_3c:
    ldr r0, [r4, #0xb0]
    add r5, r5, #0x1
    cmp r5, r0
    add r6, r6, #0x68
    blt .L_28
.L_50:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02198434
_LIT1: .word data_02197434
