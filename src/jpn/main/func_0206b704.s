; func_0206b704 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0205405c
        .extern func_020540cc
        .global func_0206b704
        .arm
func_0206b704:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    ldr r0, [r7, #0x4]
    mov r6, r1
    bl func_020540cc
    mov r5, r0
    cmp r5, #0x0
    mov r4, #0x0
    ble .L_d0
.L_a4:
    ldr r0, [r7, #0x4]
    mov r1, r4
    bl func_0205405c
    ldr r0, [r0]
    cmp r6, r0
    addeq sp, sp, #0x4
    moveq r0, r4
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    add r4, r4, #0x1
    cmp r4, r5
    blt .L_a4
.L_d0:
    mvn r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
