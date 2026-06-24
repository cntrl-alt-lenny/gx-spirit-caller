; func_0206b5fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02053de4
        .extern func_0205405c
        .extern func_0206b648
        .global func_0206b5fc
        .arm
func_0206b5fc:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r5, r1
    bl func_0205405c
    ldr r4, [r0]
    ldr r3, [r6, #0x494]
    ldr ip, [r6, #0x488]
    mov r0, r6
    mov r2, r4
    mov r1, #0x2
    blx ip
    ldr r0, [r6, #0x4]
    mov r1, r5
    bl func_02053de4
    mov r0, r6
    mov r1, r4
    bl func_0206b648
    ldmia sp!, {r4, r5, r6, pc}
