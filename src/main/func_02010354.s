; func_02010354 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0218cbc8
        .extern data_0218dbc8
        .global func_02010354
        .arm
func_02010354:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr ip, _LIT1
    ldr r2, [r1, #0x910]
    cmp r2, #0x0
    addeq r0, ip, #0x1000
    ldreq r0, [r0, #0x930]
    ldmeqia sp!, {r3, pc}
    add r1, ip, #0x1000
    ldr r3, [r1, #0x930]
    ldr r1, [r2, #0xc]
    ldr r0, [r0, #0x4]
    rsb r1, r3, r1, lsr #0xc
    cmp r0, r1
    bls .L_62c
    ldr lr, [r2]
    cmp lr, #0x0
    beq .L_608
.L_5dc:
    ldr r3, [r2, #0xc]
    ldr r2, [r2, #0x10]
    ldr r1, [lr, #0xc]
    add r3, r2, r3, lsr #0xc
    rsb r1, r3, r1, lsr #0xc
    cmp r0, r1
    bls .L_62c
    mov r2, lr
    ldr lr, [lr]
    cmp lr, #0x0
    bne .L_5dc
.L_608:
    add r1, ip, #0x1000
    ldr r3, [r2, #0xc]
    ldr r2, [r2, #0x10]
    ldr r1, [r1, #0x934]
    add r3, r2, r3, lsr #0xc
    sub r1, r1, r3
    cmp r0, r1
    movhi r0, #0x80000
    ldmhiia sp!, {r3, pc}
.L_62c:
    tst r3, #0xf
    addne r0, r3, #0xe
    bicne r3, r0, #0xf
    mov r0, r3
    ldmia sp!, {r3, pc}
_LIT0: .word data_0218dbc8
_LIT1: .word data_0218cbc8
