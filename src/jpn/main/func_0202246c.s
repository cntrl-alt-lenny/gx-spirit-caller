; func_0202246c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020221f8
        .extern func_0202221c
        .global func_0202246c
        .arm
func_0202246c:
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    mov r3, #0x0
    beq .L_260
    cmp r1, #0x1
    bne .L_264
    cmp r2, #0x20
    blt .L_250
    sub r1, r2, #0x20
    bl func_0202221c
    mov r3, r0
    b .L_264
.L_250:
    mov r0, r2
    bl func_020221f8
    mov r3, r0
    b .L_264
.L_260:
    mov r3, r2
.L_264:
    mov r0, r3
    ldmia sp!, {r3, pc}
