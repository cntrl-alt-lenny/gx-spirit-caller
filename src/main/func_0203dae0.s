; func_0203dae0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203c888
        .extern func_0203c900
        .extern func_0203d888
        .extern func_0203d9c4
        .global func_0203dae0
        .arm
func_0203dae0:
    stmdb sp!, {r4, lr}
    bl func_0203c888
    mov r4, r0
    mov r0, #0x10
    bl func_0203c900
    cmp r4, #0x7
    beq .L_428
    cmp r4, #0x8
    beq .L_434
    b .L_43c
.L_428:
    bl func_0203d9c4
    mov r4, r0
    b .L_43c
.L_434:
    bl func_0203d888
    mov r4, r0
.L_43c:
    mov r0, r4
    ldmia sp!, {r4, pc}
