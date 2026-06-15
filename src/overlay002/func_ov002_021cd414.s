; func_ov002_021cd414 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce950
        .extern func_ov002_021b1f20
        .extern func_ov002_021b1fe8
        .extern func_ov002_0229ade0
        .global func_ov002_021cd414
        .arm
func_ov002_021cd414:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    ldr r0, _LIT0
    ldrh r4, [r1, #0x2]
    ldrh r0, [r0]
    ldrh lr, [r1, #0x4]
    ldr ip, _LIT1
    tst r0, #0x8000
    movne r0, #0x1
    mov r2, r4, asr #0x8
    moveq r0, #0x0
    ldrh r3, [r1, #0x6]
    tst lr, #0x8000
    and r1, r4, #0xff
    and r2, r2, #0xff
    and ip, lr, ip
    beq .L_2200
    add r0, r0, r1, lsl #0x1
    mov r1, r2
    mov r2, ip
    bl func_ov002_021b1fe8
    b .L_220c
.L_2200:
    str r3, [sp]
    mov r3, ip
    bl func_ov002_021b1f20
.L_220c:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x24
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word 0x00007fff
