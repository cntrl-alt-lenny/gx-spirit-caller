; func_0204880c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020492a8
        .global func_0204880c
        .arm
func_0204880c:
    stmdb sp!, {r4, lr}
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    cmp r4, #0x4
    addls pc, pc, r4, lsl #0x2
    b .L_5c8
    b .L_5c8
    b .L_59c
    b .L_5a8
    b .L_5b4
    b .L_5c0
.L_59c:
    mov r0, #0x9
    mvn r2, #0x0
    b .L_5c8
.L_5a8:
    mov r0, #0x9
    mvn r2, #0x1
    b .L_5c8
.L_5b4:
    mov r0, #0x6
    mvn r2, #0x9
    b .L_5c8
.L_5c0:
    mov r0, #0x6
    mvn r2, #0x13
.L_5c8:
    ldr r1, _LIT0
    add r1, r2, r1
    bl func_020492a8
    mov r0, r4
    ldmia sp!, {r4, pc}
_LIT0: .word 0xfffeeaa8
