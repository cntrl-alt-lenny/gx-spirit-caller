; func_02032028 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02031ffc
        .extern func_020322e8
        .extern func_020945f4
        .global func_02032028
        .arm
func_02032028:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    bl func_02031ffc
    movs r4, r0
    bne .L_34
    mov r0, r6
    bl func_020322e8
    mov r0, r6
    mov r1, r5
    bl func_02031ffc
    movs r4, r0
    beq .L_44
.L_34:
    mov r0, r4
    mov r2, r5
    mov r1, #0x0
    bl func_020945f4
.L_44:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
