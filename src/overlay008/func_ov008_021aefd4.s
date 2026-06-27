; func_ov008_021aefd4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_ov008_021b26ac
        .extern data_ov008_021b26c4
        .extern data_ov008_021b2790
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_02091554
        .global func_ov008_021aefd4
        .arm
func_ov008_021aefd4:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x48
    ldr r2, _LIT0
    mov r4, r1
    ldr r2, [r2, #0x34]
    mov r1, #0x34
    cmp r2, #0x0
    mul r2, r0, r1
    add r0, sp, #0x0
    bne .L_f8
    ldr r1, _LIT1
    ldrh r2, [r1, r2]
    ldr r1, _LIT2
    bl func_02091554
    b .L_108
.L_f8:
    ldr r1, _LIT1
    ldrh r2, [r1, r2]
    ldr r1, _LIT3
    bl func_02091554
.L_108:
    add r0, sp, #0x20
    bl func_0201d47c
    add r0, sp, #0x0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldrh r2, [sp, #0x34]
    mov r1, #0xc
    mul r1, r4, r1
    bic r2, r2, #0xf
    orr r2, r2, #0x9
    strh r2, [sp, #0x34]
    add r1, r1, #0xab
    add r1, r1, #0x200
    mov r4, r1, lsl #0x7
    ldrh r3, [sp, #0x34]
    ldr r2, [sp, #0x38]
    str r0, [sp, #0x20]
    bic r0, r2, #0x1c000
    orr r1, r0, #0x1c000
    orr r2, r3, #0x10
    add r0, sp, #0x20
    str r4, [sp, #0x2c]
    strh r2, [sp, #0x34]
    str r1, [sp, #0x38]
    bl func_0201e5b8
    ldr r0, [sp, #0x20]
    bl Task_Invoke
    add sp, sp, #0x48
    ldmia sp!, {r4, pc}
_LIT0: .word data_021040ac
_LIT1: .word data_ov008_021b2790
_LIT2: .word data_ov008_021b26ac
_LIT3: .word data_ov008_021b26c4
