; func_ov003_021cedf8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201e7ec
        .extern func_0201e800
        .extern func_0201e964
        .extern func_0207fd28
        .global func_ov003_021cedf8
        .arm
func_ov003_021cedf8:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x28
    ldr r4, [sp, #0x38]
    ldr r0, [sp, #0x3c]
    mov lr, r4, lsl #0xc
    mov ip, r0, lsl #0xc
    mov r4, r3
    mvn r0, #0x0
    mov r6, r1
    mov r5, r2
    str lr, [sp, #0x20]
    str ip, [sp, #0x24]
    cmp r4, r0
    beq .L_1f9c
    mov r1, r4, lsl #0x10
    mov r0, r5
    mov r1, r1, lsr #0x10
    bl func_0201e800
.L_1f9c:
    mov r3, #0x0
    str r3, [sp]
    ldr r1, [sp, #0x40]
    str r3, [sp, #0x4]
    str r1, [sp, #0x8]
    ldr r0, [sp, #0x44]
    ldr r1, [sp, #0x48]
    str r0, [sp, #0xc]
    ldr r0, [sp, #0x4c]
    str r1, [sp, #0x10]
    str r0, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r1, [r5, #0x2c]
    add r2, sp, #0x20
    mov r0, r6
    bl func_0201e964
    mvn r0, #0x0
    cmp r4, r0
    addne sp, sp, #0x28
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r5
    mov r1, #0x1
    bl func_0201e7ec
    mov r0, r5
    mov r1, #0x1000
    bl func_0207fd28
    add sp, sp, #0x28
    ldmia sp!, {r4, r5, r6, pc}
