; func_ov001_021c9f24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_ov001_021ca348
        .extern data_ov001_021ca404
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_020aaf40
        .global func_ov001_021c9f24
        .arm
func_ov001_021c9f24:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x80
    ldr lr, _LIT0
    add ip, sp, #0x50
    mov r5, r0
    ldmia lr!, {r0, r1, r2, r3}
    stmia ip!, {r0, r1, r2, r3}
    ldmia lr!, {r0, r1, r2, r3}
    stmia ip!, {r0, r1, r2, r3}
    ldmia lr, {r0, r1, r2, r3}
    ldr r4, _LIT1
    stmia ip, {r0, r1, r2, r3}
    ldr r0, [r4, #0x34]
    cmp r0, #0x0
    movne r1, #0x1
    moveq r1, #0x0
    mov r0, #0x18
    mul r4, r1, r0
    add r0, sp, #0x54
    add r0, r0, r4
    ldr r6, [r0, r5, lsl #0x3]
    ldr r1, _LIT2
    mov r0, r6
    bl func_020aaf40
    cmp r0, #0x0
    beq .L_290
    add r0, sp, #0x28
    bl func_0201d47c
    mov r0, r6
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r2, #0x0
    ldr r1, [sp, #0x40]
    ldrh r3, [sp, #0x3c]
    str r0, [sp, #0x28]
    bic r1, r1, #0x7f
    bic r0, r3, #0xf
    strh r0, [sp, #0x3c]
    bic r3, r1, #0x3f80
    ldrh r0, [sp, #0x3c]
    str r3, [sp, #0x40]
    str r2, [sp, #0x30]
    bic r1, r0, #0x10
    add r0, sp, #0x28
    str r2, [sp, #0x34]
    strh r1, [sp, #0x3c]
    strh r2, [sp, #0x38]
    bl func_0201e5b8
    ldr r0, [sp, #0x28]
    bl func_02006e1c
.L_290:
    add r0, sp, #0x0
    bl func_0201d47c
    add r0, sp, #0x50
    add r0, r0, r4
    ldr r0, [r0, r5, lsl #0x3]
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldr r1, [sp, #0x18]
    mov r2, #0x0
    ldrh r3, [sp, #0x14]
    str r0, [sp]
    bic r1, r1, #0x7f
    bic r0, r3, #0xf
    orr r0, r0, #0x5
    strh r0, [sp, #0x14]
    bic r3, r1, #0x3f80
    ldrh r0, [sp, #0x14]
    str r3, [sp, #0x18]
    str r2, [sp, #0x8]
    bic r1, r0, #0x10
    add r0, sp, #0x0
    str r2, [sp, #0xc]
    strh r1, [sp, #0x14]
    strh r2, [sp, #0x10]
    bl func_0201e5b8
    ldr r0, [sp]
    bl func_02006e1c
    add sp, sp, #0x80
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov001_021ca348
_LIT1: .word data_021040ac
_LIT2: .word data_ov001_021ca404
