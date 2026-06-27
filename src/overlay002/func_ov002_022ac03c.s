; func_ov002_022ac03c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cc658
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201e5b8
        .global func_ov002_022ac03c
        .arm
func_ov002_022ac03c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x28
    mov r8, #0x0
    ldr r6, _LIT0
    add r7, sp, #0x0
    mov r5, #0x4
    mov r4, r8
    mvn r9, #0x0
.L_20:
    mov r0, r7
    bl func_0201d47c
    ldr r0, [r6, r8, lsl #0x3]
    mov r1, r5
    mov r2, r4
    bl func_02006c0c
    ldrh r2, [sp, #0x14]
    add r1, r6, r8, lsl #0x3
    ldr r1, [r1, #0x4]
    bic r2, r2, #0xf
    str r0, [sp]
    orr r2, r2, #0x9
    mov r0, r7
    strh r2, [sp, #0x14]
    str r1, [sp, #0xc]
    strh r9, [sp, #0x10]
    bl func_0201e5b8
    ldr r0, [sp]
    bl Task_Invoke
    add r8, r8, #0x1
    cmp r8, #0xe
    bcc .L_20
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cc658
