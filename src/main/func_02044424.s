; func_02044424 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219da78
        .extern func_02043b70
        .extern func_02043bdc
        .extern func_02043c28
        .global func_02044424
        .arm
func_02044424:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    ldr r3, _LIT0
    mov r4, r0
    ldr r6, [r3]
    mov r9, r1
    mov r8, r2
    mov r7, #0x0
    mov r5, #0x100
.L_c4:
    ldr r0, [r9, r7, lsl #0x2]
    cmp r0, #0x0
    beq .L_fc
.L_d0:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_02043c28
    mov r0, r4
    mov r1, r6
    mov r2, r5
    mov r3, r8
    bl func_02043bdc
    cmp r0, #0x0
    beq .L_d0
.L_fc:
    add r7, r7, #0x1
    cmp r7, #0x4
    add r4, r4, #0x100
    add r6, r6, #0x100
    blt .L_c4
    bl func_02043b70
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_0219da78
