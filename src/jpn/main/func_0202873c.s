; func_0202873c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_0219a84c
        .global func_0202873c
        .arm
func_0202873c:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r5, [r1, #0x4]
    ldr r1, _LIT1
    cmp r5, #0x0
    mov r3, #0x0
    ble .L_40
    ldr r2, [r1]
.L_24:
    ldr r0, [r2]
    cmp r0, #0x0
    beq .L_40
    add r3, r3, #0x1
    cmp r3, r5
    add r2, r2, #0x19c
    blt .L_24
.L_40:
    cmp r3, r5
    mov r0, #0x0
    ldmgeia sp!, {r4, r5, r6, pc}
    mov r2, #0x19c
    mul r5, r3, r2
    ldr r6, [r1]
    add r1, r6, r5
    bl Fill32
    str r4, [r6, r5]
    add r0, r6, r5
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219a84c
_LIT1: .word data_0219a84c
