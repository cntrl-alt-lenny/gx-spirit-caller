; func_0206b7d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0205407c
        .global func_0206b7d8
        .arm
func_0206b7d8:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    add r1, sp, #0xc
    bl func_0205407c
    ldr r2, [sp, #0xc]
    ldr r3, [r4, #0x494]
    ldr ip, [r4, #0x488]
    mov r0, r4
    mov r1, #0x0
    blx ip
    ldmia sp!, {r4, lr}
    add sp, sp, #0x10
    bx lr
