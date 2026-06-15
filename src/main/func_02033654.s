; func_02033654 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02053170
        .global func_02033654
        .arm
func_02033654:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr r0, [r7, #0xeac]
    mov r5, #0x0
    mov r4, r5
    cmp r0, #0x0
    ble .L_80
    mov r6, r5
.L_58:
    ldr r0, [r7, #0xe7c]
    add r0, r0, r6
    bl func_02053170
    cmp r0, #0x0
    ldr r0, [r7, #0xeac]
    add r4, r4, #0x1
    addne r5, r5, #0x1
    cmp r4, r0
    add r6, r6, #0xc
    blt .L_58
.L_80:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
