; func_020543b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffaa0
        .extern data_020ffaac
        .extern func_02053c9c
        .extern func_0205405c
        .extern func_020a6c60
        .global func_020543b8
        .arm
func_020543b8:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    movs r6, r0
    mov r5, r1
    bne .L_28
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x94
    bl func_020a6c60
.L_28:
    cmp r6, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, [r6, #0x4]
    ldr r2, [r6, #0xc]
    mov r0, r5
    blx r2
    mov r3, #0x0
    str r3, [sp]
    ldr r1, [r6]
    mov r4, r0
    ldr r0, [r1, r4, lsl #0x2]
    ldr r2, [r6, #0x10]
    mov r1, r5
    bl func_02053c9c
    mov r1, r0
    mvn r0, #0x0
    cmp r1, r0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, [r6]
    ldr r0, [r0, r4, lsl #0x2]
    bl func_0205405c
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_020ffaac
_LIT1: .word data_020ffaa0
