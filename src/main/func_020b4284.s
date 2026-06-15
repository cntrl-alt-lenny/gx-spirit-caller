; func_020b4284 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern ARM9_CTOR_START
        .global func_020b4284
        .arm
func_020b4284:
    stmdb sp!, {r4, lr}
    ldr r4, _LIT0
    b .L_14
.L_c:
    blx r0
    add r4, r4, #0x4
.L_14:
    cmp r4, #0x0
    ldrne r0, [r4]
    cmpne r0, #0x0
    bne .L_c
    ldmia sp!, {r4, pc}
_LIT0: .word ARM9_CTOR_START
