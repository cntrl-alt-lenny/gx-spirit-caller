; func_020329e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02032810
        .extern func_020329c4
        .extern func_02032bc0
        .extern func_0203347c
        .extern func_0203367c
        .extern func_0204590c
        .extern func_020495c0
        .extern func_020495e8
        .extern func_02052e58
        .global func_020329e0
        .arm
func_020329e0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r2
    mov r0, r5
    mov r6, r1
    bl func_0203347c
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    add r4, r5, #0x1f4
    str r6, [r4, #0xc08]
    bl func_0204590c
    str r0, [r5, #0xeb0]
    add r0, r4, #0xc40
    bl func_02052e58
    str r0, [r5, #0xdf4]
    str r1, [r4, #0xc04]
    ldr r0, [r5, #0xdf4]
    cmp r1, #0x0
    cmpeq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    mov r1, r5
    bl func_020495e8
    mov r0, r5
    bl func_0203367c
    ldr r0, _LIT1
    ldr r1, _LIT2
    bl func_020495c0
    ldr r1, [r5, #0xedc]
    cmp r1, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r6
    blx r1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word func_02032810
_LIT1: .word func_02032bc0
_LIT2: .word func_020329c4
