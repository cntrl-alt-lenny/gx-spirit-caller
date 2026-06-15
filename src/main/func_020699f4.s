; func_020699f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206b670
        .extern func_0206b6fc
        .global func_020699f4
        .arm
func_020699f4:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    cmp r2, #0x6
    mov r4, r0
    addlt sp, sp, #0xc
    movlt r0, #0x4
    ldmltia sp!, {r4, r5, pc}
    ldrb ip, [r1]
    ldrb r2, [r1, #0x1]
    add r5, sp, #0x4
    add r3, r1, #0x4
    strb ip, [r5]
    strb r2, [r5, #0x1]
    ldrb lr, [r1, #0x2]
    ldrb r2, [r1, #0x3]
    add ip, sp, #0x0
    strb lr, [r5, #0x2]
    strb r2, [r5, #0x3]
    ldrb r2, [r1, #0x4]
    ldrb r1, [r3, #0x1]
    strb r2, [ip]
    strb r1, [ip, #0x1]
    ldrh r2, [sp]
    ldr r1, [sp, #0x4]
    bl func_0206b6fc
    mov r1, r0
    mvn r0, #0x0
    cmp r1, r0
    addeq sp, sp, #0xc
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, pc}
    mov r0, r4
    bl func_0206b670
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
