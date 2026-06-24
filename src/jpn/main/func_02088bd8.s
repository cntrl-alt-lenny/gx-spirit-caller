; func_02088bd8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a516c
        .extern func_0208878c
        .extern func_0208af58
        .extern func_0208af70
        .extern func_0208af88
        .extern func_02094e20
        .global func_02088bd8
        .arm
func_02088bd8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r5, _LIT0
    ldr r0, [r5]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    ldr r0, [r5, #0x4]
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, pc}
    add r4, r5, #0x3c
    mov r0, r4
    bl func_0208af70
    ldr r0, [r5, #0x4c]
    cmp r0, #0x0
    beq .L_4ac
    mov r0, r4
    bl func_0208af58
    cmp r0, #0x0
    beq .L_4ac
    bl func_0208878c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_4ac:
    mov r0, r4
    bl func_0208af88
    ldr r1, [r5, #0x50]
    mov r4, r0, asr #0x8
    cmp r4, r1
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    ldr r0, [r5, #0x24]
    mov r1, r4
    mov r2, #0x0
    bl func_02094e20
    str r4, [r5, #0x50]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_021a516c
