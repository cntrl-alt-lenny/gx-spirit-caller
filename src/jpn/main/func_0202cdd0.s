; func_0202cdd0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ac68
        .extern func_0202d140
        .extern func_020371b8
        .global func_0202cdd0
        .arm
func_0202cdd0:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r1, [r0]
    cmp r1, #0x0
    ldrne r1, [r0, #0x24]
    cmpne r1, #0x0
    ldrne r1, [r0, #0x18]
    cmpne r1, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, [r0, #0x14]
    cmp r0, #0x0
    ldmneia sp!, {r3, pc}
    mov r0, #0x1
    bl func_0202d140
    mov r0, #0x35
    sub r1, r0, #0x36
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldmia sp!, {r3, pc}
_LIT0: .word data_0219ac68
