; func_02014bc0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02019668
        .extern func_0201b774
        .global func_02014bc0
        .arm
func_02014bc0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GetSystemWork
    ldr r1, [r0, #0x8d8]
    mov r1, r1, lsl #0x1f
    movs r1, r1, lsr #0x1f
    ldmeqia sp!, {r4, pc}
    ldr r0, [r0, #0x920]
    cmp r0, #0x1
    ldmneia sp!, {r4, pc}
    bl func_02019668
    cmp r0, #0x3
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT0
    str r0, [r4, #0x8]
    bl func_0201b774
    ldmia sp!, {r4, pc}
_LIT0: .word 0x000c0100
