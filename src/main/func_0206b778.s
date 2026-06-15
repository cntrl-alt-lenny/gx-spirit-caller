; func_0206b778 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020540d0
        .extern func_02054140
        .global func_0206b778
        .arm
func_0206b778:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    ldr r0, [r7, #0x4]
    mov r6, r1
    bl func_02054140
    mov r5, r0
    cmp r5, #0x0
    mov r4, #0x0
    ble .L_15c
.L_130:
    ldr r0, [r7, #0x4]
    mov r1, r4
    bl func_020540d0
    ldr r0, [r0]
    cmp r6, r0
    addeq sp, sp, #0x4
    moveq r0, r4
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    add r4, r4, #0x1
    cmp r4, r5
    blt .L_130
.L_15c:
    mvn r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
