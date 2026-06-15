; func_020414b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe8d4
        .global func_020414b0
        .arm
func_020414b0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    movs r5, r2
    add r0, r0, #0x1000
    ldr r2, [r0, #0x10]
    mov r4, r1
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, pc}
    ldr r0, _LIT0
    mov r1, r5
    blx r2
    str r0, [r4]
    ldr r0, [r4]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, pc}
    str r0, [r4, #0x4]
    str r5, [r4, #0xc]
    ldr r2, [r4]
    ldr r1, [r4, #0xc]
    mov r0, #0x1
    add r1, r2, r1
    str r1, [r4, #0x8]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_020fe8d4
