; func_020091f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02008c10
        .extern func_02008c84
        .extern func_02008fb8
        .global func_020091f4
        .arm
func_020091f4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_02008c10
    cmp r6, #0x0
    beq .L_500
    cmp r6, #0x1
    beq .L_510
    b .L_528
.L_500:
    mov r0, r5
    mov r1, r4
    bl func_02008fb8
    ldmia sp!, {r4, r5, r6, pc}
.L_510:
    mov r0, #0x1
    mov r1, r5
    mov r2, r0
    bl func_02008c84
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_528:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
