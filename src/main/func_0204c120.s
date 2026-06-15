; func_0204c120 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff9c4
        .extern func_02049038
        .extern func_02049120
        .extern func_020498f0
        .extern func_0204ab88
        .extern func_0204f280
        .global func_0204c120
        .arm
func_0204c120:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    ldr r1, _LIT0
    mov r0, #0x1
    mov r2, #0x0
    bl func_02049038
    bl func_0204ab88
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, pc}
    bl func_0204f280
    bl func_020498f0
    ldr r0, [r0, #0x20c]
    cmp r0, #0x0
    movne r6, #0x1
    bne .L_10a4
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    moveq r6, #0x1
    movne r6, #0x0
.L_10a4:
    bl func_020498f0
    ldr r0, [r0, #0x20c]
    cmp r0, #0x0
    moveq r7, #0x1
    movne r7, #0x0
    bl func_020498f0
    mov r5, r0
    bl func_020498f0
    ldr r0, [r0, #0x20c]
    bl func_02049120
    mov r4, r0
    bl func_020498f0
    str r4, [sp]
    ldr r1, [r0, #0x468]
    mov r2, r7
    str r1, [sp, #0x4]
    ldr ip, [r5, #0x464]
    mov r3, r6
    mov r0, #0x0
    mov r1, #0x1
    blx ip
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x1a9]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_020ff9c4
