; func_02087640 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a4cb4
        .extern func_0207cff4
        .extern func_02089920
        .global func_02087640
        .arm
func_02087640:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_02089920
    ldr r1, [r4, #0xc]
    cmp r1, #0x0
    movne r0, #0x0
    strne r0, [r1, #0x8]
    ldmneia sp!, {r4, pc}
    ldr r1, [r4, #0x10]
    ldr r2, _LIT0
    mov r0, #0x24
    mla r0, r1, r0, r2
    mov r1, r4
    add r0, r0, #0xc
    bl func_0207cff4
    ldmia sp!, {r4, pc}
_LIT0: .word data_021a4cb4
