; func_020463f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02048040
        .global func_020463f0
        .arm
func_020463f0:
    stmdb sp!, {r4, lr}
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    cmp r4, #0x7
    addls pc, pc, r4, lsl #0x2
    b .L_84
    b .L_84
    b .L_3c
    b .L_48
    b .L_58
    b .L_64
    b .L_48
    b .L_70
    b .L_7c
.L_3c:
    mov r0, #0x9
    mvn r2, #0x0
    b .L_84
.L_48:
    mov r0, #0x0
    mov r2, r0
    mov r4, r0
    b .L_84
.L_58:
    mov r0, #0x6
    mvn r2, #0x9
    b .L_84
.L_64:
    mov r0, #0x6
    mvn r2, #0x1d
    b .L_84
.L_70:
    mov r0, #0x6
    mvn r2, #0x45
    b .L_84
.L_7c:
    mov r0, #0x6
    mvn r2, #0x4f
.L_84:
    cmp r0, #0x0
    beq .L_98
    ldr r1, _LIT0
    add r1, r2, r1
    bl func_02048040
.L_98:
    mov r0, r4
    ldmia sp!, {r4, pc}
_LIT0: .word 0xfffefa48
