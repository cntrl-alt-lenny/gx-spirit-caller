; func_0203b9d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219cf90
        .extern data_0219cfa8
        .extern func_0203c0ec
        .extern func_0207d044
        .extern func_020918f0
        .global func_0203b9d4
        .arm
func_0203b9d4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r2
    mov r5, r3
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r4, [sp, #0x14]
    ldrsh r0, [r4, #0xba]
    cmp r0, #0x3
    blt .L_1d4
    ldr r0, _LIT0
    bl func_020918f0
    ldmia sp!, {r4, r5, r6, pc}
.L_1d4:
    bl func_0203c0ec
    movs r1, r0
    beq .L_20c
    str r4, [r1, #0x8]
    ldr r2, [r6]
    ldr r0, _LIT1
    str r2, [r1, #0xc]
    ldr r2, [r6, #0x4]
    str r2, [r1, #0x10]
    str r5, [r1, #0x14]
    ldrsh r2, [r4, #0xba]
    add r2, r2, #0x1
    strh r2, [r4, #0xba]
    bl func_0207d044
.L_20c:
    ldr r0, _LIT0
    bl func_020918f0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219cfa8
_LIT1: .word data_0219cf90
