; func_0203a7fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219c3b4
        .extern func_0207cef4
        .extern func_02088f3c
        .global func_0203a7fc
        .arm
func_0203a7fc:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    tst r5, #0x8000000
    bne .L_ec
    bl func_02088f3c
    cmp r0, #0x0
    subne r0, r0, #0x20
    ldmneia sp!, {r3, r4, r5, pc}
.L_ec:
    ldr r4, _LIT0
    mov r1, #0x0
.L_f4:
    mov r0, r4
    bl func_0207cef4
    movs r1, r0
    ldrne r0, [r1, #0x14]
    cmpne r0, r5
    bne .L_f4
    mov r0, r1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_0219c3b4
