; func_020200d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02191f40
        .extern data_021922e0
        .extern func_0201f138
        .extern func_0201f19c
        .extern func_020a0604
        .global func_020200d8
        .arm
func_020200d8:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r0, [r0, #0x30]
    cmp r0, #0x6
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    cmp r0, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    mov r0, #0x6
    bl func_0201f138
    ldr r0, _LIT1
    mov r1, #0xd
    bl func_020a0604
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    bl func_0201f19c
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_02191f40
_LIT1: .word data_021922e0
