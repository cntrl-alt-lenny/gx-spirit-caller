; func_ov002_022b251c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0eb8
        .extern func_0207ef74
        .global func_ov002_022b251c
        .arm
func_ov002_022b251c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    ldr r6, _LIT0
    mov r3, r3, lsl #0xc
    ldr r5, _LIT1
    ldr r4, _LIT2
    mov sl, r0
    mov r9, r2
    str r6, [sp]
    strh r3, [sp, #0x4]
    and r8, r1, #0xff
    mov r7, #0x0
    add fp, sp, #0x0
.L_2208:
    ldr r0, [sp]
    ldrh r1, [sp, #0x4]
    and r2, r0, r4
    mov r0, r9, asr #0x6
    mov r3, sl, lsl #0x17
    orr r2, r2, r8
    orr r3, r2, r3, lsr #0x7
    and r1, r1, r6, asr #0x15
    add r0, r9, r0, lsr #0x19
    orr ip, r1, r0, asr #0x7
    mov r0, r5
    mov r1, fp
    mov r2, #0x1
    str r3, [sp]
    strh ip, [sp, #0x4]
    bl func_0207ef74
    add r7, r7, #0x1
    cmp r7, #0x4
    add sl, sl, #0x20
    add r9, r9, #0x100
    blt .L_2208
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x80004000
_LIT1: .word data_ov002_022d0eb8
_LIT2: .word 0xfe00ff00
