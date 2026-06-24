; func_02089b8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_02088f20
        .extern func_02088f3c
        .extern func_02089318
        .global func_02089b8c
        .arm
func_02089b8c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    movs r5, r1
    mov r7, r0
    mov r6, r2
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    bl OS_DisableIrq
    mov r4, r0
    mov r0, r5
    bl func_02089318
    mov r5, r0
    mov r0, r6
    bl func_02088f3c
    cmp r7, r0
    bne .L_4c
    mov r0, r6
    mov r1, #0x0
    bl func_02088f20
.L_4c:
    mov r0, r5
    bl func_02089318
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
