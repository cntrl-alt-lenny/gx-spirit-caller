; func_0201e910 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02191d58
        .extern func_02005d90
        .extern func_0201d594
        .extern func_0201e8d4
        .extern func_0207f84c
        .extern func_020943b0
        .global func_0201e910
        .arm
func_0201e910:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x18
    mov r9, r1
    ldr r1, [sp, #0x48]
    str r0, [sp, #0xc]
    mov r8, r2
    mov r4, r3
    str r1, [sp, #0x48]
    bl func_0201e8d4
    bl func_0201d594
    ldr r1, [sp, #0x54]
    add r5, r0, #0x5
    cmp r1, #0x200
    movge sl, r1, asr #0x9
    str r8, [sp]
    ldr r8, [sp, #0x40]
    movlt sl, r1, asr #0x5
    ldr r3, [sp, #0x44]
    ldr r0, _LIT0
    mov r2, r9
    mov r1, #0x20
    ldr r6, [sp, #0x50]
    stmib sp, {r4, r8}
    bl func_0207f84c
    mov r8, r0
    cmp r8, #0x0
    mov r9, #0x0
    ble .L_12c
    ldr r0, [sp, #0x5c]
    ldr r1, [sp, #0x58]
    ldr r2, [sp, #0x4c]
    mov r0, r0, lsl #0x1f
    mov r4, #0x400
    str r0, [sp, #0x10]
    mov r0, r1, lsl #0x1e
    mov fp, r2, lsl #0x1e
    str r0, [sp, #0x14]
    rsb r4, r4, #0x0
.L_98:
    ldr r0, [sp, #0xc]
    ldr r1, [sp, #0x48]
    bl func_02005d90
    mov r7, r0
    sub r0, r8, r9
    sub r1, r0, #0x1
    ldr r0, _LIT0
    mov r2, #0x6
    add r0, r0, r1, lsl #0x3
    mov r1, r7
    bl func_020943b0
    ldr r1, [r7, #0x4]
    add r9, r9, #0x1
    and r0, r1, r4
    mov r1, r1, lsl #0x16
    mov r1, r1, lsr #0x16
    add r1, r1, r6, asr r5
    and r1, r1, r4, lsr #0x16
    orr r0, r0, r1
    bic r1, r0, #0xf000
    mov r0, r0, lsl #0x10
    add r0, sl, r0, lsr #0x1c
    mov r0, r0, lsl #0x1c
    orr r0, r1, r0, lsr #0x10
    bic r0, r0, #0xc00
    orr r0, r0, fp, lsr #0x14
    str r0, [r7, #0x4]
    ldr r0, [r7]
    cmp r9, r8
    bic r1, r0, #0x1000
    ldr r0, [sp, #0x10]
    orr r0, r1, r0, lsr #0x13
    bic r1, r0, #0xc00
    ldr r0, [sp, #0x14]
    orr r0, r1, r0, lsr #0x14
    str r0, [r7]
    blt .L_98
.L_12c:
    mov r0, r7
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02191d58
