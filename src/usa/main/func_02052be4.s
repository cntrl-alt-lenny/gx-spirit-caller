; func_02052be4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02053308
        .extern func_02053414
        .extern func_020535dc
        .extern func_02053614
        .extern func_02053698
        .global func_02052be4
        .arm
func_02052be4:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x24
    mov r4, r1
    mov r5, r0
    mov r0, r4
    bl func_02053614
    cmp r0, #0x3
    bne .L_30
    mov r0, r4
    bl func_020535dc
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, pc}
.L_30:
    mov r0, r4
    bl func_02053614
    cmp r0, #0x2
    bne .L_58
    mov r0, r4
    bl func_02053698
    add r2, sp, #0x0
    bl func_02053414
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, pc}
.L_58:
    mov r0, r4
    bl func_02053614
    cmp r0, #0x1
    addne sp, sp, #0x24
    ldmneia sp!, {r4, r5, pc}
    ldr r1, [r5, #0x24]
    add r2, sp, #0xd
    mov r0, r4
    bl func_02053308
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, pc}
