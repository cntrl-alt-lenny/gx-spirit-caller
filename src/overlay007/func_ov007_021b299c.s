; func_ov007_021b299c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c9694
        .extern data_ov007_021b2fd4
        .extern data_ov007_021b2fdc
        .extern data_ov007_021b2fe8
        .extern data_ov007_021b2ff4
        .extern data_ov007_0223352c
        .extern func_02004f58
        .extern func_0202b100
        .extern func_0208dd9c
        .extern func_02094504
        .extern func_020a978c
        .extern func_ov007_021b2ce8
        .global func_ov007_021b299c
        .arm
func_ov007_021b299c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x124
    mov r8, r0
    bl func_0208dd9c
    ldr r2, [r8, #0x4c]
    mov r1, #0x18
    mul r5, r2, r1
    ldr r6, _LIT0
    mov r7, r0
    ldrsh r0, [r6, r5]
    bl func_0202b100
    mov r4, r0
    ldr r0, _LIT1
    ldr r1, [r8, #0x3c]
    bl func_ov007_021b2ce8
    mov r9, r0
    mov r0, #0x0
    mov r1, r7
    mov r2, #0x6000
    bl func_02094504
    ldr r0, [r8, #0x48]
    ldr ip, [r8, #0x44]
    ldr r2, [r8, #0x40]
    ldr r1, _LIT2
    str r2, [sp]
    ldr r2, [r1, r2, lsl #0x2]
    ldr r1, _LIT3
    stmib sp, {r2, ip}
    ldr r2, [r1, ip, lsl #0x2]
    ldr r1, _LIT4
    str r2, [sp, #0xc]
    str r0, [sp, #0x10]
    ldr r1, [r1, r0, lsl #0x2]
    mov r3, r9
    str r1, [sp, #0x14]
    ldr r2, [r8, #0x4c]
    ldr r1, _LIT5
    str r2, [sp, #0x18]
    ldrsh r2, [r6, r5]
    add r0, sp, #0x24
    str r2, [sp, #0x1c]
    str r4, [sp, #0x20]
    ldr r2, [r8, #0x3c]
    bl func_020a978c
    mov r3, #0x0
    str r3, [sp]
    mov r1, #0xc
    str r1, [sp, #0x4]
    mov r0, r8
    mov r2, r7
    add r1, sp, #0x24
    bl func_02004f58
    mov r0, #0x1
    add sp, sp, #0x124
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_020c9694
_LIT1: .word data_ov007_0223352c
_LIT2: .word data_ov007_021b2fdc
_LIT3: .word data_ov007_021b2fe8
_LIT4: .word data_ov007_021b2fd4
_LIT5: .word data_ov007_021b2ff4
