; func_020091d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02008bf4
        .extern func_02008c68
        .extern func_02008f9c
        .global func_020091d8
        .arm
func_020091d8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_02008bf4
    cmp r6, #0x0
    beq .L_4bc
    cmp r6, #0x1
    beq .L_4cc
    b .L_4e4
.L_4bc:
    mov r0, r5
    mov r1, r4
    bl func_02008f9c
    ldmia sp!, {r4, r5, r6, pc}
.L_4cc:
    mov r0, #0x1
    mov r1, r5
    mov r2, r0
    bl func_02008c68
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_4e4:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
