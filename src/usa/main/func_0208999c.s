; func_0208999c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02088f84
        .extern func_02089714
        .extern func_02089a7c
        .extern func_02092800
        .extern func_02095cec
        .extern func_02095d34
        .extern func_02095d6c
        .global func_0208999c
        .arm
func_0208999c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_02095cec
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    mov r0, r7
    bl func_02095d6c
    ldr r1, [r7, #0x38]
    sub r0, r0, #0x1
    add r1, r1, r6
    add r1, r7, r1, lsl #0x2
    cmp r6, r0
    ldrcc r0, [r1, #0x40]
    ldr r8, [r1, #0x3c]
    ldrcs r0, [r7, #0x8]
    cmp r4, #0x0
    sub r9, r0, r8
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    ldr r2, _LIT0
    mov r0, r4
    mov r3, r7
    add r1, r9, #0x20
    str r6, [sp]
    bl func_02089714
    movs r4, r0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    mov r0, r5
    mov r1, r4
    mov r2, r9
    mov r3, r8
    bl func_02088f84
    cmp r9, r0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    mov r0, r4
    mov r1, r9
    bl func_02092800
    mov r0, r7
    mov r1, r6
    mov r2, r4
    bl func_02095d34
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word func_02089a7c
