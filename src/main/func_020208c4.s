; func_020208c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201f138
        .extern func_0201f19c
        .extern func_02020860
        .extern func_0209e8d0
        .global func_020208c4
        .arm
func_020208c4:
    stmdb sp!, {r3, lr}
    ldrh r0, [r0, #0x2]
    cmp r0, #0x0
    beq .L_64
    bl func_0201f19c
    mov r0, #0xa
    bl func_0201f138
    ldmia sp!, {r3, pc}
.L_64:
    ldr r0, _LIT0
    bl func_0209e8d0
    cmp r0, #0x0
    beq .L_84
    bl func_0201f19c
    mov r0, #0xa
    bl func_0201f138
    ldmia sp!, {r3, pc}
.L_84:
    mov r0, #0x1
    bl func_0201f138
    ldmia sp!, {r3, pc}
_LIT0: .word func_02020860
