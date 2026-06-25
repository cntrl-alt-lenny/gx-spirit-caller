; func_02020870 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201f0e4
        .extern func_0201f148
        .extern func_0202080c
        .extern func_0209e7dc
        .global func_02020870
        .arm
func_02020870:
    stmdb sp!, {r3, lr}
    ldrh r0, [r0, #0x2]
    cmp r0, #0x0
    beq .L_20
    bl func_0201f148
    mov r0, #0xa
    bl func_0201f0e4
    ldmia sp!, {r3, pc}
.L_20:
    ldr r0, _LIT0
    bl func_0209e7dc
    cmp r0, #0x0
    beq .L_40
    bl func_0201f148
    mov r0, #0xa
    bl func_0201f0e4
    ldmia sp!, {r3, pc}
.L_40:
    mov r0, #0x1
    bl func_0201f0e4
    ldmia sp!, {r3, pc}
_LIT0: .word func_0202080c
