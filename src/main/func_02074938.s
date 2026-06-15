; func_02074938 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020749d4
        .global func_02074938
        .arm
func_02074938:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r4, [r5, #0xc]
    ldr r0, [r4, #0x824]
    cmp r0, #0x0
    beq .L_204
    ldrb r0, [r4, #0x456]
    cmp r0, #0x0
    bne .L_20c
.L_204:
    mov r0, r5
    bl func_020749d4
.L_20c:
    ldr r1, [r4, #0x824]
    cmp r1, #0x0
    beq .L_238
    ldrb r0, [r4, #0x456]
    cmp r0, #0x0
    ldrne r1, [r4, #0x828]
    ldrne r0, [r4, #0x82c]
    addne sp, sp, #0x4
    subne r0, r1, r0
    ldmneia sp!, {r4, r5, lr}
    bxne lr
.L_238:
    cmp r1, #0x0
    bne .L_268
    ldrb r0, [r5, #0x8]
    cmp r0, #0x4
    bne .L_258
    ldrb r0, [r4, #0x455]
    cmp r0, #0x9
    bne .L_268
.L_258:
    add sp, sp, #0x4
    mvn r0, #0x0
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_268:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
