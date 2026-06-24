; func_0204ab14 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204ffe0
        .global func_0204ab14
        .arm
func_0204ab14:
    stmdb sp!, {r4, lr}
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    cmp r4, #0x4
    addls pc, pc, r4, lsl #0x2
    b .L_1d8
    b .L_1d8
    b .L_1ac
    b .L_1b8
    b .L_1c4
    b .L_1d0
.L_1ac:
    mov r0, #0x9
    mvn r2, #0x0
    b .L_1d8
.L_1b8:
    mov r0, #0x9
    mvn r2, #0x1
    b .L_1d8
.L_1c4:
    mov r0, #0x6
    mvn r2, #0x9
    b .L_1d8
.L_1d0:
    mov r0, #0x6
    mvn r2, #0x13
.L_1d8:
    ldr r1, _LIT0
    add r1, r2, r1
    bl func_0204ffe0
    mov r0, r4
    ldmia sp!, {r4, pc}
_LIT0: .word 0xfffec398
