; func_0204aaf4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02050054
        .global func_0204aaf4
        .arm
func_0204aaf4:
    stmdb sp!, {r4, lr}
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    cmp r4, #0x6
    addls pc, pc, r4, lsl #0x2
    b .L_680
    b .L_680
    b .L_63c
    b .L_648
    b .L_654
    b .L_660
    b .L_66c
    b .L_678
.L_63c:
    mov r0, #0x6
    mvn r2, #0x31
    b .L_680
.L_648:
    mov r0, #0x6
    mvn r2, #0x1d
    b .L_680
.L_654:
    mov r0, #0x6
    mvn r2, #0x13
    b .L_680
.L_660:
    mov r0, #0x6
    mvn r2, #0x27
    b .L_680
.L_66c:
    mov r0, #0x9
    mvn r2, #0x0
    b .L_680
.L_678:
    mov r0, #0x9
    mvn r2, #0x1
.L_680:
    ldr r1, _LIT0
    add r1, r2, r1
    bl func_02050054
    mov r0, r4
    ldmia sp!, {r4, pc}
_LIT0: .word 0xfffeb3f8
