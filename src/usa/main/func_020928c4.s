; func_020928c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0209294c
        .extern func_02092b90
        .extern func_02092ba4
        .global func_020928c4
        .arm
func_020928c4:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r6, r1
    mov r5, r2
    bl func_02092b90
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    add r0, r0, r5
    sub r1, r5, #0x1
    mvn r2, r1
    sub r0, r0, #0x1
    and r4, r2, r0
    add r0, r4, r6
    add r0, r0, r5
    sub r1, r0, #0x1
    mov r0, r7
    and r5, r2, r1
    bl func_02092ba4
    cmp r5, r0
    addhi sp, sp, #0x4
    movhi r0, #0x0
    ldmhiia sp!, {r4, r5, r6, r7, lr}
    bxhi lr
    mov r0, r7
    mov r1, r5
    bl func_0209294c
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
