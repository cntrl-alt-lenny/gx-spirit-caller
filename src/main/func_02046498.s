; func_02046498 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020480b4
        .global func_02046498
        .arm
func_02046498:
    stmdb sp!, {r4, lr}
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    cmp r4, #0x7
    addls pc, pc, r4, lsl #0x2
    b .L_f0
    b .L_f0
    b .L_a8
    b .L_b4
    b .L_c4
    b .L_d0
    b .L_b4
    b .L_dc
    b .L_e8
.L_a8:
    mov r0, #0x9
    mvn r2, #0x0
    b .L_f0
.L_b4:
    mov r0, #0x0
    mov r2, r0
    mov r4, r0
    b .L_f0
.L_c4:
    mov r0, #0x6
    mvn r2, #0x9
    b .L_f0
.L_d0:
    mov r0, #0x6
    mvn r2, #0x1d
    b .L_f0
.L_dc:
    mov r0, #0x6
    mvn r2, #0x45
    b .L_f0
.L_e8:
    mov r0, #0x6
    mvn r2, #0x4f
.L_f0:
    cmp r0, #0x0
    beq .L_104
    ldr r1, _LIT0
    add r1, r2, r1
    bl func_020480b4
.L_104:
    mov r0, r4
    ldmia sp!, {r4, pc}
_LIT0: .word 0xfffefa48
