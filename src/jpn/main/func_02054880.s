; func_02054880 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bec5c
        .extern data_020bec60
        .extern data_020bec64
        .extern func_020549bc
        .global func_02054880
        .arm
func_02054880:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r7, r1
    mov r6, r2
    mov sl, r0
    mov r4, r7
    mov r9, r6
    cmp r3, #0x1
    beq .L_2c
    cmp r3, #0x2
    beq .L_34
    b .L_3c
.L_2c:
    ldr r5, _LIT0
    b .L_40
.L_34:
    ldr r5, _LIT1
    b .L_40
.L_3c:
    ldr r5, _LIT2
.L_40:
    cmp r6, #0x0
    ble .L_78
    mov r8, #0x3
.L_4c:
    cmp r6, #0x3
    movge r2, r8
    movlt r2, r6
    mov r0, sl
    mov r1, r7
    bl func_020549bc
    sub r9, r9, #0x3
    cmp r9, #0x0
    add r7, r7, #0x4
    add sl, sl, #0x3
    bgt .L_4c
.L_78:
    ldr r1, _LIT3
    ldr r2, _LIT4
    smull r0, r3, r1, r6
    add r3, r3, r6, lsr #0x1f
    smull r0, r1, r2, r3
    sub r3, r6, r0
    mov r1, r7
    cmp r3, #0x1
    subeq r1, r7, #0x2
    beq .L_a8
    cmp r3, #0x2
    subeq r1, r7, #0x1
.L_a8:
    mov r0, #0x0
    strb r0, [r7]
    cmp r7, r4
    ldmlsia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_b8:
    sub r7, r7, #0x1
    cmp r7, r1
    ldrcssb r0, [r5, #0x2]
    strcsb r0, [r7]
    bcs .L_11c
    ldrsb r0, [r7]
    cmp r0, #0x19
    addle r0, r0, #0x41
    strleb r0, [r7]
    ble .L_11c
    cmp r0, #0x33
    addle r0, r0, #0x47
    strleb r0, [r7]
    ble .L_11c
    cmp r0, #0x3d
    suble r0, r0, #0x4
    strleb r0, [r7]
    ble .L_11c
    cmp r0, #0x3e
    ldreqsb r0, [r5]
    streqb r0, [r7]
    beq .L_11c
    cmp r0, #0x3f
    ldreqsb r0, [r5, #0x1]
    streqb r0, [r7]
.L_11c:
    cmp r7, r4
    bhi .L_b8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_020bec5c
_LIT1: .word data_020bec60
_LIT2: .word data_020bec64
_LIT3: .word 0x55555556
_LIT4: .word 0x00000003
