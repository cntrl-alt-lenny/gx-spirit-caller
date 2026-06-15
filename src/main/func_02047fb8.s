; func_02047fb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020480b4
        .global func_02047fb8
        .arm
func_02047fb8:
    stmdb sp!, {r4, lr}
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    cmp r4, #0x4
    addls pc, pc, r4, lsl #0x2
    b .L_174
    b .L_174
    b .L_148
    b .L_154
    b .L_160
    b .L_16c
.L_148:
    mov r0, #0x9
    mvn r2, #0x0
    b .L_174
.L_154:
    mov r0, #0x9
    mvn r2, #0x1
    b .L_174
.L_160:
    mov r0, #0x6
    mvn r2, #0x9
    b .L_174
.L_16c:
    mov r0, #0x6
    mvn r2, #0x13
.L_174:
    ldr r1, _LIT0
    add r1, r2, r1
    bl func_020480b4
    mov r0, r4
    ldmia sp!, {r4, pc}
_LIT0: .word 0xffff11b8
