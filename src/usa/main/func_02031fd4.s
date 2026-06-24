; func_02031fd4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02031fa8
        .extern func_02032294
        .extern func_02094500
        .global func_02031fd4
        .arm
func_02031fd4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    bl func_02031fa8
    movs r4, r0
    bne .L_34
    mov r0, r6
    bl func_02032294
    mov r0, r6
    mov r1, r5
    bl func_02031fa8
    movs r4, r0
    beq .L_44
.L_34:
    mov r0, r4
    mov r2, r5
    mov r1, #0x0
    bl func_02094500
.L_44:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
