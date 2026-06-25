; func_ov017_021b5f24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov017_021b820c
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0208e120
        .extern func_0208e1cc
        .extern func_ov017_021b61dc
        .global func_ov017_021b5f24
        .arm
func_ov017_021b5f24:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x28
    mov r4, r0
    add r0, sp, #0x0
    bl func_0201d47c
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldrh r1, [sp, #0x26]
    ldrh r3, [sp, #0x14]
    ldrh r5, [sp, #0x16]
    bic r1, r1, #0xff
    bic r6, r3, #0xf
    orr r1, r1, #0x20
    orr r6, r6, #0x2
    strh r6, [sp, #0x14]
    orr r5, r5, #0x8000
    strh r5, [sp, #0x16]
    ldrh lr, [sp, #0x14]
    ldrh ip, [sp, #0x16]
    mov r6, #0x40
    orr r5, lr, #0x10
    orr ip, ip, #0x4000
    mov lr, #0x400
    ldrh r2, [sp, #0x24]
    strh r1, [sp, #0x26]
    ldr r3, [sp, #0x18]
    bic r1, r2, #0xff
    orr r2, r1, #0x14
    ldrh r1, [sp, #0x26]
    strh r2, [sp, #0x24]
    bic r2, r3, #0x1c000
    orr r3, r2, #0x1c000
    ldrh r2, [sp, #0x24]
    bic r1, r1, #0xff00
    orr r1, r1, #0x900
    bic r2, r2, #0xff00
    bic r3, r3, #0x7f
    str r0, [sp]
    bic r0, r3, #0x3f80
    orr r3, r0, #0x780
    add r0, sp, #0x0
    strh r1, [sp, #0x26]
    str r6, [sp, #0xc]
    strh r5, [sp, #0x14]
    strh lr, [sp, #0x10]
    strh ip, [sp, #0x16]
    str r3, [sp, #0x18]
    strh r2, [sp, #0x24]
    bl func_0201e5b8
    bl func_0208e120
    add r1, r0, #0x800
    ldrh r0, [sp, #0x26]
    ldr r3, [sp, #0x18]
    ldrh r2, [sp, #0x24]
    bic r0, r0, #0xff
    orr r0, r0, #0x14
    strh r0, [sp, #0x26]
    bic r0, r2, #0xff
    strh r0, [sp, #0x24]
    ldrh r0, [sp, #0x26]
    bic r3, r3, #0x7f
    orr r3, r3, #0xc
    bic r3, r3, #0x3f80
    orr ip, r3, #0x780
    ldrh r2, [sp, #0x24]
    bic r0, r0, #0xff00
    str r1, [sp, #0x8]
    bic r3, r2, #0xff00
    orr r2, r0, #0x900
    add r0, sp, #0x0
    str ip, [sp, #0x18]
    strh r3, [sp, #0x24]
    strh r2, [sp, #0x26]
    bl func_0201e5b8
    ldr r0, [sp]
    bl Task_Invoke
    bl func_0208e1cc
    mov r6, #0x0
    add r3, r0, #0x480
    mov r5, #0xa8
    mov r2, r6
.L_1278:
    mov ip, r2
    mov lr, r5
.L_1280:
    orr r1, lr, #0x3000
    mov r0, ip, lsl #0x1
    add ip, ip, #0x1
    strh r1, [r3, r0]
    cmp ip, #0xa
    add lr, lr, #0x1
    blt .L_1280
    add r0, r5, #0x1c
    mov r0, r0, lsl #0x10
    add r6, r6, #0x1
    cmp r6, #0x5
    add r3, r3, #0x40
    mov r5, r0, lsr #0x10
    blt .L_1278
    bl func_0208e1cc
    add r0, r0, #0x9c
    mov r3, #0x0
    add ip, r0, #0xc00
    mov lr, #0x96
    mov r2, r3
.L_12d0:
    mov r5, r2
    mov r6, lr
.L_12d8:
    orr r1, r6, #0x3000
    mov r0, r5, lsl #0x1
    add r5, r5, #0x1
    strh r1, [ip, r0]
    cmp r5, #0x12
    add r6, r6, #0x1
    blt .L_12d8
    add r0, lr, #0x1c
    mov r0, r0, lsl #0x10
    add r3, r3, #0x1
    cmp r3, #0x5
    add ip, ip, #0x40
    mov lr, r0, lsr #0x10
    blt .L_12d0
    mov r0, r4
    bl func_ov017_021b61dc
    add sp, sp, #0x28
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov017_021b820c
