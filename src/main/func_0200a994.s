; func_0200a994 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3fa0
        .extern data_02106a58
        .extern func_02005878
        .extern func_020351d4
        .extern func_020351e8
        .extern func_020379f8
        .global func_0200a994
        .arm
func_0200a994:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    mov ip, #0x18
    ldr r1, _LIT1
    mov r2, #0x80000
    mov r3, #0xa
    str ip, [sp]
    bl func_020351d4
    cmp r0, #0x0
    beq .L_11d4
    ldr r0, _LIT2
    bl func_02005878
.L_11d4:
    mov r0, #0x1
    bl func_020379f8
    ldmia sp!, {r3, pc}
_LIT0: .word data_020c3fa0
_LIT1: .word data_02106a58
_LIT2: .word func_020351e8
