; func_0206b670 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02053e58
        .extern func_020540d0
        .extern func_0206b6bc
        .global func_0206b670
        .arm
func_0206b670:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r5, r1
    bl func_020540d0
    ldr r4, [r0]
    ldr r3, [r6, #0x494]
    ldr ip, [r6, #0x488]
    mov r0, r6
    mov r2, r4
    mov r1, #0x2
    blx ip
    ldr r0, [r6, #0x4]
    mov r1, r5
    bl func_02053e58
    mov r0, r6
    mov r1, r4
    bl func_0206b6bc
    ldmia sp!, {r4, r5, r6, pc}
