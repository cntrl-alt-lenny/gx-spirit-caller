; func_ov002_021d5e3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b3414
        .extern func_ov002_021b3538
        .extern func_ov002_021d59c4
        .extern func_ov002_021d5c68
        .global func_ov002_021d5e3c
        .arm
func_ov002_021d5e3c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r5, r0
    mov r0, r5, asr #0x8
    and r6, r5, #0xff
    and r7, r0, #0xff
    mov r4, r1
    mov r0, r6
    mov r1, r7
    bl func_ov002_021b3538
    ldr r1, _LIT0
    cmp r0, r1
    moveq r7, #0xa
    beq .L_240
    mov r1, r0, asr #0x8
    and r8, r0, #0xff
    and r9, r1, #0xff
    mov r0, r8
    mov r1, r9
    mov r2, r6
    mov r3, r7
    bl func_ov002_021b3414
    mov r7, r0
    mov r0, r8
    mov r1, r9
    mov r2, r5
    mov r3, #0x1
    bl func_ov002_021d59c4
.L_240:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    mov r3, r7
    bl func_ov002_021d5c68
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x0000ffff
