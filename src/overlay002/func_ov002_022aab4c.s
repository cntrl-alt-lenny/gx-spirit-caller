; func_ov002_022aab4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104f4c
        .extern data_ov002_022cc154
        .extern data_ov002_022cc3d8
        .extern data_ov002_022cc3f8
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0208e200
        .extern func_02091554
        .global func_ov002_022aab4c
        .arm
func_ov002_022aab4c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x248
    sub sp, sp, #0x400
    mov r5, r1
    bl func_0208e200
    mov r4, r0
    add r0, sp, #0x20
    bl func_0201d47c
    cmp r5, #0x0
    bne .L_f00
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r3, [r1, #0xb84]
    mov r2, #0x31
    umull r0, r5, r3, r0
    mov r5, r5, lsr #0x4
    umull r0, r1, r2, r5
    sub r5, r3, r0
    ldr r1, _LIT2
    add r0, sp, #0x0
    ldr r2, [r1, r5, lsl #0x2]
    ldr r1, _LIT3
    bl func_02091554
    b .L_f10
.L_f00:
    ldr r1, _LIT4
    add r0, sp, #0x0
    mov r2, r5
    bl func_02091554
.L_f10:
    add r0, sp, #0x0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldrh r2, [sp, #0x34]
    str r0, [sp, #0x20]
    ldr r5, _LIT5
    bic r0, r2, #0xf
    orr r0, r0, #0x5
    strh r0, [sp, #0x34]
    ldrh r0, [sp, #0x34]
    ldr r1, [sp, #0x38]
    add r6, sp, #0x48
    orr r3, r0, #0x10
    bic r2, r1, #0x1c000
    mov r1, #0xe00
    add r0, sp, #0x20
    str r6, [sp, #0x28]
    str r5, [sp, #0x2c]
    strh r3, [sp, #0x34]
    str r2, [sp, #0x38]
    strh r1, [sp, #0x30]
    bl func_0201e5b8
    ldr r0, [sp, #0x20]
    bl Task_Invoke
    ldr r1, _LIT6
    mov r0, #0x6
    ldr r1, [r1, #0x4]
    add lr, sp, #0x48
    mov r1, r1, lsl #0x1b
    mov r1, r1, lsr #0x1e
    rsb r1, r1, #0x0
    mov r3, r1, lsr #0x1f
    rsb r2, r3, r1, lsl #0x1f
    add r1, r1, r1, lsr #0x1f
    add r2, r3, r2, ror #0x1f
    mov r6, r1, asr #0x1
    add r1, r2, r2, lsl #0x1
    add r2, r4, r1, lsl #0x1
    mov r5, #0x9
.L_fb0:
    add r1, r0, r6, lsl #0x1
    mov r1, r1, lsl #0x5
    mov r7, r5
    add r4, lr, r0, lsl #0x6
    add r1, r2, r1, lsl #0x1
.L_fc4:
    mov ip, r7, lsl #0x1
    ldrh r3, [ip, r4]
    add r7, r7, #0x1
    cmp r7, #0x1a
    strh r3, [ip, r1]
    blt .L_fc4
    add r0, r0, #0x1
    cmp r0, #0x14
    blt .L_fb0
    add sp, sp, #0x248
    add sp, sp, #0x400
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_021040ac
_LIT1: .word 0x5397829d
_LIT2: .word data_ov002_022cc154
_LIT3: .word data_ov002_022cc3d8
_LIT4: .word data_ov002_022cc3f8
_LIT5: .word 0x00009fc0
_LIT6: .word data_02104f4c
