; func_02032a34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02032864
        .extern func_02032a18
        .extern func_02032c14
        .extern func_020334cc
        .extern func_020336cc
        .extern func_020459b4
        .extern func_02049634
        .extern func_0204965c
        .extern func_02052ecc
        .global func_02032a34
        .arm
func_02032a34:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r2
    mov r0, r5
    mov r6, r1
    bl func_020334cc
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    add r4, r5, #0x1fc
    str r6, [r4, #0xc08]
    bl func_020459b4
    str r0, [r5, #0xeb8]
    add r0, r4, #0xc40
    bl func_02052ecc
    str r0, [r5, #0xdfc]
    str r1, [r4, #0xc04]
    ldr r0, [r5, #0xdfc]
    cmp r1, #0x0
    cmpeq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    mov r1, r5
    bl func_0204965c
    mov r0, r5
    bl func_020336cc
    ldr r0, _LIT1
    ldr r1, _LIT2
    bl func_02049634
    ldr r1, [r5, #0xee4]
    cmp r1, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r6
    blx r1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word func_02032864
_LIT1: .word func_02032c14
_LIT2: .word func_02032a18
