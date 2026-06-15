; func_020a0854 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020928e8
        .extern func_0209dc30
        .extern func_0209dd30
        .extern func_0209de5c
        .global func_020a0854
        .arm
func_020a0854:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_0209dc30
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, r6, r7, lr}
    bxne lr
    cmp r6, #0x3
    addhi sp, sp, #0x4
    movhi r0, #0x6
    ldmhiia sp!, {r4, r5, r6, r7, lr}
    bxhi lr
    cmp r6, #0x0
    beq .L_28c
    cmp r4, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x6
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    mov r0, r4
    mov r1, #0x50
    bl func_020928e8
.L_28c:
    mov r1, r7
    mov r0, #0x27
    bl func_0209de5c
    mov r2, r6
    mov r3, r4
    mov r0, #0x27
    mov r1, #0x3
    str r5, [sp]
    bl func_0209dd30
    cmp r0, #0x0
    moveq r0, #0x2
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
