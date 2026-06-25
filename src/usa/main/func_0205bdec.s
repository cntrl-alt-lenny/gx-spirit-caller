; func_0205bdec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100a28
        .extern func_02045398
        .extern func_0205ff4c
        .global func_0205bdec
        .arm
func_0205bdec:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    mov r0, #0x24
    mov r7, r1
    mov r6, r2
    mov r5, r3
    ldr r4, [r8]
    bl func_02045398
    cmp r0, #0x0
    bne .L_3c
    ldr r1, _LIT0
    mov r0, r8
    bl func_0205ff4c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_3c:
    str r7, [r0]
    ldr r1, [sp, #0x18]
    str r6, [r0, #0x4]
    str r1, [r0, #0x8]
    mov r1, #0x0
    str r1, [r0, #0x14]
    cmp r7, #0x0
    moveq r1, #0x1
    streq r1, [r0, #0x18]
    beq .L_84
    ldr r2, [r4, #0x20c]
    add r1, r2, #0x1
    str r1, [r4, #0x20c]
    str r2, [r0, #0x18]
    ldr r1, [r4, #0x20c]
    cmp r1, #0x2
    movlt r1, #0x2
    strlt r1, [r4, #0x20c]
.L_84:
    mov r3, #0x0
    ldr r2, [sp, #0x1c]
    str r3, [r0, #0x1c]
    ldr r1, [sp, #0x20]
    str r2, [r0, #0xc]
    str r1, [r0, #0x10]
    ldr r1, [r4, #0x424]
    str r1, [r0, #0x20]
    str r0, [r4, #0x424]
    str r0, [r5]
    mov r0, r3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_02100a28
