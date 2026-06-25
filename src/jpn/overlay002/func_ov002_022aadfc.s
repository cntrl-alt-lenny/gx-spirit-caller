; func_ov002_022aadfc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cc3a4
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d6bc
        .extern func_0208f838
        .global func_ov002_022aadfc
        .arm
func_ov002_022aadfc:
    stmdb sp!, {r3, r4, r5, lr}
    movs r5, r1
    ldrne r1, [r0, #0x8]
    cmpne r1, r5
    ldmeqia sp!, {r3, r4, r5, pc}
    str r5, [r0, #0x8]
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    mov r4, r0
    bl func_0201d6bc
    sub r1, r5, #0x1
    add r0, r0, r1, lsl #0x8
    mov r1, #0x1f40
    mov r2, #0x100
    bl func_0208f838
    mov r0, r4
    bl func_02006e00
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cc3a4
