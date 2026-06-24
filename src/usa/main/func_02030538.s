; func_02030538 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202de48
        .extern func_02030068
        .global func_02030538
        .arm
func_02030538:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0202de48
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
    bl func_02030068
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r4, pc}
