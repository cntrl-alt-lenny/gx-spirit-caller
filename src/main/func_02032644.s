; func_02032644 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02031e80
        .extern func_02031e90
        .extern func_02032634
        .extern func_02046ac4
        .global func_02032644
        .arm
func_02032644:
    stmdb sp!, {r3, lr}
    bl func_02032634
    cmp r0, #0x1
    beq .L_1c
    cmp r0, #0x2
    beq .L_28
    b .L_30
.L_1c:
    bl func_02031e80
    bl func_02031e90
    ldmia sp!, {r3, pc}
.L_28:
    bl func_02046ac4
    ldmia sp!, {r3, pc}
.L_30:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
