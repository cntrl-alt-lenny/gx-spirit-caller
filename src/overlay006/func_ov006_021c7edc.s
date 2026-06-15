; func_ov006_021c7edc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov006_021c9c54
        .global func_ov006_021c7edc
        .arm
func_ov006_021c7edc:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r0
    ldr r0, [r6, #0x7c]
    mov r5, r1
    cmp r0, #0x0
    mov r4, #0x0
    ble .L_1f4
    mov r7, r4
.L_19c:
    ldr r0, [r6, #0x78]
    mov r8, r7
    cmp r0, #0x0
    ble .L_1e4
.L_1ac:
    mov r0, r6
    mov r1, r8
    mov r2, r4
    bl func_ov006_021c9c54
    cmp r5, r0
    bne .L_1d4
    str r8, [r6, #0x80]
    str r4, [r6, #0x84]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1d4:
    ldr r0, [r6, #0x78]
    add r8, r8, #0x1
    cmp r8, r0
    blt .L_1ac
.L_1e4:
    ldr r0, [r6, #0x7c]
    add r4, r4, #0x1
    cmp r4, r0
    blt .L_19c
.L_1f4:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
