; func_0206df54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206e474
        .extern func_0206e4a4
        .global func_0206df54
        .arm
func_0206df54:
    stmdb sp!, {r4, lr}
    movs r4, r0
    bmi .L_7c4
    bl func_0206e4a4
    cmp r0, #0x0
    beq .L_7c4
    mov r0, r4
    bl func_0206e474
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, lr}
    bxeq lr
.L_7c4:
    mov r0, #0x0
    ldmia sp!, {r4, lr}
    bx lr
