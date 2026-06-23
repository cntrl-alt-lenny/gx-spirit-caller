; func_0203737c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02037328
        .extern func_02037730
        .global func_0203737c
        .arm
func_0203737c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r6, r1
    mov r7, r0
    mov r5, r2
    mov r4, r3
    mvn r1, #0x0
    bl func_02037328
    mov r1, r0
    mov r0, r7
    mov r2, r6
    mov r3, r5
    str r4, [sp]
    mov ip, #0x1
    str ip, [sp, #0x4]
    bl func_02037730
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
