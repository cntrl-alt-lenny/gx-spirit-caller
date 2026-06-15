; func_02050054 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff9c4
        .extern func_0204525c
        .extern func_02049038
        .extern func_02049120
        .extern func_020498f0
        .extern func_0204bd8c
        .extern func_0204f280
        .global func_02050054
        .arm
func_02050054:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    mov r4, r0
    mov r5, r1
    bl func_020498f0
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r4, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    bl func_0204bd8c
    mov r0, r4
    mov r1, r5
    bl func_0204525c
    ldr r1, _LIT0
    mov r0, #0x1
    mov r2, #0x0
    bl func_02049038
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    moveq r7, #0x1
    movne r7, #0x0
    bl func_020498f0
    ldr r0, [r0, #0x20c]
    cmp r0, #0x0
    moveq r8, #0x1
    movne r8, #0x0
    bl func_020498f0
    mov r6, r0
    bl func_020498f0
    ldr r0, [r0, #0x20c]
    bl func_02049120
    mov r5, r0
    bl func_020498f0
    str r5, [sp]
    ldr r1, [r0, #0x468]
    mov r0, r4
    str r1, [sp, #0x4]
    ldr r4, [r6, #0x464]
    mov r2, r8
    mov r3, r7
    mov r1, #0x0
    blx r4
    bl func_0204f280
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_020ff9c4
