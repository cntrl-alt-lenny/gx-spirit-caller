; func_020897fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207cfc8
        .extern func_0207d12c
        .extern func_0207dab4
        .global func_020897fc
        .arm
func_020897fc:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r1
    mov r8, r0
    add r0, r7, #0x1f
    bic r1, r0, #0x1f
    mov r6, r2
    ldr r0, [r8]
    add r1, r1, #0x20
    mov r2, #0x20
    mov r5, r3
    bl func_0207dab4
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    add r0, r8, #0x4
    mov r1, #0x0
    bl func_0207cfc8
    str r7, [r4, #0x8]
    str r6, [r4, #0xc]
    ldr r2, [sp, #0x18]
    str r5, [r4, #0x10]
    mov r1, r4
    str r2, [r4, #0x14]
    bl func_0207d12c
    add r0, r4, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
