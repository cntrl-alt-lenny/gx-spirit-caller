; func_02009a68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021064b8
        .extern func_02009968
        .global func_02009a68
        .arm
func_02009a68:
    stmdb sp!, {r4, lr}
    cmp r0, #0x0
    ble .L_2b4
    ldr r3, _LIT0
    sub r2, r0, #0x1
    mov r1, #0x1c
    mla r4, r2, r1, r3
    bl func_02009968
    ldrb r0, [r4, #0x19]
    cmp r0, #0x1
    bne .L_2b4
    mov r0, #0x0
    strb r0, [r4, #0x19]
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_2b4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_021064b8
