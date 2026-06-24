; func_0204afc0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dba4
        .extern func_02092fc8
        .global func_0204afc0
        .arm
func_0204afc0:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r3, [r1]
    cmp r3, #0x0
    ldmeqia sp!, {r4, pc}
    ldrb r0, [r3]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r2, #0x0
    str r2, [r3, #0x8]
    ldr r0, [r1]
    str r2, [r0, #0xc]
    ldr r0, [r1]
    strb r2, [r0, #0x2]
    bl func_02092fc8
    ldr r2, _LIT0
    cmp r4, #0x0
    ldr r2, [r2]
    str r0, [r2, #0x18]
    str r1, [r2, #0x1c]
    ldmneia sp!, {r4, pc}
    bl func_02092fc8
    ldr r2, _LIT0
    ldr r2, [r2]
    str r0, [r2, #0x10]
    str r1, [r2, #0x14]
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219dba4
