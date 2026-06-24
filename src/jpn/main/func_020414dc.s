; func_020414dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe808
        .extern func_02041360
        .extern func_0209150c
        .extern func_020aace8
        .global func_020414dc
        .arm
func_020414dc:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr r2, _LIT0
    mov r7, r0
    mov r6, r1
    mov r0, r6
    add r4, r7, r2
    bl func_020aace8
    mov r5, r0
    ldr r0, [r4, #0x4]
    ldr r1, [r4, #0x8]
    sub r1, r1, r0
    cmp r5, r1
    ble .L_68
    sub r2, r5, r1
    mov r0, r7
    mov r1, r4
    add r2, r2, #0x1
    bl func_02041360
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr r0, [r4, #0x4]
    ldr r1, [r4, #0x8]
    sub r1, r1, r0
.L_68:
    ldr r2, _LIT1
    mov r3, r6
    bl func_0209150c
    cmp r0, r5
    ldreq r1, [r4, #0x4]
    movne r0, #0x1
    addeq r0, r1, r0
    streq r0, [r4, #0x4]
    moveq r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word 0x000019f4
_LIT1: .word data_020fe808
