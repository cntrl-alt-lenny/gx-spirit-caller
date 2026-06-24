; func_02089a7c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02094d18
        .extern func_02095cec
        .extern func_02095d34
        .global func_02089a7c
        .arm
func_02089a7c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r5, r2
    mov r7, r0
    mov r4, r3
    mov r6, r1
    mov r0, r5
    mov r1, r4
    bl func_02095cec
    cmp r7, r0
    bne .L_268
    mov r0, r5
    mov r1, r4
    mov r2, #0x0
    bl func_02095d34
.L_268:
    mov r0, r7
    add r1, r7, r6
    bl func_02094d18
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
