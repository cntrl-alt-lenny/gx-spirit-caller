; func_ov011_021cd0dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d4154
        .extern func_0201e7ec
        .extern func_0201e800
        .extern func_0201eaa0
        .extern func_0207fd28
        .global func_ov011_021cd0dc
        .arm
func_ov011_021cd0dc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x20
    ldr r4, _LIT0
    mov r7, r1
    mvn r1, #0x0
    mov r6, r2
    mov r5, r3
    cmp r7, r1
    ldr r4, [r4, r0, lsl #0x2]
    beq .L_38
    mov r1, r7, lsl #0x10
    mov r0, r4
    mov r1, r1, lsr #0x10
    bl func_0201e800
.L_38:
    mov ip, #0x0
    ldr r0, [sp, #0x44]
    str ip, [sp]
    stmib sp, {r0, r5, r6}
    ldr r0, [sp, #0x40]
    mov r1, #0x6800
    str r1, [sp, #0x10]
    mov r2, #0xe0
    mov r0, r0, lsl #0x10
    str r2, [sp, #0x14]
    ldr r1, [sp, #0x3c]
    mov r3, r0, lsr #0x10
    str r1, [sp, #0x18]
    ldr r2, [sp, #0x38]
    mov r1, r4
    mov r0, #0x1
    str ip, [sp, #0x1c]
    bl func_0201eaa0
    mvn r0, #0x0
    cmp r7, r0
    addne sp, sp, #0x20
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r4
    mov r1, #0x1
    bl func_0201e7ec
    mov r0, r4
    mov r1, #0x1000
    bl func_0207fd28
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov011_021d4154
