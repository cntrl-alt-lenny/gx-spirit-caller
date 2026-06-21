; func_ov002_021c1954 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1ac
        .extern func_02031764
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bbd04
        .global func_ov002_021c1954
        .arm
func_ov002_021c1954:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r3, _LIT0
    and r5, r4, #0x1
    mov r2, #0x14
    mul ip, r5, r3
    ldr r5, _LIT1
    ldr r3, _LIT2
    mul r2, r1, r2
    add r5, r5, ip
    ldr lr, [r2, r5]
    add ip, r3, ip
    mov r5, lr, lsr #0x6
    mov r3, lr, lsr #0x2
    and r5, r5, #0x1
    orr r3, r3, lr, lsr #0x1
    and r3, r3, #0x1
    ldrh ip, [r2, ip]
    mvn r5, r5
    mvn r2, r3
    and r3, ip, r5
    tst r3, r2
    beq .L_16c8
    bl func_ov002_021b9ecc
    mov r5, r0
    bl func_02031764
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT3
    cmp r5, r1
    addne r0, r1, #0x42
    cmpne r5, r0
    addne r0, r1, #0x7c
    cmpne r5, r0
    bne .L_16c8
    mov r0, r4
    mov r1, #0x3
    bl func_ov002_021bbd04
    cmp r0, #0x0
    bne .L_16c0
    rsb r0, r4, #0x1
    mov r1, #0x3
    bl func_ov002_021bbd04
    cmp r0, #0x0
    beq .L_16c8
.L_16c0:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_16c8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1ac
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word 0x000017e4
