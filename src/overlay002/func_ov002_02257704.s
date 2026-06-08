; func_ov002_02257704 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_02257464
        .extern func_ov002_02257750
        .global func_ov002_02257704
        .arm
func_ov002_02257704:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_02257464
    cmp r0, #0x0
    ldrne r1, [r0, #0x8]
    cmpne r1, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT0
    mov r2, #0x1
    str r2, [r1, #0x5c0]
    ldr r1, [r0, #0x8]
    mov r0, r4
    bl func_ov002_02257750
    ldr r1, _LIT0
    mov r2, #0x0
    str r2, [r1, #0x5c0]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
