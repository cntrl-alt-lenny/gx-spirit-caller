; func_0202bea8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_PostLocked
        .extern data_020c69d4
        .extern func_0202b060
        .extern func_02038a84
        .extern func_02092800
        .extern func_02097db0
        .extern func_02097efc
        .extern func_02097f44
        .extern func_02098294
        .global func_0202bea8
        .arm
func_0202bea8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x48
    bl func_0202b060
    mov r7, #0x124
    cmp r0, #0x0
    movgt r6, #0x20c
    movle r6, #0x0
    mul r5, r0, r7
    cmp r0, #0x0
    add r0, sp, #0x0
    movle r7, #0x330
    bl func_02098294
    ldr r1, _LIT0
    add r0, sp, #0x0
    bl func_02097f44
    mov r0, r7
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r4, r0
    add r0, sp, #0x0
    add r1, r5, r6
    mov r2, #0x0
    bl func_02097db0
    add r0, sp, #0x0
    mov r1, r4
    mov r2, r7
    bl func_02038a84
    add r0, sp, #0x0
    bl func_02097efc
    mov r1, r7
    mov r0, r4
    bl func_02092800
    mov r0, r4
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_020c69d4
