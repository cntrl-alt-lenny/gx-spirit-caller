; func_02051a3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02045230
        .extern func_0204987c
        .extern func_020689ac
        .extern func_02068c54
        .global func_02051a3c
        .arm
func_02051a3c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_0204987c
    cmp r0, #0x0
    beq .L_28
    bl func_02045230
    cmp r0, #0x0
    beq .L_30
.L_28:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
.L_30:
    bl func_0204987c
    ldr r0, [r0, #0xe4]
    mov r1, r6
    bl func_02068c54
    cmp r0, #0x0
    beq .L_58
    mov r1, r5
    mov r2, r4
    bl func_020689ac
    mov r4, r0
.L_58:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
