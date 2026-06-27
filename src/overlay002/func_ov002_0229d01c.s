; func_ov002_0229d01c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0202be4c
        .global func_ov002_0229d01c
        .arm
func_ov002_0229d01c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x28
    mov r6, r2
    mov r0, r6
    mov r5, r1
    bl func_0202be4c
    mov r4, r0
    add r0, sp, #0x0
    bl func_0201d47c
    mov r0, r5, lsl #0xa
    add r5, r0, #0x12800
    ldrh r1, [sp, #0x14]
    cmp r6, #0x0
    str r4, [sp]
    bic r0, r1, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x14]
    ldrh r0, [sp, #0x14]
    movne r1, #0x1
    moveq r1, #0x0
    orr r0, r0, #0x10
    strh r0, [sp, #0x14]
    rsb r1, r1, #0x0
    add r0, sp, #0x0
    str r5, [sp, #0xc]
    strh r1, [sp, #0x10]
    bl func_0201e5b8
    mov r0, r4
    bl Task_Invoke
    mov r0, r5
    add sp, sp, #0x28
    ldmia sp!, {r4, r5, r6, pc}
