; func_ov002_022b3060 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_ov002_022ca680
        .extern data_ov002_022cc988
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201d6e4
        .extern func_0201e564
        .extern func_02034734
        .extern func_0208fca8
        .global func_ov002_022b3060
        .arm
func_ov002_022b3060:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x28
    mov r8, #0xb
    bl func_02034734
    cmp r0, #0x2
    subne r8, r8, #0x1
    cmp r8, #0x0
    mov r9, #0x0
    ble .L_20c
    ldr r7, _LIT0
    mov fp, #0x1
    add r4, sp, #0x0
    mov r6, #0x4
    mov r5, r9
.L_1a0:
    ldr r0, [r7, r9, lsl #0x3]
    mov r1, r6
    mov r2, r5
    bl func_02006bf0
    mov sl, r0
    mov r0, r4
    bl func_0201d428
    ldrh r1, [sp, #0x14]
    add r0, r7, r9, lsl #0x3
    ldr r0, [r0, #0x4]
    bic r1, r1, #0xf
    orr r1, r1, #0x4
    str r0, [sp, #0xc]
    cmp r9, #0x0
    movgt r0, fp
    movle r0, #0x0
    strh r1, [sp, #0x14]
    rsb r1, r0, #0x0
    mov r0, r4
    str sl, [sp]
    strh r1, [sp, #0x10]
    bl func_0201e564
    mov r0, sl
    bl func_02006e00
    add r9, r9, #0x1
    cmp r9, r8
    blt .L_1a0
.L_20c:
    ldr r0, _LIT1
    mov r1, #0x1
    ldr r0, [r0, #0xb88]
    cmp r0, #0x1
    cmpne r0, #0x2
    movne r1, #0x0
    cmp r1, #0x0
    addeq sp, sp, #0x28
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT2
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    ldr r1, _LIT1
    mov r4, r0
    ldr r0, [r1, #0xb88]
    cmp r0, #0x2
    moveq r5, #0x3
    ldrne r5, [r1, #0xb90]
    mov r0, r4
    bl func_0201d6e4
    add r0, r0, r5, lsl #0x8
    mov r1, #0x3380
    mov r2, #0x100
    bl func_0208fca8
    mov r0, r4
    bl func_02006e00
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ca680
_LIT1: .word data_02103fcc
_LIT2: .word data_ov002_022cc988
