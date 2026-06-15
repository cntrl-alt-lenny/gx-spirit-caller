; func_0204ab88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02050054
        .global func_0204ab88
        .arm
func_0204ab88:
    stmdb sp!, {r4, lr}
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    cmp r4, #0x4
    addls pc, pc, r4, lsl #0x2
    b .L_6f4
    b .L_6f4
    b .L_6c8
    b .L_6d4
    b .L_6e0
    b .L_6ec
.L_6c8:
    mov r0, #0x9
    mvn r2, #0x0
    b .L_6f4
.L_6d4:
    mov r0, #0x9
    mvn r2, #0x1
    b .L_6f4
.L_6e0:
    mov r0, #0x6
    mvn r2, #0x9
    b .L_6f4
.L_6ec:
    mov r0, #0x6
    mvn r2, #0x13
.L_6f4:
    ldr r1, _LIT0
    add r1, r2, r1
    bl func_02050054
    mov r0, r4
    ldmia sp!, {r4, pc}
_LIT0: .word 0xfffec398
