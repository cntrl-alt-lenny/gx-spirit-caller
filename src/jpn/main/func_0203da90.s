; func_0203da90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203c838
        .extern func_0203c8b0
        .extern func_0203d838
        .extern func_0203d974
        .global func_0203da90
        .arm
func_0203da90:
    stmdb sp!, {r4, lr}
    bl func_0203c838
    mov r4, r0
    mov r0, #0x10
    bl func_0203c8b0
    cmp r4, #0x7
    beq .L_428
    cmp r4, #0x8
    beq .L_434
    b .L_43c
.L_428:
    bl func_0203d974
    mov r4, r0
    b .L_43c
.L_434:
    bl func_0203d838
    mov r4, r0
.L_43c:
    mov r0, r4
    ldmia sp!, {r4, pc}
