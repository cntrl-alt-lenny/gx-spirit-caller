; func_0204ffe0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff8e4
        .extern func_0204520c
        .extern func_02048fc4
        .extern func_020490ac
        .extern func_0204987c
        .extern func_0204bd18
        .extern func_0204f20c
        .global func_0204ffe0
        .arm
func_0204ffe0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    mov r4, r0
    mov r5, r1
    bl func_0204987c
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r4, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    bl func_0204bd18
    mov r0, r4
    mov r1, r5
    bl func_0204520c
    ldr r1, _LIT0
    mov r0, #0x1
    mov r2, #0x0
    bl func_02048fc4
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    moveq r7, #0x1
    movne r7, #0x0
    bl func_0204987c
    ldr r0, [r0, #0x204]
    cmp r0, #0x0
    moveq r8, #0x1
    movne r8, #0x0
    bl func_0204987c
    mov r6, r0
    bl func_0204987c
    ldr r0, [r0, #0x204]
    bl func_020490ac
    mov r5, r0
    bl func_0204987c
    str r5, [sp]
    ldr r1, [r0, #0x460]
    mov r0, r4
    str r1, [sp, #0x4]
    ldr r4, [r6, #0x45c]
    mov r2, r8
    mov r3, r7
    mov r1, #0x0
    blx r4
    bl func_0204f20c
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_020ff8e4
