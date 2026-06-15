; func_ov006_021c9bc8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov006_021c9bc8
        .arm
func_ov006_021c9bc8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r9, [r0, #0x7c]
    mov r5, #0x0
    cmp r9, #0x0
    ble .L_c18
    ldr r6, [r0, #0x8c]
    mov lr, r5
.L_bb4:
    cmp r2, r6
    blt .L_c08
    add ip, r6, #0x13
    cmp r2, ip
    bgt .L_c08
    ldr r8, [r0, #0x78]
    mov r4, lr
    cmp r8, #0x0
    ble .L_c08
    ldr r7, [r0, #0x88]
.L_bdc:
    cmp r1, r7
    blt .L_bf8
    add ip, r7, #0x13
    cmp r1, ip
    movle r0, #0x1
    stmleia r3, {r0, r4, r5}
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_bf8:
    add r4, r4, #0x1
    cmp r4, r8
    add r7, r7, #0x14
    blt .L_bdc
.L_c08:
    add r5, r5, #0x1
    cmp r5, r9
    add r6, r6, #0x14
    blt .L_bb4
.L_c18:
    mov r0, #0x0
    str r0, [r3]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
