; func_0203c84c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203c7c4
        .extern func_0203c8b0
        .global func_0203c84c
        .arm
func_0203c84c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r0, #0x1
    bl func_0203c8b0
    mov r5, r0
    mov r0, #0x10
    bl func_0203c8b0
    mov r4, r0
    strb r6, [r5, #0x9]
    cmp r6, #0x10
    ldmcsia sp!, {r4, r5, r6, pc}
    ldrb r0, [r5, #0x16]
    cmp r6, r0
    ldmlsia sp!, {r4, r5, r6, pc}
    strb r6, [r5, #0x16]
    cmp r6, #0x7
    ldmlsia sp!, {r4, r5, r6, pc}
    ldrb r0, [r4, #0xd0d]
    bl func_0203c7c4
    strb r0, [r5, #0x15]
    ldrb r0, [r4, #0xd13]
    add r0, r4, r0, lsl #0x2
    ldrb r0, [r0, #0x444]
    strb r0, [r5, #0x14]
    ldmia sp!, {r4, r5, r6, pc}
