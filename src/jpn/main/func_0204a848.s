; func_0204a848 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204ffe0
        .global func_0204a848
        .arm
func_0204a848:
    stmdb sp!, {r4, lr}
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    cmp r4, #0x7
    addls pc, pc, r4, lsl #0x2
    b .L_450
    b .L_450
    b .L_408
    b .L_414
    b .L_424
    b .L_430
    b .L_414
    b .L_43c
    b .L_448
.L_408:
    mov r0, #0x9
    mvn r2, #0x0
    b .L_450
.L_414:
    mov r0, #0x0
    mov r2, r0
    mov r4, r0
    b .L_450
.L_424:
    mov r0, #0x6
    mvn r2, #0x9
    b .L_450
.L_430:
    mov r0, #0x6
    mvn r2, #0x1d
    b .L_450
.L_43c:
    mov r0, #0x6
    mvn r2, #0x45
    b .L_450
.L_448:
    mov r0, #0x6
    mvn r2, #0x4f
.L_450:
    cmp r0, #0x0
    beq .L_464
    ldr r1, _LIT0
    add r1, r2, r1
    bl func_0204ffe0
.L_464:
    mov r0, r4
    ldmia sp!, {r4, pc}
_LIT0: .word 0xfffeac28
