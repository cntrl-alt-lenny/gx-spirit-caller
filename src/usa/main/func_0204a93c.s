; func_0204a93c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204ffe0
        .global func_0204a93c
        .arm
func_0204a93c:
    stmdb sp!, {r4, lr}
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    cmp r4, #0x1
    beq .L_30
    cmp r4, #0x2
    beq .L_3c
    cmp r4, #0x3
    moveq r0, #0x6
    mvneq r2, #0x1d
    b .L_44
.L_30:
    mov r0, #0x9
    mvn r2, #0x0
    b .L_44
.L_3c:
    mov r0, #0x6
    mvn r2, #0x31
.L_44:
    ldr r1, _LIT0
    add r1, r2, r1
    bl func_0204ffe0
    mov r0, r4
    ldmia sp!, {r4, pc}
_LIT0: .word 0xfffeb010
