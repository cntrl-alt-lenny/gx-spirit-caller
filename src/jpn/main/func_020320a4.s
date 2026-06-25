; func_020320a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02031fd4
        .global func_020320a4
        .arm
func_020320a4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    movs r4, r0
    mov r7, r1
    mov r6, r2
    mov r5, r3
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r1, #0x24
    bl func_02031fd4
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r2, [r4]
    ldr r1, [sp, #0x18]
    str r2, [r0, #0x8]
    strh r7, [r0, #0xc]
    strh r6, [r0, #0xe]
    str r5, [r0, #0x10]
    mov r3, #0x0
    str r3, [r0, #0x14]
    str r1, [r0, #0x18]
    ldr r2, [sp, #0x1c]
    ldr r1, [sp, #0x20]
    str r2, [r0, #0x1c]
    str r1, [r0, #0x20]
    str r3, [r0]
    ldr r1, [r4, #0x8]
    str r1, [r0, #0x4]
    ldr r1, [r4, #0x8]
    cmp r1, #0x0
    strne r0, [r1]
    str r0, [r4, #0x8]
    adds r1, r4, #0xc
    beq .L_c4
    ldr r1, [r4, #0xc]
    cmp r1, #0x0
    streq r0, [r4, #0xc]
.L_c4:
    ldr r2, [r4]
    mvn r1, #0x0
    add r2, r2, #0x1
    cmp r2, r1
    str r2, [r4]
    addeq r1, r2, #0x1
    streq r1, [r4]
    ldr r0, [r0, #0x8]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
