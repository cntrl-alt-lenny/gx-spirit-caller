; func_ov002_0229cde8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0229cdb8
        .global func_ov002_0229cde8
        .arm
func_ov002_0229cde8:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r2, #0x10
    mov r4, #0x0
    strb r4, [sp, #0xf]
    add r3, sp, #0x0
    sub r2, r2, #0x1
    ldr r5, _LIT0
    add r3, r3, r2
    mov r4, #0xa
.L_28:
    mov ip, r1, lsr #0x1f
    smull lr, r6, r5, r1
    add r6, ip, r6, asr #0x2
    smull ip, lr, r4, r6
    mov lr, r1
    sub r6, r1, ip
    add r6, r6, #0x30
    smull ip, r1, r5, lr
    mov ip, lr, lsr #0x1f
    sub r2, r2, #0x1
    strb r6, [r3, #-1]!
    adds r1, ip, r1, asr #0x2
    bne .L_28
    add r1, sp, #0x0
    add r1, r1, r2
    bl func_ov002_0229cdb8
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x66666667
