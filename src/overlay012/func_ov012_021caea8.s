; func_ov012_021caea8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov012_021cc7a0
        .extern func_0201e7ec
        .extern func_0201e800
        .extern func_0201e964
        .extern func_0207fd28
        .global func_ov012_021caea8
        .arm
func_ov012_021caea8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x20
    ldr ip, _LIT0
    mov r4, r1
    mvn r1, #0x0
    mov r7, r2
    mov r6, r3
    cmp r4, r1
    ldr r5, [ip, r0, lsl #0x2]
    beq .L_a90
    mov r1, r4, lsl #0x10
    mov r0, r5
    mov r1, r1, lsr #0x10
    bl func_0201e800
.L_a90:
    mov r3, #0x0
    str r3, [sp]
    stmib sp, {r3, r6, r7}
    str r3, [sp, #0x10]
    ldr r0, [sp, #0x3c]
    str r3, [sp, #0x14]
    str r0, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r1, [r5, #0x2c]
    ldr r2, [sp, #0x38]
    mov r0, #0x1
    bl func_0201e964
    mvn r0, #0x0
    cmp r4, r0
    addne sp, sp, #0x20
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r5
    mov r1, #0x1
    bl func_0201e7ec
    mov r0, r5
    mov r1, #0x1000
    bl func_0207fd28
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov012_021cc7a0
