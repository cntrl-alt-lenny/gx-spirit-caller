; func_02044334 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219d998
        .extern func_02043b20
        .extern func_02043b8c
        .extern func_02043bd8
        .extern func_020a662c
        .global func_02044334
        .arm
func_02044334:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov sl, r0
    ldr r8, [r1]
    mov r7, sl
    mov r9, #0x0
    add r4, sl, #0x400
    add r6, sl, #0x500
    mov r5, #0x100
    mov fp, #0xfe
.L_2c:
    mov r0, r6
    mov r1, r7
    mov r2, fp
    bl func_020a662c
    add r1, sl, r9, lsl #0x8
    strh r0, [r1, #0xfe]
.L_44:
    mov r0, r8
    mov r1, r5
    mov r2, r7
    bl func_02043bd8
    mov r0, r7
    mov r1, r8
    mov r2, r5
    mov r3, r4
    bl func_02043b8c
    cmp r0, #0x0
    beq .L_44
    add r9, r9, #0x1
    cmp r9, #0x4
    add r7, r7, #0x100
    add r8, r8, #0x100
    blt .L_2c
    bl func_02043b20
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0219d998
