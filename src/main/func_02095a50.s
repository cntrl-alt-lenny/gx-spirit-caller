; func_02095a50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a674c
        .extern data_021a6750
        .extern data_021a6754
        .extern data_021a6758
        .extern data_021a675c
        .extern data_021a6760
        .extern data_021a6764
        .extern data_021a6768
        .extern data_021a676c
        .extern data_021a67a0
        .extern data_021a6a20
        .extern data_021a7a20
        .extern data_021a8208
        .extern data_021a8280
        .extern func_02095418
        .extern func_02095678
        .extern func_02095838
        .extern func_02095880
        .extern func_02095c48
        .global func_02095a50
        .arm
func_02095a50:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    bl func_02095418
    ldr r3, _LIT0
    ldr r0, _LIT1
    mov r4, #0x0
    str r3, [r0]
    mov r1, r3
    mov r0, #0x18
.L_1f4:
    add r4, r4, #0x1
    mla r2, r4, r0, r1
    cmp r4, #0xff
    str r2, [r3], #0x18
    blt .L_1f4
    ldr r7, _LIT2
    mov sl, #0x0
    ldr r5, _LIT3
    ldr r4, _LIT4
    ldr lr, _LIT5
    ldr ip, _LIT6
    ldr r3, _LIT7
    ldr r1, _LIT8
    ldr r9, _LIT9
    ldr r6, _LIT10
    ldr r2, _LIT11
    mov r8, #0x1
    ldr r0, _LIT12
    ldr fp, _LIT13
    str r9, [r6]
    str sl, [r7, #0x7e8]
    str sl, [r5]
    str sl, [r4]
    str sl, [lr]
    str sl, [ip]
    str sl, [r3]
    str r8, [r2]
    str sl, [r1]
    str r0, [fp]
    bl func_02095c48
    mov r0, r8
    bl func_02095880
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
    mov r2, #0x1d
    mov r1, fp
    str r2, [r0, #0x4]
    ldr r1, [r1]
    str r1, [r0, #0x8]
    bl func_02095838
    mov r0, r8
    bl func_02095678
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_021a6a20
_LIT1: .word data_021a674c
_LIT2: .word data_021a7a20
_LIT3: .word data_021a6754
_LIT4: .word data_021a6758
_LIT5: .word data_021a6768
_LIT6: .word data_021a6760
_LIT7: .word data_021a6764
_LIT8: .word data_021a6750
_LIT9: .word data_021a8208
_LIT10: .word data_021a675c
_LIT11: .word data_021a676c
_LIT12: .word data_021a67a0
_LIT13: .word data_021a8280
