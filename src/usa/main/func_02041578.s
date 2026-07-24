; func_02041578 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe80c
        .extern data_020fe810
        .extern func_02041360
        .extern func_02043868
        .extern OS_SNPrintf
        .extern func_020aace8
        .global func_02041578
        .arm
func_02041578:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    mov sl, r0
    add r0, sl, #0x1000
    ldr r4, [r0, #0x9f0]
    ldr r0, _LIT0
    cmp r4, #0x0
    ldreq r6, _LIT1
    mov r8, r2
    add r5, sl, #0x1000
    add r4, sl, r0
    ldr r0, [r5, #0x9f0]
    mov r7, r3
    add fp, r0, #0x1
    mov r2, #0x0
    mov r9, r1
    ldrne r6, _LIT2
    mov r0, r8
    mov r1, r7
    mov r3, r2
    str fp, [r5, #0x9f0]
    bl func_02043868
    mov r5, r0
    mov r0, r6
    bl func_020aace8
    mov fp, r0
    mov r0, r9
    bl func_020aace8
    sub r1, fp, #0x2
    add r2, r1, r0
    ldr r0, [r4, #0x4]
    ldr r1, [r4, #0x8]
    add r2, r5, r2
    sub r1, r1, r0
    cmp r2, r1
    ble .L_c0
    sub r2, r2, r1
    mov r0, sl
    mov r1, r4
    add r2, r2, #0x1
    bl func_02041360
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [r4, #0x4]
    ldr r1, [r4, #0x8]
    sub r1, r1, r0
.L_c0:
    mov r2, r6
    mov r3, r9
    bl OS_SNPrintf
    ldr r2, [r4, #0x4]
    mov r1, r7
    add r0, r2, r0
    str r0, [r4, #0x4]
    ldr r2, [r4, #0x4]
    ldr r3, [r4, #0x8]
    mov r0, r8
    sub r3, r3, r2
    sub r3, r3, #0x1
    bl func_02043868
    cmp r0, #0x0
    addlt sp, sp, #0x4
    movlt r0, #0x1
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, r5
    str r1, [r4, #0x4]
    ldr r1, [r4, #0x4]
    strb r0, [r1]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x000019f4
_LIT1: .word data_020fe80c
_LIT2: .word data_020fe810
