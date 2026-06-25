; func_02074850 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020748ec
        .global func_02074850
        .arm
func_02074850:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r4, [r5, #0xc]
    ldr r0, [r4, #0x824]
    cmp r0, #0x0
    beq .L_180
    ldrb r0, [r4, #0x456]
    cmp r0, #0x0
    bne .L_188
.L_180:
    mov r0, r5
    bl func_020748ec
.L_188:
    ldr r1, [r4, #0x824]
    cmp r1, #0x0
    beq .L_1b4
    ldrb r0, [r4, #0x456]
    cmp r0, #0x0
    ldrne r1, [r4, #0x828]
    ldrne r0, [r4, #0x82c]
    addne sp, sp, #0x4
    subne r0, r1, r0
    ldmneia sp!, {r4, r5, lr}
    bxne lr
.L_1b4:
    cmp r1, #0x0
    bne .L_1e4
    ldrb r0, [r5, #0x8]
    cmp r0, #0x4
    bne .L_1d4
    ldrb r0, [r4, #0x455]
    cmp r0, #0x9
    bne .L_1e4
.L_1d4:
    add sp, sp, #0x4
    mvn r0, #0x0
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_1e4:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
