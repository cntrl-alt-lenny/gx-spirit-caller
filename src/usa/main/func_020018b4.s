; func_020018b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b45ec
        .extern data_020c3be8
        .extern data_02102c24
        .extern func_02001b84
        .extern func_02006bf0
        .extern func_02091554
        .global func_020018b4
        .arm
func_020018b4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x24
    str r0, [sp]
    bl func_02001b84
    mov r9, #0x0
    ldr r6, _LIT0
    mov fp, #0x1
    add r7, sp, #0x4
    mov r8, r9
.L_910:
    ldr r0, [sp]
    mov r0, r0, asr r9
    tst r0, #0x1
    beq .L_974
    ldr r0, _LIT1
    mov sl, #0x0
    add r4, r0, r9, lsl #0x3
    ldr r0, _LIT2
    add r5, r0, r9, lsl #0x3
.L_934:
    mov r0, r8
    cmp r9, #0x5
    movge r0, fp
    ldr r1, [r6, r0, lsl #0x2]
    ldr r2, [r5, sl, lsl #0x2]
    mov r0, r7
    bl func_02091554
    mov r0, r7
    mov r1, #0x4
    mov r2, #0x2
    bl func_02006bf0
    cmp r0, #0x0
    strne r0, [r4, sl, lsl #0x2]
    add sl, sl, #0x1
    cmp sl, #0x2
    blt .L_934
.L_974:
    add r9, r9, #0x1
    cmp r9, #0x9
    blt .L_910
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020c3be8
_LIT1: .word data_02102c24
_LIT2: .word data_020b45ec
