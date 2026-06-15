; func_ov016_021b7694 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov016_021b287c
        .global func_ov016_021b7694
        .arm
func_ov016_021b7694:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0xc
    mov r4, #0x0
    mov r3, #0x6
    mov r2, #0xda
    mov r1, #0x10
    mov r5, r0
    strh r3, [sp]
    strb r2, [sp, #0x4]
    strb r1, [sp, #0x5]
    strh r4, [sp, #0x6]
    strh r4, [sp, #0x8]
    mov r8, #0xc
    mov r6, r3
    add r7, sp, #0x0
    b .L_130
.L_10c:
    mov r0, r7
    strh r8, [sp, #0x2]
    bl func_ov016_021b287c
    cmp r0, #0x0
    addne sp, sp, #0xc
    movne r0, r4
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
    add r8, r8, #0x18
    add r4, r4, #0x1
.L_130:
    ldr r0, [r5, #0x8]
    cmp r0, #0x6
    movgt r0, r6
    cmp r4, r0
    blt .L_10c
    mvn r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
