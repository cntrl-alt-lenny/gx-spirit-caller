; func_ov002_021fdb18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .global func_ov002_021fdb18
        .arm
func_ov002_021fdb18:
    stmdb sp!, {r3, r4, r5, lr}
    ldrh r1, [r0, #0x2]
    mov r1, r1, lsl #0x14
    mov lr, r1, lsr #0x1a
    cmp lr, #0x1e
    addls pc, pc, lr, lsl #0x2
    b .L_388
    b .L_388
    b .L_388
    b .L_388
    b .L_388
    b .L_388
    b .L_388
    b .L_378
    b .L_378
    b .L_378
    b .L_388
    b .L_388
    b .L_378
    b .L_378
    b .L_388
    b .L_388
    b .L_388
    b .L_388
    b .L_388
    b .L_388
    b .L_388
    b .L_388
    b .L_388
    b .L_378
    b .L_388
    b .L_388
    b .L_378
    b .L_378
    b .L_378
    b .L_378
    b .L_378
    b .L_378
.L_378:
    ldr r1, [r0, #0x14]
    ldr r0, _LIT0
    and r4, r1, r0
    b .L_390
.L_388:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_390:
    ldr ip, _LIT1
    mov r3, #0x0
    ldr r5, [ip, #0x5d4]
    cmp r5, #0x0
    bls .L_464
    mov r2, ip
.L_3a8:
    ldrb r1, [ip, #0x5dc]
    cmp lr, r1
    bne .L_454
    cmp r1, #0x1e
    addls pc, pc, r1, lsl #0x2
    b .L_454
    b .L_454
    b .L_454
    b .L_454
    b .L_454
    b .L_454
    b .L_454
    b .L_43c
    b .L_43c
    b .L_43c
    b .L_454
    b .L_454
    b .L_43c
    b .L_43c
    b .L_454
    b .L_454
    b .L_454
    b .L_454
    b .L_454
    b .L_454
    b .L_454
    b .L_454
    b .L_454
    b .L_43c
    b .L_454
    b .L_454
    b .L_43c
    b .L_43c
    b .L_43c
    b .L_43c
    b .L_43c
    b .L_43c
.L_43c:
    add r1, r2, r3, lsl #0x2
    ldr r1, [r1, #0x5fc]
    and r1, r1, r0
    cmp r4, r1
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_454:
    add r3, r3, #0x1
    cmp r3, r5
    add ip, ip, #0x1
    bcc .L_3a8
.L_464:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x000001ff
_LIT1: .word data_ov002_022ce1a8
