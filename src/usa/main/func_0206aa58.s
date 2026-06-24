; func_0206aa58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0205405c
        .extern func_020540cc
        .extern func_020540d4
        .extern func_0206b408
        .global func_0206aa58
        .arm
func_0206aa58:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    mov r4, #0x0
    bl func_020540cc
    cmp r0, #0x0
    ble .L_58
.L_2c:
    ldr r0, [r5, #0x8]
    mov r1, r4
    bl func_0205405c
    ldr r1, [r0]
    mov r0, r5
    bl func_0206b408
    ldr r0, [r5, #0x8]
    add r4, r4, #0x1
    bl func_020540cc
    cmp r4, r0
    blt .L_2c
.L_58:
    ldr r0, [r5, #0x8]
    bl func_020540d4
    mov r0, #0x0
    str r0, [r5, #0x8]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
