; func_ov002_0229f57c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4728
        .extern data_ov002_022cbab4
        .extern data_ov002_022cbb70
        .extern data_ov002_022cbb8c
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0208ff84
        .global func_ov002_0229f57c
        .arm
func_ov002_0229f57c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x78
    mov r2, #0x0
    str r2, [r0]
    str r2, [r0, #0x68]
    str r2, [r0, #0x70]
    str r2, [r0, #0x194]
    mov r9, r2
.L_20:
    add r1, r0, r2, lsl #0x5
    str r9, [r1, #0x198]
    add r2, r2, #0x1
    str r9, [r1, #0x1b0]
    cmp r2, #0x3
    blt .L_20
    ldr r7, _LIT0
    add r8, sp, #0x50
    mov r6, #0x4
    mov r5, #0x0
    mvn r4, #0x0
.L_4c:
    mov r0, r8
    bl func_0201d47c
    ldr r0, [r7, r9, lsl #0x2]
    mov r1, r6
    mov r2, r5
    bl func_02006c0c
    ldrh r1, [sp, #0x64]
    ldr r3, [sp, #0x68]
    add r2, r9, #0x2
    bic r1, r1, #0xf
    orr r1, r1, #0x8
    strh r1, [sp, #0x64]
    ldrh r1, [sp, #0x64]
    bic r3, r3, #0x1c000
    str r0, [sp, #0x50]
    orr r1, r1, #0x10
    orr r3, r3, #0xc000
    mov sl, r2, lsl #0x9
    mov r0, r8
    str r3, [sp, #0x68]
    strh r1, [sp, #0x64]
    str r4, [sp, #0x58]
    str r4, [sp, #0x5c]
    strh sl, [sp, #0x60]
    bl func_0201e5b8
    ldrh r1, [sp, #0x64]
    ldr r0, [sp, #0x68]
    strh sl, [sp, #0x60]
    bic r1, r1, #0xf
    bic r0, r0, #0x1c000
    orr r2, r1, #0x7
    orr r1, r0, #0x8000
    mov r0, r8
    strh r2, [sp, #0x64]
    str r1, [sp, #0x68]
    bl func_0201e5b8
    ldr r0, [sp, #0x50]
    bl func_02006e1c
    add r9, r9, #0x1
    cmp r9, #0x6
    bcc .L_4c
    ldr r0, _LIT1
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x28
    bl func_0201d47c
    ldrh r0, [sp, #0x3c]
    mvn r3, #0x0
    mov r1, #0xa00
    bic r0, r0, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x3c]
    ldrh r2, [sp, #0x3c]
    add r0, sp, #0x28
    str r4, [sp, #0x28]
    orr r2, r2, #0x10
    str r3, [sp, #0x34]
    strh r2, [sp, #0x3c]
    strh r1, [sp, #0x38]
    bl func_0201e5b8
    mov r0, r4
    bl func_02006e1c
    add r0, sp, #0x0
    bl func_0201d47c
    ldr r0, _LIT2
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp]
    mvn r0, #0x0
    ldrh r1, [sp, #0x14]
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    bic r0, r1, #0xf
    orr r0, r0, #0x7
    strh r0, [sp, #0x14]
    mov r0, #0x0
    ldr r1, [sp, #0x18]
    strh r0, [sp, #0x10]
    bic r0, r1, #0x1c000
    ldrh r1, [sp, #0x14]
    orr r0, r0, #0x8000
    str r0, [sp, #0x18]
    orr r1, r1, #0x10
    add r0, sp, #0x0
    strh r1, [sp, #0x14]
    bl func_0201e5b8
    mov r0, #0xc00
    ldrh r2, [sp, #0x14]
    strh r0, [sp, #0x10]
    ldr r1, [sp, #0x18]
    bic r0, r2, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x14]
    bic r0, r1, #0x1c000
    str r0, [sp, #0x18]
    add r0, sp, #0x0
    bl func_0201e5b8
    ldr r0, [sp]
    bl func_02006e1c
    ldr r0, _LIT3
    mov r1, #0x0
    mov r2, #0x20
    bl func_0208ff84
    add sp, sp, #0x78
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022cbab4
_LIT1: .word data_ov002_022cbb70
_LIT2: .word data_ov002_022cbb8c
_LIT3: .word data_020b4728
