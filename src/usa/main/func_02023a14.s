; func_02023a14 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02186a20
        .extern func_0201107c
        .extern func_020231c0
        .extern func_0208b218
        .extern func_0208ea58
        .extern func_0208eeec
        .global func_02023a14
        .arm
func_02023a14:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x88
    mov r4, r0
    ldrh r0, [r4, #0xce]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    addeq sp, sp, #0x88
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, [r4, #0x68]
    add r5, sp, #0x58
    mov r0, r0, lsl #0x4
    str r0, [r4, #0x68]
    ldr r1, [r4, #0x6c]
    add r0, sp, #0x1c
    mov r1, r1, lsl #0x4
    str r1, [r4, #0x6c]
    ldr r1, [r4, #0x70]
    add r2, sp, #0x10
    mov r1, r1, lsl #0x4
    str r1, [r4, #0x70]
    ldr r3, [r4, #0x74]
    add r1, r4, #0x80
    mov r3, r3, lsl #0x4
    str r3, [r4, #0x74]
    ldr r6, [r4, #0x78]
    mov r3, #0x1
    mov r6, r6, lsl #0x4
    str r6, [r4, #0x78]
    ldr r6, [r4, #0x7c]
    mov r6, r6, lsl #0x4
    str r6, [r4, #0x7c]
    ldr r6, [r4, #0x8c]
    mov r6, r6, lsl #0x4
    str r6, [r4, #0x8c]
    ldr r6, [r4, #0x90]
    mov r6, r6, lsl #0x4
    str r6, [r4, #0x90]
    ldr r6, [r4, #0x94]
    mov r6, r6, lsl #0x4
    str r6, [r4, #0x94]
    ldr r7, [r4, #0x68]
    ldr r6, [r4, #0x8c]
    add r6, r7, r6
    str r6, [sp, #0x1c]
    ldr r7, [r4, #0x6c]
    ldr r6, [r4, #0x90]
    add r6, r7, r6
    str r6, [sp, #0x20]
    ldr r7, [r4, #0x70]
    ldr r6, [r4, #0x94]
    add r6, r7, r6
    str r6, [sp, #0x24]
    ldr r7, [r4, #0x74]
    ldr r6, [r4, #0x8c]
    add r6, r7, r6
    str r6, [sp, #0x10]
    ldr r7, [r4, #0x78]
    ldr r6, [r4, #0x90]
    add r6, r7, r6
    str r6, [sp, #0x14]
    ldr r7, [r4, #0x7c]
    ldr r6, [r4, #0x94]
    add r6, r7, r6
    str r6, [sp, #0x18]
    str r5, [sp]
    bl func_0208ea58
    mov r0, #0x0
    bl func_0201107c
    mov ip, r0
    mov r8, r5
    mov r6, r5
    mov r7, ip
    ldmia r8!, {r0, r1, r2, r3}
    stmia r7!, {r0, r1, r2, r3}
    ldmia r8!, {r0, r1, r2, r3}
    stmia r7!, {r0, r1, r2, r3}
    ldmia r8, {r0, r1, r2, r3}
    stmia r7, {r0, r1, r2, r3}
    add r5, ip, #0x30
    ldmia r6!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    ldmia r6!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    ldmia r6, {r0, r1, r2, r3}
    stmia r5, {r0, r1, r2, r3}
    add r0, sp, #0x1c
    add r3, ip, #0x60
    ldmia r0, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    add r0, sp, #0x10
    add r3, ip, #0x6c
    ldmia r0, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    add r0, r4, #0x80
    add r3, ip, #0x78
    ldmia r0, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    ldr r1, _LIT0
    mov r0, #0x1
    str r1, [ip, #0xa0]
    bl func_0201107c
    add r8, sp, #0x58
    add r7, sp, #0x28
    mov r6, r7
    ldmia r8!, {r0, r1, r2, r3}
    stmia r7!, {r0, r1, r2, r3}
    ldmia r8!, {r0, r1, r2, r3}
    stmia r7!, {r0, r1, r2, r3}
    ldmia r8, {r0, r1, r2, r3}
    stmia r7, {r0, r1, r2, r3}
    mov r5, #0x0
    mov r0, r6
    mov r1, r6
    str r5, [sp, #0x4c]
    str r5, [sp, #0x50]
    str r5, [sp, #0x54]
    bl func_0208b218
    mov r0, r6
    bl func_020231c0
    mov r9, r6
    mov r7, r5
    ldr r8, _LIT1
    ldmia r9!, {r0, r1, r2, r3}
    stmia r8!, {r0, r1, r2, r3}
    ldmia r9!, {r0, r1, r2, r3}
    stmia r8!, {r0, r1, r2, r3}
    ldmia r9, {r0, r1, r2, r3}
    stmia r8, {r0, r1, r2, r3}
    ldr r6, _LIT2
    mov r5, #0x800000
    str r7, [r6]
    mov lr, #0x1000
    str r7, [r6, #0x14]
    stmia sp, {r5, lr}
    mov ip, #0x1
    str ip, [sp, #0x8]
    ldr r1, _LIT3
    ldr r2, _LIT4
    mov r0, #0x800
    mov r3, #0x100
    str r7, [sp, #0xc]
    bl func_0208eeec
    mov r2, #0x3
    mov r1, r6
    mov r0, r7
    str r2, [r1]
    str r0, [r1, #0x14]
    ldr r0, [r4, #0x68]
    mov r0, r0, asr #0x4
    str r0, [r4, #0x68]
    ldr r0, [r4, #0x6c]
    mov r0, r0, asr #0x4
    str r0, [r4, #0x6c]
    ldr r0, [r4, #0x70]
    mov r0, r0, asr #0x4
    str r0, [r4, #0x70]
    ldr r0, [r4, #0x74]
    mov r0, r0, asr #0x4
    str r0, [r4, #0x74]
    ldr r1, [r4, #0x78]
    mov r0, #0x1
    mov r1, r1, asr #0x4
    str r1, [r4, #0x78]
    ldr r1, [r4, #0x7c]
    mov r1, r1, asr #0x4
    str r1, [r4, #0x7c]
    ldr r1, [r4, #0x8c]
    mov r1, r1, asr #0x4
    str r1, [r4, #0x8c]
    ldr r1, [r4, #0x90]
    mov r1, r1, asr #0x4
    str r1, [r4, #0x90]
    ldr r1, [r4, #0x94]
    mov r1, r1, asr #0x4
    str r1, [r4, #0x94]
    add sp, sp, #0x88
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x41f00000
_LIT1: .word data_02186a20
_LIT2: .word 0x04000440
_LIT3: .word 0x00000ddb
_LIT4: .word 0x00001555
