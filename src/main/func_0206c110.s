; func_0206c110 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206bd74
        .extern func_0206c2c0
        .extern func_020919d8
        .extern func_02091d24
        .extern func_02092614
        .extern func_02092844
        .global func_0206c110
        .arm
func_0206c110:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r5, r2
    mov r7, r0
    mov r0, r5
    mov r6, r1
    bl func_0206c2c0
    add r4, r7, r0
    ldrb r2, [r5, #0x3]
    mov r0, r6
    mov r1, r7
    bl func_02092614
    add r0, r6, #0xe0
    bl func_02092844
    ldrh r2, [r5]
    add r0, r6, #0x20
    ldr r1, _LIT0
    str r2, [sp]
    ldrb ip, [r5, #0x2]
    mov r2, r6
    mov r3, r4
    str ip, [sp, #0x4]
    bl func_02091d24
    add r0, r6, #0x20
    bl func_020919d8
    mov r0, r4
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word func_0206bd74
