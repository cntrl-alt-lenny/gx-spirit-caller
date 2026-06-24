; func_0200a978 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3ec0
        .extern data_02106978
        .extern func_0200585c
        .extern func_02035184
        .extern func_02035198
        .extern func_020379a8
        .global func_0200a978
        .arm
func_0200a978:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    mov ip, #0x18
    ldr r1, _LIT1
    mov r2, #0x80000
    mov r3, #0xa
    str ip, [sp]
    bl func_02035184
    cmp r0, #0x0
    beq .L_53c
    ldr r0, _LIT2
    bl func_0200585c
.L_53c:
    mov r0, #0x1
    bl func_020379a8
    ldmia sp!, {r3, pc}
_LIT0: .word data_020c3ec0
_LIT1: .word data_02106978
_LIT2: .word func_02035198
