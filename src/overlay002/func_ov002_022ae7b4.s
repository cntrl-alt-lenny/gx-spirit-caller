; func_ov002_022ae7b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4728
        .extern data_ov002_022ca4c8
        .extern data_ov002_022ca4d0
        .extern data_ov002_022cc764
        .extern data_ov002_022cc77c
        .extern data_ov002_022cc794
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_02091554
        .extern func_02094550
        .global func_ov002_022ae7b4
        .arm
func_ov002_022ae7b4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc0
    mvn r2, #0x0
    str r2, [r0, #0x2c]
    mov r3, #0x0
.L_14:
    add r1, r0, r3, lsl #0x2
    add r3, r3, #0x1
    str r2, [r1, #0x1c]
    str r2, [r1, #0x4]
    cmp r3, #0x3
    blt .L_14
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x98
    bl func_0201d47c
    ldrh r0, [sp, #0xac]
    ldr r2, _LIT1
    mov r1, #0x20
    bic r0, r0, #0xf
    orr r3, r0, #0x9
    add r0, sp, #0x98
    str r4, [sp, #0x98]
    strh r3, [sp, #0xac]
    str r2, [sp, #0xa4]
    strh r1, [sp, #0xa8]
    bl func_0201e5b8
    mov r0, r4
    bl Task_Invoke
    ldr r0, _LIT2
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x70
    bl func_0201d47c
    mov r0, #0x3b00
    ldrh r1, [sp, #0x84]
    str r0, [sp, #0x7c]
    str r4, [sp, #0x70]
    bic r0, r1, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x84]
    mov r0, #0xc0
    strh r0, [sp, #0x80]
    add r0, sp, #0x70
    bl func_0201e5b8
    mov r0, r4
    bl Task_Invoke
    ldr sl, _LIT3
    ldr fp, _LIT4
    ldr r7, _LIT5
    mov r9, #0x0
    add r8, sp, #0x50
    add r5, sp, #0x28
    mvn r4, #0x0
.L_e8:
    ldr r2, [r7, r9, lsl #0x2]
    mov r0, r8
    mov r1, fp
    bl func_02091554
    mov r0, r8
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r6, r0
    mov r0, r5
    bl func_0201d47c
    ldrh r1, [sp, #0x3c]
    mov r0, r5
    str r6, [sp, #0x28]
    bic r1, r1, #0xf
    orr r1, r1, #0x9
    str sl, [sp, #0x34]
    strh r4, [sp, #0x38]
    strh r1, [sp, #0x3c]
    bl func_0201e5b8
    mov r0, r6
    bl Task_Invoke
    add r9, r9, #0x1
    add sl, sl, #0x800
    cmp r9, #0x5
    bcc .L_e8
    ldr r0, _LIT6
    ldr r1, _LIT7
    mov r2, #0x20
    bl func_02094550
    mov sl, #0x0
    ldr r9, _LIT8
    mov r8, #0x4
    mov r7, sl
    add r5, sp, #0x0
    mvn r4, #0x0
.L_178:
    ldr r0, [r9, sl, lsl #0x2]
    mov r1, r8
    mov r2, r7
    bl func_02006c0c
    mov r6, r0
    mov r0, r5
    bl func_0201d47c
    ldrh r2, [sp, #0x14]
    add r0, sl, #0x2
    mov r1, r0, lsl #0x9
    bic r0, r2, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x14]
    ldrh r2, [sp, #0x14]
    mov r0, r5
    str r6, [sp]
    orr r2, r2, #0x10
    str r4, [sp, #0xc]
    strh r2, [sp, #0x14]
    strh r1, [sp, #0x10]
    bl func_0201e5b8
    mov r0, r6
    bl Task_Invoke
    add sl, sl, #0x1
    cmp sl, #0x2
    bcc .L_178
    add sp, sp, #0xc0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cc77c
_LIT1: .word 0x00005880
_LIT2: .word data_ov002_022cc794
_LIT3: .word 0x00005f80
_LIT4: .word data_ov002_022cc764
_LIT5: .word data_ov002_022ca4d0
_LIT6: .word data_020b4728
_LIT7: .word 0x050006e0
_LIT8: .word data_ov002_022ca4c8
