; func_0209f2a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020928cc
        .extern func_020928e8
        .extern func_0209db88
        .extern func_0209dca8
        .extern func_0209dd30
        .global func_0209f2a8
        .arm
func_0209f2a8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x14
    mov r9, r0
    mov r8, r1
    mov r7, r2
    mov r6, r3
    mov r5, #0x1
    bl func_0209dca8
    ldr r4, [r0, #0x4]
    mov r0, #0x2
    mov r1, #0x9
    mov r2, #0xa
    bl func_0209db88
    cmp r0, #0x0
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxne lr
    add r0, r4, #0x3c
    mov r1, #0x2
    bl func_020928cc
    add r0, r4, #0x188
    mov r1, #0x2
    bl func_020928cc
    add r0, r4, #0x100
    ldrh r0, [r0, #0x88]
    cmp r0, #0x0
    bne .L_188
    ldr r0, _LIT0
    mov r1, #0x2
    add r0, r4, r0
    bl func_020928cc
    add r2, r4, #0x100
    add r0, r4, #0x86
    mov r1, #0x2
    ldrh r5, [r2, #0x82]
    bl func_020928cc
.L_188:
    cmp r7, #0x0
    addeq sp, sp, #0x14
    moveq r0, #0x6
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxeq lr
    cmp r5, #0x0
    addeq sp, sp, #0x14
    moveq r0, #0x7
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxeq lr
    add r0, r4, #0x7c
    mov r1, #0x2
    bl func_020928cc
    ldr r0, [r4, #0x7c]
    cmp r7, r0
    addeq sp, sp, #0x14
    moveq r0, #0x6
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxeq lr
    cmp r6, #0x200
    addhi sp, sp, #0x14
    movhi r0, #0x6
    ldmhiia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxhi lr
    cmp r6, #0x0
    addeq sp, sp, #0x14
    moveq r0, #0x6
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxeq lr
    mov r0, r7
    mov r1, r6
    bl func_020928e8
    ldrh r2, [sp, #0x30]
    ldrh r1, [sp, #0x34]
    ldrh r0, [sp, #0x38]
    str r2, [sp]
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    str r9, [sp, #0xc]
    mov r2, r7
    mov r3, r6
    mov r0, #0xf
    mov r1, #0x7
    str r8, [sp, #0x10]
    bl func_0209dd30
    cmp r0, #0x0
    moveq r0, #0x2
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
_LIT0: .word 0x00000182
