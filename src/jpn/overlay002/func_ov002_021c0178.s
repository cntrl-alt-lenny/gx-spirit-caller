; func_ov002_021c0178 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021b9dec
        .extern func_ov002_021bd5e8
        .global func_ov002_021c0178
        .arm
func_ov002_021c0178:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r6, r0
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r6, #0x1
    mla r5, r1, r0, r2
    ldr r9, _LIT2
    ldr r8, _LIT3
    ldr r7, _LIT4
    mov r4, #0x0
.L_330:
    mov r0, r6
    mov r1, r4
    bl func_ov002_021b9dec
    cmp r0, #0x0
    beq .L_3a0
    ldr ip, [r5, #0x40]
    ldrh r1, [r5, #0x38]
    mov r3, ip, lsr #0x6
    mov r2, ip, lsr #0x2
    and r3, r3, #0x1
    orr r2, r2, ip, lsr #0x1
    mvn r3, r3
    and r2, r2, #0x1
    and r3, r1, r3
    mvn r1, r2
    tst r3, r1
    beq .L_398
    cmp r0, r8
    beq .L_388
    cmp r0, r7
    beq .L_3a0
    b .L_398
.L_388:
    mov r0, r9
    bl func_ov002_021bd5e8
    cmp r0, #0x0
    bne .L_3a0
.L_398:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_3a0:
    add r4, r4, #0x1
    cmp r4, #0x5
    add r5, r5, #0x14
    blt .L_330
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word 0x000010f4
_LIT3: .word 0x000013cd
_LIT4: .word 0x0000164e
