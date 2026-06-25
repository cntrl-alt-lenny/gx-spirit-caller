; func_02093754 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_01ff8624
        .extern func_020904c0
        .extern func_02090574
        .extern func_02090780
        .extern func_020937d4
        .extern func_02093b08
        .extern func_02093c50
        .extern func_0209bf20
        .global func_02093754
        .arm
func_02093754:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldrh r0, [r1]
    cmp r0, #0x2
    bne .L_1c
    bl func_02093b08
.L_1c:
    bl func_02090780
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_0209bf20
    mov r0, #0x0
    bl func_02093c50
    mov r0, #0x1
    bl func_02093c50
    mov r0, #0x2
    bl func_02093c50
    mov r0, #0x3
    bl func_02093c50
    mov r0, #0x40000
    bl func_02090574
    mvn r0, #0x0
    bl func_020904c0
    ldr r1, _LIT1
    mov r0, #0x10
    str r4, [r1]
    bl func_020937d4
    bl func_01ff8624
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word 0x027ffc40
_LIT1: .word 0x027ffc20
