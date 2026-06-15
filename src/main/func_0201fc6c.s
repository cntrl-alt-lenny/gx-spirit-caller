; func_0201fc6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02191f40
        .extern data_02191fa0
        .extern data_02192020
        .extern func_0201f138
        .extern func_0201f19c
        .extern func_0201fccc
        .extern func_020a08f4
        .global func_0201fc6c
        .arm
func_0201fc6c:
    stmdb sp!, {r3, lr}
    mov r0, #0x3
    bl func_0201f138
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r2, [r1, #0x18]
    ldr r1, _LIT2
    blx r2
    mov r1, r0
    ldr r0, _LIT3
    ldr r2, _LIT1
    bl func_020a08f4
    cmp r0, #0x2
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    bl func_0201f19c
    mov r0, #0x9
    bl func_0201f138
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_02191f40
_LIT1: .word data_02191fa0
_LIT2: .word data_02192020
_LIT3: .word func_0201fccc
