; func_ov002_0229f160 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0229f2f8
        .global func_ov002_0229f160
        .arm
func_ov002_0229f160:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    ldr r3, [r6]
    mov r5, r1
    cmp r3, #0x0
    mov r4, r2
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    add r1, sp, #0x4
    add r2, sp, #0x0
    bl func_ov002_0229f2f8
    ldr r1, [r6, #0xc]
    cmp r5, r1, lsl #0x3
    blt .L_978
    ldr r0, [sp, #0x4]
    add r0, r0, r1, lsl #0x3
    cmp r5, r0
    bge .L_978
    ldr r1, [r6, #0x10]
    cmp r4, r1, lsl #0x3
    blt .L_978
    ldr r0, [sp]
    add r0, r0, r1, lsl #0x3
    cmp r4, r0
    addlt sp, sp, #0x8
    movlt r0, #0x1
    ldmltia sp!, {r4, r5, r6, pc}
.L_978:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
