; func_02032de4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02094500
        .global func_02032de4
        .arm
func_02032de4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    ldr r3, [r0, #0xeb4]
    mov r0, r5
    mov r1, r2
    blx r3
    movs r4, r0
    beq .L_f4
    mov r2, r5
    mov r1, #0x0
    bl func_02094500
.L_f4:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
