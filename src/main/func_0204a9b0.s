; func_0204a9b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02050054
        .global func_0204a9b0
        .arm
func_0204a9b0:
    stmdb sp!, {r4, lr}
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    cmp r4, #0x1
    beq .L_4f0
    cmp r4, #0x2
    beq .L_4fc
    cmp r4, #0x3
    moveq r0, #0x6
    mvneq r2, #0x1d
    b .L_504
.L_4f0:
    mov r0, #0x9
    mvn r2, #0x0
    b .L_504
.L_4fc:
    mov r0, #0x6
    mvn r2, #0x31
.L_504:
    ldr r1, _LIT0
    add r1, r2, r1
    bl func_02050054
    mov r0, r4
    ldmia sp!, {r4, pc}
_LIT0: .word 0xfffeb010
