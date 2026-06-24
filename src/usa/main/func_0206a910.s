; func_0206a910 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02067910
        .extern func_020aace8
        .extern func_020b377c
        .global func_0206a910
        .arm
func_0206a910:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r9, r0
    mov r7, r2
    add r0, r9, #0x54
    mov r8, r1
    bl func_020aace8
    mov r5, r0
    cmp r7, #0x0
    add r4, r9, #0x54
    mov r6, #0x0
    ble .L_8c
.L_30:
    mov r0, r6
    mov r1, r5
    bl func_020b377c
    ldrsb r1, [r4, r1]
    mov r2, r6, lsr #0x1f
    rsb r0, r2, r6, lsl #0x1d
    mul r3, r6, r1
    mov r1, r3, lsr #0x1f
    add r2, r2, r0, ror #0x1d
    rsb r0, r1, r3, lsl #0x1d
    add r2, r9, r2
    add r3, r1, r0, ror #0x1d
    ldrsb r0, [r8, r6]
    ldrsb r1, [r2, #0x74]
    add r2, r9, r3
    add r6, r6, #0x1
    eor r0, r1, r0
    ldrsb r1, [r2, #0x74]
    mov r0, r0, lsl #0x18
    cmp r6, r7
    eor r0, r1, r0, asr #0x18
    strb r0, [r2, #0x74]
    blt .L_30
.L_8c:
    ldr r0, _LIT0
    add r1, r9, #0x74
    add r0, r9, r0
    mov r2, #0x8
    bl func_02067910
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x000004bc
