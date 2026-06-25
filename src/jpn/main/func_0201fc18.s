; func_0201fc18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02191e60
        .extern data_02191ec0
        .extern data_02191f40
        .extern func_0201f0e4
        .extern func_0201f148
        .extern func_0201fc78
        .extern func_020a0800
        .global func_0201fc18
        .arm
func_0201fc18:
    stmdb sp!, {r3, lr}
    mov r0, #0x3
    bl func_0201f0e4
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r2, [r1, #0x18]
    ldr r1, _LIT2
    blx r2
    mov r1, r0
    ldr r0, _LIT3
    ldr r2, _LIT1
    bl func_020a0800
    cmp r0, #0x2
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    bl func_0201f148
    mov r0, #0x9
    bl func_0201f0e4
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_02191e60
_LIT1: .word data_02191ec0
_LIT2: .word data_02191f40
_LIT3: .word func_0201fc78
