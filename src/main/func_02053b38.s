; func_02053b38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02053b38
        .arm
func_02053b38:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    ldr r7, [sp, #0x2c]
    mov r6, #0x0
    str r0, [sp]
    mov sl, r1
    mov r9, r3
    str r6, [r7]
    subs r5, r2, #0x1
    ldr r8, [sp, #0x28]
    bmi .L_424
    mov fp, #0x1
.L_3f4:
    add r0, r6, r5
    mov r4, r0, asr #0x1
    mla r0, r4, r9, sl
    ldr r1, [sp]
    blx r8
    cmp r0, #0x0
    streq fp, [r7]
    cmp r0, #0x0
    addlt r6, r4, #0x1
    subge r5, r4, #0x1
    cmp r6, r5
    ble .L_3f4
.L_424:
    mla r0, r6, r9, sl
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
