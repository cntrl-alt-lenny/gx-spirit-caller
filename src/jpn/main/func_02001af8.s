; func_02001af8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b45ec
        .extern data_020c3bf8
        .extern data_02102c24
        .extern func_02001b84
        .extern func_02006bf0
        .extern func_02091554
        .global func_02001af8
        .arm
func_02001af8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x20
    mov sl, r0
    bl func_02001b84
    mov r9, #0x0
    ldr r4, _LIT0
    ldr r6, _LIT1
    ldr r5, _LIT2
    mov fp, #0x1
    mov r8, r9
    add r7, sp, #0x0
.L_b5c:
    mov r0, sl, asr r9
    tst r0, #0x1
    beq .L_b9c
    mov r0, r8
    cmp r9, #0x5
    movge r0, fp
    ldr r1, [r6, r0, lsl #0x2]
    ldr r2, [r5, r9, lsl #0x3]
    mov r0, r7
    bl func_02091554
    mov r0, r7
    mov r1, #0x4
    mov r2, #0x2
    bl func_02006bf0
    cmp r0, #0x0
    strne r0, [r4, r9, lsl #0x3]
.L_b9c:
    add r9, r9, #0x1
    cmp r9, #0x9
    blt .L_b5c
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02102c24
_LIT1: .word data_020c3bf8
_LIT2: .word data_020b45ec
