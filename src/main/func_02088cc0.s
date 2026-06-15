; func_02088cc0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a524c
        .extern func_02088874
        .extern func_0208b040
        .extern func_0208b058
        .extern func_0208b070
        .extern func_02094f14
        .global func_02088cc0
        .arm
func_02088cc0:
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
    bl func_0208b058
    ldr r0, [r5, #0x4c]
    cmp r0, #0x0
    beq .L_7e0
    mov r0, r4
    bl func_0208b040
    cmp r0, #0x0
    beq .L_7e0
    bl func_02088874
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_7e0:
    mov r0, r4
    bl func_0208b070
    ldr r1, [r5, #0x50]
    mov r4, r0, asr #0x8
    cmp r4, r1
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    ldr r0, [r5, #0x24]
    mov r1, r4
    mov r2, #0x0
    bl func_02094f14
    str r4, [r5, #0x50]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_021a524c
