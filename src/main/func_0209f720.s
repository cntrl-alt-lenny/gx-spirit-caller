; func_0209f720 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020928cc
        .extern func_020928e8
        .extern func_02094688
        .extern func_0209db88
        .extern func_0209dca8
        .extern func_0209dd30
        .extern func_0209de5c
        .global func_0209f720
        .arm
func_0209f720:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_0209dca8
    mov r8, r0
    mov r0, #0x1
    mov r1, #0xb
    bl func_0209db88
    cmp r0, #0x0
    addne sp, sp, #0x10
    ldmneia sp!, {r4, r5, r6, r7, r8, lr}
    bxne lr
    ldr r0, [r8, #0x4]
    mov r1, #0x4
    add r0, r0, #0x10
    bl func_020928cc
    ldr r0, [r8, #0x4]
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    addeq sp, sp, #0x10
    moveq r0, #0x3
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    ldr r0, _LIT0
    cmp r4, r0
    addhi sp, sp, #0x10
    movhi r0, #0x6
    ldmhiia sp!, {r4, r5, r6, r7, r8, lr}
    bxhi lr
    mov r0, r5
    mov r1, r4
    bl func_020928e8
    mov r1, r7
    mov r0, #0x12
    bl func_0209de5c
    add r1, sp, #0x8
    mov r0, r6
    mov r2, #0x6
    bl func_02094688
    str r5, [sp]
    str r4, [sp, #0x4]
    ldr r2, [sp, #0x8]
    ldr r3, [sp, #0xc]
    mov r0, #0x12
    mov r1, #0x4
    bl func_0209dd30
    cmp r0, #0x0
    moveq r0, #0x2
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word 0x000005e4
