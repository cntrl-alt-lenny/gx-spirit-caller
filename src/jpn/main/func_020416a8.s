; func_020416a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe710
        .extern data_020fe818
        .extern func_02041360
        .extern func_0209150c
        .extern func_020a7294
        .extern func_020aace8
        .extern func_020aafd0
        .global func_020416a8
        .arm
func_020416a8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r6, r2
    mov r8, r0
    ldr r2, _LIT0
    mov r0, r6
    mov r7, r1
    add r5, r8, r2
    bl func_020aace8
    mov r4, r0
    ldr r0, _LIT1
    bl func_020aace8
    mov r9, r0
    mov r0, r7
    bl func_020aace8
    sub r1, r9, #0x4
    add r0, r1, r0
    add r4, r4, r0
    ldr r2, [r5, #0x8]
    ldr r1, [r5, #0x4]
    add r0, r4, #0x1
    sub r1, r2, r1
    cmp r0, r1
    ble .L_1b4
    sub r2, r4, r1
    mov r0, r8
    mov r1, r5
    add r2, r2, #0x1
    bl func_02041360
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_1b4:
    ldr r0, [r5]
    ldr r1, _LIT2
    bl func_020aafd0
    add r8, r0, #0x2
    ldrsb r9, [r0, #0x2]
    mov r0, r8
    bl func_020aace8
    add r2, r0, #0x1
    add r0, r8, r4
    mov r1, r8
    bl func_020a7294
    ldr r2, _LIT1
    str r6, [sp]
    mov r3, r7
    mov r0, r8
    add r1, r4, #0x1
    bl func_0209150c
    strb r9, [r8, r0]
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, r4
    str r1, [r5, #0x4]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x000019f4
_LIT1: .word data_020fe818
_LIT2: .word data_020fe710
