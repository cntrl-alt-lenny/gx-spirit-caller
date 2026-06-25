; func_ov002_021ca43c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bad9c
        .extern func_ov002_021baf88
        .global func_ov002_021ca43c
        .arm
func_ov002_021ca43c:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    mov r4, #0x0
    bl func_ov002_021baf88
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT1
    bl func_ov002_021baf88
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT2
    bl func_ov002_021baf88
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT3
    bl func_ov002_021baf88
    cmp r0, #0x0
    mov r0, #0x0
    ldr r1, _LIT4
    sub r2, r0, #0x1
    orrne r4, r4, #0x2
    bl func_ov002_021bad9c
    cmp r0, #0x0
    mov r0, #0x1
    ldr r1, _LIT4
    sub r2, r0, #0x2
    orrne r4, r4, #0x4
    bl func_ov002_021bad9c
    cmp r0, #0x0
    orrne r4, r4, #0x8
    mov r0, r4
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00001332
_LIT1: .word 0x00001a27
_LIT2: .word 0x00001a1a
_LIT3: .word 0x00001a33
_LIT4: .word 0x00001444
