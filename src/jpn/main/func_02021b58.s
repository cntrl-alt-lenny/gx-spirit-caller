; func_02021b58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02197354
        .extern data_02198354
        .extern func_02021c68
        .global func_02021b58
        .arm
func_02021b58:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0, #0xb0]
    mov r5, #0x0
    cmp r0, #0x0
    ble .L_c4
    add r0, r1, #0x48
    add r6, r0, #0x1000
    add r4, r1, #0x1000
.L_9c:
    ldr r0, [r6]
    cmp r0, #0x0
    beq .L_b0
    mov r0, r6
    bl func_02021c68
.L_b0:
    ldr r0, [r4, #0xb0]
    add r5, r5, #0x1
    cmp r5, r0
    add r6, r6, #0x68
    blt .L_9c
.L_c4:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02198354
_LIT1: .word data_02197354
