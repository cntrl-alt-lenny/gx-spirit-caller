; func_0203058c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202de9c
        .extern func_020300bc
        .global func_0203058c
        .arm
func_0203058c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0202de9c
    cmp r0, #0x0
    beq .L_fe4
    cmp r0, #0x2
    cmpne r0, #0x3
    beq .L_fec
    b .L_ff4
.L_fe4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_fec:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_ff4:
    mov r0, r4
    bl func_020300bc
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r4, pc}
