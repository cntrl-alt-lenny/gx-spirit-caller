; func_02022af4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b3870
        .global func_02022af4
        .arm
func_02022af4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r3
    mov r7, r1
    ldr r2, [r6]
    sub r5, r7, r0
    mul r0, r2, r5
    ldr r4, [sp, #0x18]
    bl func_020b3870
    str r0, [r4]
    ldr r2, [r6, #0x4]
    mov r1, r7
    mul r0, r2, r5
    bl func_020b3870
    str r0, [r4, #0x4]
    ldr r2, [r6, #0x8]
    mov r1, r7
    mul r0, r2, r5
    bl func_020b3870
    str r0, [r4, #0x8]
    tst r5, #0x2
    beq .L_62c
    ldr r0, [r4]
    rsb r0, r0, #0x0
    str r0, [r4]
    ldr r0, [r4, #0x4]
    rsb r0, r0, #0x0
    str r0, [r4, #0x4]
    ldr r0, [r4, #0x8]
    rsb r0, r0, #0x0
    str r0, [r4, #0x8]
.L_62c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
