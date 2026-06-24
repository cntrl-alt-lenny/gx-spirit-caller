; func_02022560 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02197354
        .extern data_0219739c
        .global func_02022560
        .arm
func_02022560:
    stmdb sp!, {r3, lr}
    ldr r3, _LIT0
    ldr ip, _LIT1
    ldr r3, [r3, r0, lsl #0x4]
    cmp r3, #0x0
    movlt r0, #0x0
    ldmltia sp!, {r3, pc}
    cmp r2, #0x0
    mov lr, #0x0
    ble .L_44
    add r3, ip, r0, lsl #0x4
.L_2c:
    ldr ip, [r1, lr, lsl #0x2]
    add r0, r3, lr, lsl #0x2
    add lr, lr, #0x1
    str ip, [r0, #0x4c]
    cmp lr, r2
    blt .L_2c
.L_44:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_0219739c
_LIT1: .word data_02197354
