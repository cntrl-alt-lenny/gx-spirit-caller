; func_0205c670 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0205a078
        .extern func_0205bdec
        .global func_0205c670
        .arm
func_0205c670:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14
    mov r2, #0x0
    str r2, [sp]
    mov r4, r1
    str r2, [sp, #0x4]
    add r3, sp, #0xc
    mov r1, #0x2
    mov r5, r0
    str r2, [sp, #0x8]
    bl func_0205bdec
    cmp r0, #0x0
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, pc}
    ldr r0, [sp, #0xc]
    ldr r1, [r4, #0xc]
    ldr r2, [r0, #0x18]
    mov r0, r5
    bl func_0205a078
    cmp r0, #0x0
    moveq r0, #0x65
    streq r0, [r4]
    moveq r0, #0x0
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, pc}
