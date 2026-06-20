; func_ov002_022a07f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cbcdc
        .extern data_ov002_022cbcf8
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0208e0a0
        .extern func_02094504
        .global func_ov002_022a07f4
        .arm
func_ov002_022a07f4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x28
    mov r6, r0
    ldr r7, [r6, #0x30]
    mov r0, #0x1a
    mul r0, r7, r0
    add r5, r0, #0x1
    bl func_0208e0a0
    add r4, r0, r7, lsl #0x6
    rsb r0, r7, #0x12
    mov r2, r0, lsl #0x6
    mov r1, r4
    mov r0, #0x0
    bl func_02094504
    add r0, sp, #0x0
    bl func_0201d47c
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
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
    bl func_0201e5b8
    ldr r0, [sp]
    bl func_02006e1c
    add r0, sp, #0x0
    bl func_0201d47c
    ldr r0, _LIT1
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp]
    mvn r0, #0x0
    ldrh r1, [sp, #0x14]
    str r0, [sp, #0x8]
    strh r0, [sp, #0x10]
    bic r0, r1, #0xf
    orr r0, r0, #0x7
    strh r0, [sp, #0x14]
    add r0, r5, #0x5c
    mov r0, r0, lsl #0x6
    str r0, [sp, #0xc]
    add r0, sp, #0x0
    bl func_0201e5b8
    ldr r0, [sp]
    bl func_02006e1c
    add r0, r4, #0xc
    ldr r8, _LIT2
    mov r3, #0x0
    mov r4, #0x5c
    mov lr, #0xa
.L_434:
    ldr r2, [r6, #0x8]
    mov r7, r3, lsr #0x1f
    add r1, r3, #0x1
    mvn r9, r2
    smull r2, ip, r8, r3
    add ip, r7, ip, asr #0x2
    mov r9, r9, lsr r1
    smull ip, r2, lr, ip
    and r2, r9, #0x1
    mla r9, r2, r4, r5
    orr r2, r9, #0x2000
    sub ip, r3, ip
    smull r3, r9, r8, r3
    add r9, r7, r9, asr #0x2
    add r9, r0, r9, lsl #0x7
    mov r7, ip, lsl #0x1
    cmp r1, #0x14
    mov r3, r1
    mov r1, r7, lsl #0x1
    strh r2, [r9, r1]
    add r7, r9, r7, lsl #0x1
    add r1, r2, #0x1
    strh r1, [r7, #0x2]
    add r1, r2, #0x2
    strh r1, [r7, #0x40]
    add r1, r2, #0x3
    strh r1, [r7, #0x42]
    add r5, r5, #0x4
    blt .L_434
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cbcdc
_LIT1: .word data_ov002_022cbcf8
_LIT2: .word 0x66666667
