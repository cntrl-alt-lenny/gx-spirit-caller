; func_ov002_021b02f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bac38
        .extern func_ov002_021bae7c
        .global func_ov002_021b02f0
        .arm
func_ov002_021b02f0:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mvn r2, #0x0
    mov r4, r0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT1
    mov r0, r4
    bl func_ov002_021bac38
    cmp r0, #0x0
    movlt r0, #0x0
    ldmltia sp!, {r4, pc}
    ldr r1, _LIT2
    mov r0, r4
    bl func_ov002_021bac38
    cmp r0, #0x0
    movlt r0, #0x0
    ldmltia sp!, {r4, pc}
    ldr r1, _LIT3
    mov r0, r4
    bl func_ov002_021bac38
    cmp r0, #0x0
    movlt r0, #0x0
    ldmltia sp!, {r4, pc}
    ldr r1, _LIT4
    mov r0, r4
    bl func_ov002_021bac38
    cmp r0, #0x0
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00001468
_LIT1: .word 0x00001497
_LIT2: .word 0x00001498
_LIT3: .word 0x00001499
_LIT4: .word 0x0000149a
