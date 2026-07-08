; func_ov002_022a09b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cbc58
        .extern data_ov002_022cbc74
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201e564
        .extern func_0208dfb8
        .extern func_02094410
        .global func_ov002_022a09b4
        .arm
func_ov002_022a09b4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x28
    mov r6, r0
    ldr r7, [r6, #0x30]
    mov r0, #0x1a
    mul r0, r7, r0
    add r5, r0, #0x1
    bl func_0208dfb8
    add r4, r0, r7, lsl #0x6
    rsb r0, r7, #0x12
    mov r2, r0, lsl #0x6
    mov r1, r4
    mov r0, #0x0
    bl func_02094410
    add r0, sp, #0x0
    bl func_0201d428
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    str r0, [sp]
    mvn r0, #0x0
    ldrh r1, [sp, #0x14]
    str r0, [sp, #0x8]
    strh r0, [sp, #0x10]
    bic r0, r1, #0xf
    orr r0, r0, #0x7
    strh r0, [sp, #0x14]
    mov r0, r5, lsl #0x6
    str r0, [sp, #0xc]
    add r0, sp, #0x0
    bl func_0201e564
    ldr r0, [sp]
    bl func_02006e00
    add r0, sp, #0x0
    bl func_0201d428
    ldr r0, _LIT1
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    str r0, [sp]
    mvn r0, #0x0
    ldrh r1, [sp, #0x14]
    str r0, [sp, #0x8]
    strh r0, [sp, #0x10]
    bic r0, r1, #0xf
    orr r0, r0, #0x7
    strh r0, [sp, #0x14]
    add r0, r5, #0x18
    mov r0, r0, lsl #0x6
    str r0, [sp, #0xc]
    add r0, sp, #0x0
    bl func_0201e564
    ldr r0, [sp]
    bl func_02006e00
    mov r0, #0x0
    mov r1, r0
    add r4, r4, #0xe
    mov r3, #0x18
.L_13c8:
    ldr r2, [r6, #0x8]
    add r0, r0, #0x1
    mvn r2, r2
    mov r2, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r2, r2, asr r0
    and r2, r2, #0x1
    mla ip, r2, r3, r5
    orr lr, ip, #0x2000
    mov r2, r1, lsl #0x1
    add ip, r4, r1, lsl #0x1
    strh lr, [r4, r2]
    add r2, lr, #0x1
    strh r2, [ip, #0x2]
    add r2, lr, #0x2
    strh r2, [ip, #0x40]
    add r2, lr, #0x3
    strh r2, [ip, #0x42]
    cmp r0, #0x6
    add r5, r5, #0x4
    add r1, r1, #0x3
    blt .L_13c8
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cbc58
_LIT1: .word data_ov002_022cbc74
