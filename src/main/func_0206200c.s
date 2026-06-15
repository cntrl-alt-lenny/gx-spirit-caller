; func_0206200c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02061a8c
        .extern func_02061fa4
        .extern func_020628fc
        .extern func_02062b48
        .extern func_02064790
        .global func_0206200c
        .arm
func_0206200c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    beq .L_b0c
    ldr r1, [r4, #0xc]
    cmp r1, #0x7
    ldmgeia sp!, {r4, pc}
    bl func_02061fa4
    mov r0, r4
    bl func_020628fc
    mov r0, r4
    mov r1, #0x0
    bl func_02061a8c
    mov r0, r4
    bl func_02064790
    ldmia sp!, {r4, pc}
.L_b0c:
    mov r1, #0x6
    str r1, [r4, #0xc]
    bl func_02062b48
    ldmia sp!, {r4, pc}
