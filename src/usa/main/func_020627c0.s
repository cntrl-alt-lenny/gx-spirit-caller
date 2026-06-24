; func_020627c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206220c
        .extern func_0206441c
        .global func_020627c0
        .arm
func_020627c0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r0
    mov r5, r1
    ldr r1, [r5]
    ldrh r2, [r4, #0x66]
    ldr r0, [r4, #0x50]
    add r1, r1, #0x5
    bl func_0206441c
    ldr r3, [r4, #0x50]
    ldr r1, [r5]
    ldr r2, [r5, #0x4]
    mov r0, r4
    add r1, r3, r1
    bl func_0206220c
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, pc}
    ldr r0, [r4, #0x88]
    str r0, [r5, #0xc]
    ldr r0, [r5]
    ldr r1, [r4, #0x50]
    add r0, r0, #0x2
    ldrb r0, [r1, r0]
    cmp r0, #0x2
    ldreq r0, [r4, #0x88]
    streq r0, [r4, #0x8c]
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
