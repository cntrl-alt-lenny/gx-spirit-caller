; func_0206b688 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0205405c
        .extern func_020540cc
        .extern func_0206893c
        .extern func_02068968
        .global func_0206b688
        .arm
func_0206b688:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r9, r0
    ldr r0, [r9, #0x4]
    mov r8, r1
    mov r7, r2
    bl func_020540cc
    mov r6, r0
    cmp r6, #0x0
    mov r4, #0x0
    ble .L_70
.L_2c:
    ldr r0, [r9, #0x4]
    mov r1, r4
    bl func_0205405c
    ldr r5, [r0]
    mov r0, r5
    bl func_02068968
    cmp r8, r0
    bne .L_64
    mov r0, r5
    bl func_0206893c
    cmp r7, r0
    addeq sp, sp, #0x4
    moveq r0, r4
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_64:
    add r4, r4, #0x1
    cmp r4, r6
    blt .L_2c
.L_70:
    mvn r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
