; func_0206b51c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02053b88
        .extern func_0205405c
        .extern func_020540cc
        .extern func_0206b574
        .extern func_0206b648
        .global func_0206b51c
        .arm
func_0206b51c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0x4]
    bl func_020540cc
    mov r4, r0
    cmp r4, #0x0
    mov r5, #0x0
    ble .L_44
.L_20:
    ldr r0, [r6, #0x4]
    mov r1, r5
    bl func_0205405c
    ldr r1, [r0]
    mov r0, r6
    bl func_0206b648
    add r5, r5, #0x1
    cmp r5, r4
    blt .L_20
.L_44:
    ldr r0, [r6, #0x4]
    bl func_02053b88
    mov r0, r6
    bl func_0206b574
    ldmia sp!, {r4, r5, r6, pc}
