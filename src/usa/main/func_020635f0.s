; func_020635f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101454
        .extern func_020552bc
        .extern func_02061944
        .extern func_020a734c
        .global func_020635f0
        .arm
func_020635f0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r0, [r4, #0x34]
    mov r5, r1
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, pc}
    cmp r2, #0x8
    addne sp, sp, #0x4
    movne r0, #0x1
    ldmneia sp!, {r4, r5, pc}
    ldr r1, _LIT0
    mov r0, r5
    mov r2, #0x4
    bl func_020a734c
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x1
    ldmneia sp!, {r4, r5, pc}
    add r2, r5, #0x4
    ldrb r1, [r5, #0x4]
    ldrb r0, [r2, #0x1]
    add r3, sp, #0x0
    strb r1, [r3]
    strb r0, [r3, #0x1]
    ldrb r1, [r2, #0x2]
    ldrb r0, [r2, #0x3]
    strb r1, [r3, #0x2]
    strb r0, [r3, #0x3]
    bl func_020552bc
    mov r2, r0
    ldr r1, [sp]
    mov r0, r4
    sub r1, r2, r1
    bl func_02061944
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_02101454
