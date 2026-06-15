; func_0202befc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_PostLocked
        .extern data_020c6ab4
        .extern func_0202b0b4
        .extern func_02038ad4
        .extern func_020928e8
        .extern func_02097ea4
        .extern func_02097ff0
        .extern func_02098038
        .extern func_02098388
        .global func_0202befc
        .arm
func_0202befc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x48
    bl func_0202b0b4
    mov r7, #0x124
    cmp r0, #0x0
    movgt r6, #0x20c
    movle r6, #0x0
    mul r5, r0, r7
    cmp r0, #0x0
    add r0, sp, #0x0
    movle r7, #0x330
    bl func_02098388
    ldr r1, _LIT0
    add r0, sp, #0x0
    bl func_02098038
    mov r0, r7
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r4, r0
    add r0, sp, #0x0
    add r1, r5, r6
    mov r2, #0x0
    bl func_02097ea4
    add r0, sp, #0x0
    mov r1, r4
    mov r2, r7
    bl func_02038ad4
    add r0, sp, #0x0
    bl func_02097ff0
    mov r1, r7
    mov r0, r4
    bl func_020928e8
    mov r0, r4
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_020c6ab4
