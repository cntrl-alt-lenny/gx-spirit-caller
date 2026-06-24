; func_02059d1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02045364
        .global func_02059d1c
        .arm
func_02059d1c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r0]
    bl func_02045364
    ldr r0, [r4, #0xc]
    mov r1, #0x0
    str r1, [r0]
    ldr r0, [r4, #0xc]
    ldr r0, [r0, #0x4]
    bl func_02045364
    ldr r0, [r4, #0xc]
    mov r1, #0x0
    str r1, [r0, #0x4]
    ldr r0, [r4, #0xc]
    ldr r0, [r0, #0x8]
    bl func_02045364
    ldr r0, [r4, #0xc]
    mov r1, #0x0
    str r1, [r0, #0x8]
    ldr r0, [r4, #0xc]
    ldr r0, [r0, #0xc]
    bl func_02045364
    ldr r0, [r4, #0xc]
    mov r1, #0x0
    str r1, [r0, #0xc]
    ldr r0, [r4, #0xc]
    ldr r0, [r0, #0x10]
    bl func_02045364
    ldr r0, [r4, #0xc]
    mov r1, #0x0
    str r1, [r0, #0x10]
    ldr r0, [r4, #0xc]
    ldr r0, [r0, #0x14]
    bl func_02045364
    ldr r0, [r4, #0xc]
    mov r1, #0x0
    str r1, [r0, #0x14]
    ldr r0, [r4, #0xc]
    ldr r0, [r0, #0xc8]
    bl func_02045364
    ldr r0, [r4, #0xc]
    mov r1, #0x0
    str r1, [r0, #0xc8]
    ldr r0, [r4, #0xc]
    bl func_02045364
    mov r0, #0x0
    str r0, [r4, #0xc]
    ldmia sp!, {r4, pc}
