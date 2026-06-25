; func_0204aa80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204ffe0
        .global func_0204aa80
        .arm
func_0204aa80:
    stmdb sp!, {r4, lr}
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    cmp r4, #0x6
    addls pc, pc, r4, lsl #0x2
    b .L_164
    b .L_164
    b .L_120
    b .L_12c
    b .L_138
    b .L_144
    b .L_150
    b .L_15c
.L_120:
    mov r0, #0x6
    mvn r2, #0x31
    b .L_164
.L_12c:
    mov r0, #0x6
    mvn r2, #0x1d
    b .L_164
.L_138:
    mov r0, #0x6
    mvn r2, #0x13
    b .L_164
.L_144:
    mov r0, #0x6
    mvn r2, #0x27
    b .L_164
.L_150:
    mov r0, #0x9
    mvn r2, #0x0
    b .L_164
.L_15c:
    mov r0, #0x9
    mvn r2, #0x1
.L_164:
    ldr r1, _LIT0
    add r1, r2, r1
    bl func_0204ffe0
    mov r0, r4
    ldmia sp!, {r4, pc}
_LIT0: .word 0xfffeb3f8
