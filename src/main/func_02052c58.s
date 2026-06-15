; func_02052c58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0205337c
        .extern func_02053488
        .extern func_02053650
        .extern func_02053688
        .extern func_0205370c
        .global func_02052c58
        .arm
func_02052c58:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x24
    mov r4, r1
    mov r5, r0
    mov r0, r4
    bl func_02053688
    cmp r0, #0x3
    bne .L_30
    mov r0, r4
    bl func_02053650
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, pc}
.L_30:
    mov r0, r4
    bl func_02053688
    cmp r0, #0x2
    bne .L_58
    mov r0, r4
    bl func_0205370c
    add r2, sp, #0x0
    bl func_02053488
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, pc}
.L_58:
    mov r0, r4
    bl func_02053688
    cmp r0, #0x1
    addne sp, sp, #0x24
    ldmneia sp!, {r4, r5, pc}
    ldr r1, [r5, #0x24]
    add r2, sp, #0xd
    mov r0, r4
    bl func_0205337c
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, pc}
