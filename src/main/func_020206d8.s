; func_020206d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c67f8
        .extern data_02191f40
        .extern func_0201f138
        .extern func_02020738
        .extern func_02093bfc
        .global func_020206d8
        .arm
func_020206d8:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r0, [r0, #0x30]
    cmp r0, #0x7
    beq .L_18
    bl func_02093bfc
.L_18:
    mov r0, #0x1
    bl func_0201f138
    ldr r0, _LIT0
    ldrh r0, [r0, #0x6]
    bl func_02020738
    ldr r1, _LIT0
    strh r0, [r1, #0xc]
    ldr r2, [r1, #0x38]
    cmp r2, #0x0
    beq .L_4c
    ldrh r1, [r1, #0xc]
    ldr r0, _LIT1
    blx r2
.L_4c:
    ldr r0, _LIT0
    ldrh r0, [r0, #0xc]
    ldmia sp!, {r3, pc}
_LIT0: .word data_02191f40
_LIT1: .word data_020c67f8
