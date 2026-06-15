; func_02043bdc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02043ca4
        .extern func_020a7440
        .global func_02043bdc
        .arm
func_02043bdc:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r2
    mov r4, r3
    mov r6, r0
    mov r0, r1
    mov r1, r5
    mov r2, r4
    bl func_02043ca4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_020a7440
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
