; func_0208735c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020954b4
        .extern func_020954f4
        .extern func_02095584
        .extern func_02095c08
        .global func_0208735c
        .arm
func_0208735c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    bne .L_48
    bl func_02095c08
    ldr r1, [r4]
    mov r2, #0x1
    mov r1, r2, lsl r1
    ands r0, r1, r0
    ldmeqia sp!, {r4, pc}
    bl func_020954b4
    mov r4, r0
    mov r0, #0x1
    bl func_02095584
    mov r0, r4
    bl func_020954f4
    ldmia sp!, {r4, pc}
.L_48:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    bne .L_64
    ldr r0, [r4, #0x10]
    bl func_020954f4
    mov r0, #0x1
    str r0, [r4, #0xc]
.L_64:
    bl func_02095c08
    ldr r1, [r4]
    mov r2, #0x1
    mov r1, r2, lsl r1
    ands r0, r1, r0
    bne .L_64
    ldmia sp!, {r4, pc}
