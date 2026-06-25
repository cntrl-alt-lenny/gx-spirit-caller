; func_0202a228 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_0219a854
        .extern func_0202aa04
        .global func_0202a228
        .arm
func_0202a228:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r5, [r1, #0x4]
    ldr r1, _LIT1
    cmp r5, #0x0
    mov r3, #0x0
    ble .L_7c
    ldr r2, [r1]
.L_60:
    ldr r0, [r2]
    cmp r0, #0x0
    beq .L_7c
    add r3, r3, #0x1
    cmp r3, r5
    add r2, r2, #0xec
    blt .L_60
.L_7c:
    cmp r3, r5
    mov r0, #0x0
    ldmgeia sp!, {r4, r5, r6, pc}
    mov r2, #0xec
    mul r5, r3, r2
    ldr r6, [r1]
    add r1, r6, r5
    bl Fill32
    add r0, r6, r5
    str r4, [r6, r5]
    bl func_0202aa04
    add r0, r6, r5
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219a854
_LIT1: .word data_0219a854
