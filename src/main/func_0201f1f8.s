; func_0201f1f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02191f40
        .extern func_0201f138
        .extern func_0201f19c
        .extern func_0201f25c
        .extern func_0201f2f4
        .global func_0201f1f8
        .arm
func_0201f1f8:
    stmdb sp!, {r3, lr}
    ldrh r0, [r0, #0x2]
    cmp r0, #0x0
    beq .L_60
    bl func_0201f19c
    mov r0, #0x9
    bl func_0201f138
    ldmia sp!, {r3, pc}
.L_60:
    ldr r0, _LIT0
    ldr r0, [r0, #0x24]
    cmp r0, #0x0
    beq .L_88
    bl func_0201f25c
    cmp r0, #0x0
    ldmneia sp!, {r3, pc}
    mov r0, #0x9
    bl func_0201f138
    ldmia sp!, {r3, pc}
.L_88:
    bl func_0201f2f4
    cmp r0, #0x0
    ldmneia sp!, {r3, pc}
    mov r0, #0x9
    bl func_0201f138
    ldmia sp!, {r3, pc}
_LIT0: .word data_02191f40
