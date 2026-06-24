; func_0209d394 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern WaitByLoop
        .extern func_02096264
        .global func_0209d394
        .arm
func_0209d394:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r6, r1
    mov r1, r7
    mov r0, #0xe
    mov r2, #0x0
    bl func_02096264
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    mov r5, #0xe
    mov r4, #0x0
.L_38:
    mov r0, r6
    bl WaitByLoop
    mov r0, r5
    mov r1, r7
    mov r2, r4
    bl func_02096264
    cmp r0, #0x0
    bne .L_38
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
