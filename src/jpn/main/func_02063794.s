; func_02063794 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02064228
        .extern func_02064364
        .extern func_02064430
        .global func_02063794
        .arm
func_02063794:
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r2, #0x2
    beq .L_110
    bl func_02064364
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
.L_110:
    mov r0, r1
    mov r1, #0x0
    bl func_02064430
    mov r1, r0
    mov r0, r4
    bl func_02064228
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
