; func_0202bdf8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_PostLocked
        .extern data_020c69bc
        .extern data_02105dd8
        .extern func_0202b060
        .extern func_02038a84
        .extern func_02092800
        .extern func_02097db0
        .extern func_02097efc
        .extern func_02097f44
        .extern func_02098294
        .global func_0202bdf8
        .arm
func_0202bdf8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x48
    bl func_0202b060
    mov r6, r0
    ldr r8, _LIT0
    cmp r6, #0x0
    movgt r7, #0x20c
    movle r7, #0x0
    mul r5, r6, r8
    cmp r6, #0x0
    add r0, sp, #0x0
    movle r8, #0x640
    bl func_02098294
    ldr r1, _LIT1
    add r0, sp, #0x0
    bl func_02097f44
    mov r0, r8
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r4, r0
    add r1, r5, r7
    add r0, sp, #0x0
    mov r2, #0x0
    bl func_02097db0
    add r0, sp, #0x0
    mov r1, r4
    mov r2, r8
    bl func_02038a84
    add r0, sp, #0x0
    bl func_02097efc
    mov r1, r8
    mov r0, r4
    bl func_02092800
    ldr r2, _LIT2
    mov r0, r4
    ldrb r1, [r2, r6]
    orr r1, r1, #0x2
    strb r1, [r2, r6]
    add sp, sp, #0x48
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000434
_LIT1: .word data_020c69bc+0x4
_LIT2: .word data_02105dd8
