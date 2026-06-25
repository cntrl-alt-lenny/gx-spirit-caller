; func_020a0760 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02092800
        .extern func_0209db3c
        .extern func_0209dc3c
        .extern func_0209dd68
        .global func_020a0760
        .arm
func_020a0760:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_0209db3c
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
    beq .L_130
    cmp r4, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x6
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    mov r0, r4
    mov r1, #0x50
    bl func_02092800
.L_130:
    mov r1, r7
    mov r0, #0x27
    bl func_0209dd68
    mov r2, r6
    mov r3, r4
    mov r0, #0x27
    mov r1, #0x3
    str r5, [sp]
    bl func_0209dc3c
    cmp r0, #0x0
    moveq r0, #0x2
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
