; func_02041360 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe7d0
        .extern data_020fe7e0
        .extern func_02094688
        .global func_02041360
        .arm
func_02041360:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    add r0, r0, #0x1000
    mov r5, r2
    cmp r5, #0x0
    ldr r7, [r0, #0x14]
    ldr r2, [r0, #0x10]
    mov r6, r1
    addle sp, sp, #0x4
    movle r0, #0x0
    ldmleia sp!, {r4, r5, r6, r7, pc}
    ldr r1, [r6, #0xc]
    ldr r0, _LIT0
    add r1, r1, r5
    blx r2
    movs r4, r0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr r0, [r6]
    ldr r2, [r6, #0xc]
    mov r1, r4
    bl func_02094688
    ldr r1, [r6]
    ldr r0, _LIT1
    mov r2, #0x0
    blx r7
    cmp r4, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr r0, [r6]
    ldr r1, [r6, #0x4]
    sub r0, r4, r0
    add r0, r1, r0
    str r0, [r6, #0x4]
    ldr r1, [r6, #0xc]
    mov r0, #0x1
    add r1, r1, r5
    str r1, [r6, #0xc]
    str r4, [r6]
    ldr r1, [r6, #0xc]
    add r1, r4, r1
    str r1, [r6, #0x8]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_020fe7d0
_LIT1: .word data_020fe7e0
