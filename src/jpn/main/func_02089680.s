; func_02089680 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207d044
        .extern func_0207d9cc
        .extern func_02089704
        .global func_02089680
        .arm
func_02089680:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r0, [r5]
    mov r1, #0x14
    mov r2, #0x4
    bl func_0207d9cc
    movs r4, r0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, pc}
    bl func_02089704
    mov r1, r4
    add r0, r5, #0x4
    bl func_0207d044
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
