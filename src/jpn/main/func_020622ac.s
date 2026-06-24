; func_020622ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02062ba4
        .global func_020622ac
        .arm
func_020622ac:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r2, [r5, #0x14]
    mov r4, r1
    cmp r2, #0x0
    movne r0, #0x0
    addne sp, sp, #0x4
    strne r0, [r5, #0x14]
    ldmneia sp!, {r4, r5, pc}
    mov r2, #0x0
    str r2, [r5, #0x14]
    ldr r1, [r5, #0xc]
    cmp r1, #0x4
    addne sp, sp, #0x4
    movne r0, r2
    ldmneia sp!, {r4, r5, pc}
    bl func_02062ba4
    mov r0, #0x5
    cmp r4, #0x0
    str r0, [r5, #0xc]
    addne ip, r5, #0x28
    ldmneia r4, {r0, r1, r2, r3}
    stmneia ip, {r0, r1, r2, r3}
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
