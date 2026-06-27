; func_ov002_022a0d10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cbd84
        .extern data_ov002_022cbda0
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0208df94
        .extern func_02094550
        .global func_ov002_022a0d10
        .arm
func_ov002_022a0d10:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x28
    mov r5, r0
    add r0, sp, #0x0
    mov r4, r1
    bl func_0201d47c
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldr r1, [sp, #0x18]
    ldr r6, _LIT1
    bic r1, r1, #0x1c000
    orr r3, r1, #0x1c000
    ldrh r2, [sp, #0x14]
    str r0, [sp]
    str r6, [sp, #0xc]
    bic r0, r2, #0xf
    orr r0, r0, #0x8
    strh r0, [sp, #0x14]
    ldrh r0, [sp, #0x14]
    add r2, r5, #0x94
    str r2, [sp, #0x8]
    orr r1, r0, #0x10
    mov r2, #0x600
    add r0, sp, #0x0
    str r3, [sp, #0x18]
    strh r2, [sp, #0x10]
    strh r1, [sp, #0x14]
    bl func_0201e5b8
    ldr r0, [sp]
    bl Task_Invoke
    add r0, sp, #0x0
    bl func_0201d47c
    ldr r0, _LIT2
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp]
    mvn r0, #0x0
    add r1, r6, #0x540
    ldrh r2, [sp, #0x14]
    strh r0, [sp, #0x10]
    str r1, [sp, #0xc]
    bic r0, r2, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x14]
    add r0, sp, #0x0
    bl func_0201e5b8
    ldr r0, [sp]
    bl Task_Invoke
    ldr r0, [r5, #0x30]
    add r9, r0, #0x2
    bl func_0208df94
    add r1, r0, r9, lsl #0x6
    add r0, r5, #0x94
    mov r2, #0x40
    bl func_02094550
    cmp r4, #0x0
    mov r8, #0x0
    ble .L_980
    add r7, r9, #0x1
    mov r6, #0x40
.L_95c:
    bl func_0208df94
    add r1, r7, r8
    add r1, r0, r1, lsl #0x6
    mov r2, r6
    add r0, r5, #0xd4
    bl func_02094550
    add r8, r8, #0x1
    cmp r8, r4
    blt .L_95c
.L_980:
    bl func_0208df94
    add r1, r9, #0x1
    add r1, r1, r8
    add r1, r0, r1, lsl #0x6
    add r0, r5, #0x114
    mov r2, #0x40
    bl func_02094550
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cbd84
_LIT1: .word 0x0000c440
_LIT2: .word data_ov002_022cbda0
