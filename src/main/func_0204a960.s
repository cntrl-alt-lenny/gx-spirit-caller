; func_0204a960 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02050054
        .global func_0204a960
        .arm
func_0204a960:
    stmdb sp!, {r4, lr}
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    cmp r4, #0x1
    beq .L_494
    cmp r4, #0x2
    beq .L_49c
    b .L_4a4
.L_494:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_49c:
    mov r0, #0x2
    ldmia sp!, {r4, pc}
.L_4a4:
    movs r0, #0x6
    beq .L_4b4
    ldr r1, _LIT0
    bl func_02050054
.L_4b4:
    mov r0, r4
    ldmia sp!, {r4, pc}
_LIT0: .word 0xfffeb007
