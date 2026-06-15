; func_0203b2f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_027e0000
        .extern data_027e0010
        .global func_0203b2f4
        .arm
func_0203b2f4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldrb lr, [r1, #0x2]
    ldrsh ip, [r1], #0x4
    cmp lr, #0x0
    blt .L_3b8
    cmp lr, #0x59
    blt .L_3bc
.L_3b8:
    mov lr, #0x0
.L_3bc:
    cmp r2, #0x0
    mov r5, #0x0
    ble .L_448
    mov sl, #0x8000
    ldr r3, _LIT0
    ldr r9, _LIT1
    ldr r8, _LIT2
    rsb sl, sl, #0x0
    mov r6, #0xb2
.L_3e0:
    tst r5, #0x7
    ldreq r4, [r1], #0x4
    and fp, r4, #0x7
    mla r7, fp, r6, r3
    mov fp, lr, lsl #0x1
    tst r4, #0x8
    ldrh r7, [fp, r7]
    beq .L_410
    sub ip, ip, r7
    cmp ip, sl
    movlt ip, sl
    b .L_41c
.L_410:
    add ip, ip, r7
    cmp ip, r9
    movgt ip, r9
.L_41c:
    and r7, r4, #0xf
    ldrsb r7, [r8, r7]
    adds lr, lr, r7
    movmi lr, #0x0
    bmi .L_438
    cmp lr, #0x59
    movge lr, #0x58
.L_438:
    mov r4, r4, asr #0x4
    add r5, r5, #0x1
    cmp r5, r2
    blt .L_3e0
.L_448:
    strh ip, [r0]
    strb lr, [r0, #0x2]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_027e0010
_LIT1: .word 0x00007fff
_LIT2: .word data_027e0000
