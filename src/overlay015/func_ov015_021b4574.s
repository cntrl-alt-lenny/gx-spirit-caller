; func_ov015_021b4574 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern data_ov015_021b5e28
        .extern data_ov015_021b5e44
        .extern func_ov015_021b23f4
        .extern func_ov015_021b2480
        .extern func_ov015_021b2488
        .global func_ov015_021b4574
        .arm
func_ov015_021b4574:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0, #0x864]
    bl func_ov015_021b2480
    ldr r1, _LIT0
    mov r5, r0
    ldr r0, [r1, #0x864]
    bl func_ov015_021b2488
    ldr r2, _LIT2
    mov r1, #0x0
    cmp r0, #0x0
    ldrh r3, [r2, #0x54]
    movlt r0, r1
    tst r3, #0x2
    beq .L_180
    ldr r0, [r4, #0xa84]
    orr r0, r0, #0x4
    str r0, [r4, #0xa84]
    b .L_228
.L_180:
    ldrh ip, [r2, #0x52]
    tst ip, #0x40
    beq .L_1cc
    add r2, r4, #0xa00
    ldrsh r3, [r2, #0x30]
    cmp r3, r5
    ble .L_1cc
    ldrh r0, [r2, #0x34]
    mov r1, #0x1
    sub r0, r3, r0
    strh r0, [r2, #0x30]
    ldrsh r0, [r2, #0x30]
    cmp r0, r5
    add r0, r4, #0xa00
    strlth r5, [r2, #0x30]
    ldrh r2, [r0, #0x36]
    add r2, r2, #0x1
    strh r2, [r0, #0x36]
    b .L_228
.L_1cc:
    tst ip, #0x80
    beq .L_214
    add r2, r4, #0xa00
    ldrsh r3, [r2, #0x30]
    cmp r3, r0
    bge .L_214
    ldrh r1, [r2, #0x34]
    add r1, r3, r1
    strh r1, [r2, #0x30]
    ldrsh r1, [r2, #0x30]
    cmp r1, r0
    strgth r0, [r2, #0x30]
    add r0, r4, #0xa00
    ldrh r2, [r0, #0x36]
    mov r1, #0x1
    add r2, r2, #0x1
    strh r2, [r0, #0x36]
    b .L_228
.L_214:
    add r0, r4, #0xa00
    mov r3, #0x1
    mov r2, #0x0
    strh r3, [r0, #0x34]
    strh r2, [r0, #0x36]
.L_228:
    add r0, r4, #0xa00
    ldrh r2, [r0, #0x36]
    cmp r2, #0xa
    bls .L_25c
    ldrh r3, [r0, #0x34]
    mov r2, #0x0
    strh r2, [r0, #0x36]
    add r2, r3, #0x1
    strh r2, [r0, #0x34]
    ldrh r2, [r0, #0x34]
    cmp r2, #0xe
    movhi r2, #0xe
    strhih r2, [r0, #0x34]
.L_25c:
    cmp r1, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    add r0, r4, #0xa00
    ldrsh r1, [r0, #0x30]
    ldr r0, [r4, #0x848]
    bl func_ov015_021b23f4
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov015_021b5e28
_LIT1: .word data_ov015_021b5e44
_LIT2: .word data_02104bac
