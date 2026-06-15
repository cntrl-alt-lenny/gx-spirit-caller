; func_02089768 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207d12c
        .extern func_0207dab4
        .extern func_020897ec
        .global func_02089768
        .arm
func_02089768:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r0, [r5]
    mov r1, #0x14
    mov r2, #0x4
    bl func_0207dab4
    movs r4, r0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, pc}
    bl func_020897ec
    mov r1, r4
    add r0, r5, #0x4
    bl func_0207d12c
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
