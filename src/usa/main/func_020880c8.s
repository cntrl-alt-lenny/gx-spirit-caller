; func_020880c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02088098
        .extern func_02094f3c
        .extern func_020954b4
        .extern func_020954f4
        .extern func_02095584
        .extern func_0209a700
        .extern func_0209a718
        .global func_020880c8
        .arm
func_020880c8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r0, [r4, #0x24]
    mov r0, r0, lsl #0x1e
    movs r0, r0, asr #0x1f
    beq .L_6c
    ldr r0, [r4, #0x40]
    mov r2, #0x1
    mov r1, #0x0
    mov r2, r2, lsl r0
    ldr r0, [r4, #0x44]
    mov r3, r1
    bl func_02094f3c
    add r0, r4, #0x8
    bl func_0209a718
    add r0, r4, #0x14
    bl func_0209a700
    ldr r0, [r4, #0x24]
    bic r0, r0, #0x2
    str r0, [r4, #0x24]
    bl func_020954b4
    mov r5, r0
    mov r0, #0x1
    bl func_02095584
    mov r0, r5
    bl func_020954f4
.L_6c:
    mov r0, r4
    bl func_02088098
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
